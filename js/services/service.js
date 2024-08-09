'use strict';
app.factory('authInterceptor', function ($q, $window, $location, $cookieStore, $rootScope,$timeout) {
    return {
        request: function (config) {
            $rootScope.adminRole = $cookieStore.get('session_iFkUserTypeId');
            if ($cookieStore.get('auth')) {
                config.headers['Authorization'] = $cookieStore.get('auth');
            }
            return config;
        },
        responseError: function (rejection) {
            (rejection);
            if (rejection.status === 401) {
                $window.sessionStorage.clear();
                $window.localStorage.clear();
                angular.forEach(["session_iUserId", "auth", "session_iFkUserTypeId", "session_vEmailAddress", "session_password"], function (key) {
                    $cookieStore.remove(key);
                });
                $timeout(function () {
                    $location.path('/');
                }, 1000);
            }
            return $q.reject(rejection);
        }
    };
});

// Need set url REST Api in controller!
app.service('rest', function ($http, $location,$routeParams) {
    return {
        baseUrl: 'api/v1/',
        path: undefined,
        // id:null,
        get: function () {
            return $http.get(this.baseUrl + this.path);
        },
        model: function () {
            return $http.get(this.baseUrl + this.path + "/" + $routeParams.id);
        },
        post: function (model) {
            return $http.post(this.baseUrl + this.path, model);
        },
        put: function (model) {
            return $http.put(this.baseUrl + this.path + "/" + $routeParams.id, model);
        },
        delete: function () {
            return $http.delete(this.baseUrl + this.path);
        }
    };
});
//file reader
app.factory('fileReader', function ($q, $log) {
    var onLoad = function (reader, deferred, scope) {
        return function () {
            scope.$apply(function () {
                deferred.resolve(reader.result);
            });
        };
    };

    var onError = function (reader, deferred, scope) {
        return function () {
            scope.$apply(function () {
                deferred.reject(reader.result);
            });
        };
    };

    var onProgress = function (reader, scope) {
        return function (event) {
            scope.$broadcast("fileProgress", {
                total: event.total,
                loaded: event.loaded
            });
        };
    };

    var getReader = function (deferred, scope) {
        var reader = new FileReader();
        reader.onload = onLoad(reader, deferred, scope);
        reader.onerror = onError(reader, deferred, scope);
        reader.onprogress = onProgress(reader, scope);
        return reader;
    };

    var readAsDataURL = function (file, scope) {
        var deferred = $q.defer();
        var reader = getReader(deferred, scope);
        reader.readAsDataURL(file);
        return deferred.promise;
    };

    return {
        readAsDataUrl: readAsDataURL
    };
});

//page scroll
app.service('anchorSmoothScroll', function() {

    this.scrollTo = function(eID) {

        // This scrolling function 
        // is from http://www.itnewb.com/tutorial/Creating-the-Smooth-Scroll-Effect-with-JavaScript

        var startY = currentYPosition();
        var stopY = elmYPosition(eID);
        var distance = stopY > startY ? stopY - startY : startY - stopY;
        if (distance < 100) {
            scrollTo(0, stopY);
            return;
        }
        var speed = Math.round(distance / 100);
        if (speed >= 20) speed = 20;
        var step = Math.round(distance / 25);
        var leapY = stopY > startY ? startY + step : startY - step;
        var timer = 0;
        if (stopY > startY) {
            for (var i = startY; i < stopY; i += step) {
                setTimeout("window.scrollTo(0, " + leapY + ")", timer * speed);
                leapY += step;
                if (leapY > stopY) leapY = stopY;
                timer++;
            }
            return;
        }
        for (var i = startY; i > stopY; i -= step) {
            setTimeout("window.scrollTo(0, " + leapY + ")", timer * speed);
            leapY -= step;
            if (leapY < stopY) leapY = stopY;
            timer++;
        }

        function currentYPosition() {
            // Firefox, Chrome, Opera, Safari
            if (self.pageYOffset) return self.pageYOffset;
            // Internet Explorer 6 - standards mode
            if (document.documentElement && document.documentElement.scrollTop)
                return document.documentElement.scrollTop;
            // Internet Explorer 6, 7 and 8
            if (document.body.scrollTop) return document.body.scrollTop;
            return 0;
        }

        function elmYPosition(eID) {
            var elm = document.getElementById(eID);
            var y = elm.offsetTop;
            var node = elm;
            while (node.offsetParent && node.offsetParent != document.body) {
                node = node.offsetParent;
                y += node.offsetTop;
            }
            return y;
        }

    };

});
app.factory('allLanguages', function($http, $location,$q, $routeParams,rest, $cookieStore) {
    var allLanguages = [];
    //var deferred = $q.defer();
    rest.path = 'allLanguages';
    rest.get().success(function(data) {
        angular.forEach(data, function(val, i) {
            var langName = JSON.stringify('<span style="color:green;">'+val.name+'</span>');
            allLanguages.push({
                //'id': val.lang_id,
                'id': val.id,
                //'title': val.name,
                'title': val.title,
                'name': val.title,
                'flagImg': 'assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/'+val.flagImg,
                'flagTitle': val.flagTitle,
                'is_favourite': val.is_favourite,
            });
        });
        //deferred.resolve(allLanguages);
    }).error(function(data, error, status) {
        //deferred.resolve(allLanguages);
    });
    //return deferred.promise;
    
    return allLanguages;
});
app.factory('LanguageService', function($http, $q, rest) {
    return {
        getAllLanguages: function() {
            var deferred = $q.defer();

            rest.path = 'allLanguages';
            rest.get().then(function(response) {
                var allLanguages = [];
                angular.forEach(response.data, function(val) {
                    allLanguages.push({
                        'id': val.id,
                        'title': val.title,
                        'name': val.title,
                        'flagImg': 'assets/vendor/Polyglot-Language-Switcher-2-master/images/flags/' + val.flagImg,
                        'flagTitle': val.flagTitle,
                        'is_favourite': val.is_favourite,
                    });
                });
                deferred.resolve(allLanguages);
            }).catch(function(error) {
                deferred.reject('Error fetching languages: ' + error.statusText);
            });

            return deferred.promise;
        }
    };
});

// 
app.factory('invoiceDuePeriodDays', function($http, $location, $routeParams,rest) {
    var duePeriodDays = 30;
    rest.path = "getOneInvoicePeriod/" + 1;
    rest.get().success(function(data) {
        duePeriodDays = data.number_of_days ? data.number_of_days : 30;
    }).error(function(data, error, status) {});
    return duePeriodDays;
});

app.factory('maangerListService', function($http, $q, rest) {
    return {
        getAllData: function() {
            var deferred = $q.defer();
            var allManagerList = [];
            rest.path = 'userManager/2';
            rest.get().then(function(response) {
                //var allManagerList = response?.data || [];
                angular.forEach(response.data.data, function(value) {
                    var obj = {
                        'id': value.iUserId,
                        'text': value.vFirstName + ' ' + value.vLastName
                    };
                    allManagerList.push(obj);
                })
                deferred.resolve(allManagerList);
            }).catch(function(error) {
                deferred.reject('Error fetching daa: ' + error );
            });

            return deferred.promise;
        }
    };
});
app.factory('coordinatorListService', function($http, $q, rest) {
    return {
        getAllData: function() {
            var deferred = $q.defer();
            var allManagerList = [];
            rest.path = 'userCoordinator/3';
            rest.get().then(function(response) {
                //var allManagerList = response?.data || [];
                angular.forEach(response.data.data, function(value) {
                    var obj = {
                        'id': value.iUserId,
                        'text': value.vFirstName + ' ' + value.vLastName
                    };
                    allManagerList.push(obj);
                })
                deferred.resolve(allManagerList);
            }).catch(function(error) {
                deferred.reject('Error fetching daa: ' + error );
            });

            return deferred.promise;
        }
    };
});

app.factory('select2userListService', function($http, $q, rest) {
    var cache = {
        managers: null,
        qaSpecialist: null,
        coordinators: null,
        scoopStatus: null,
    };

    function fetchData(path, cacheKey) {
        var deferred = $q.defer();
        if (cache[cacheKey]) {
            // Return cached data if available
            deferred.resolve(cache[cacheKey]);
        } else {
            rest.path = path;
            rest.get().then(function(response) {
                var allData = response.data.data.map(function(value) {
                    return {
                        id: value.iUserId,
                        text: value.vFirstName + ' ' + value.vLastName
                    };
                });
                cache[cacheKey] = allData;
                deferred.resolve(allData);
            }).catch(function(error) {
                deferred.reject('Error fetching data: ' + error);
            });
        }
        return deferred.promise;
    }

    return {
        getManagers: function() {
            return fetchData('userManager/2', 'managers');
        },
        getQaSpecialist: function() {
            return fetchData('userQaSpecialist/4', 'qaSpecialist');
        },
        getCoordinators: function() {
            return fetchData('userCoordinator/3', 'coordinators');
        },
        getScoopstatus: function() {
            return fetchData('scoopdetailItemStatusGet', 'scoopStatus');
        }
    };
});

app.factory('select2scoopStatusService', function($http, $q, rest) {
    var cache = {
        scoopStatus: null,
    };

    function fetchData(path, cacheKey) {
        var deferred = $q.defer();
        if (cache[cacheKey]) {
            // Return cached data if available
            deferred.resolve(cache[cacheKey]);
        } else {
            rest.path = path;
            rest.get().then(function(response) {
                var allData = response.data.map(function(value) {
                    return {
                        'id': value.item_status_id,
                        'text': value.item_status_name
                    };
                });
                cache[cacheKey] = allData;
                deferred.resolve(allData);
            }).catch(function(error) {
                deferred.reject('Error fetching data: ' + error);
            });
        }
        return deferred.promise;
    }

    return {
        getScoopstatus: function() {
            return fetchData('scoopdetailItemStatusGet', 'scoopStatus');
        }
    };
});
