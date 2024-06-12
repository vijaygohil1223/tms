app.filter('typeFilter', [function() {
    return function(investments, filtered) {

        if (!angular.isUndefined(investments) && !angular.isUndefined(filtered) && filtered.length > 0) {
            var tempClients = [];
            angular.forEach(filtered, function(filter) {
                angular.forEach(investments, function(invest) {
                    if (angular.equals(invest.type, filter.type)) {
                        tempClients.push(invest);
                    }
                });
            });
            return tempClients;
        } else {
            return investments;
        }
    };
}]);
app.filter('toNumber', function() {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            return 'No minimum(without restriction)';
        } else {
            return input.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
    }
});
app.filter('dateFormat', function() {
    return function(input) {
        var d = new Date(input);
        return (d.getDate().toString().length > 1 ? d.getDate() : '0' + d.getDate()) + "." +
            ((d.getMonth() + 1).toString().length > 1 ? (d.getMonth() + 1) : '0' + (d.getMonth() + 1)) + "." +
            d.getFullYear() + " ";
        // + d.getHours() + ":"  
        // + d.getMinutes() + ":" 
        // + d.getSeconds();
    }
});
app.filter('globalDtFormat', function($window) {
    return function(input) {
       let momnt = moment(input).format($window.localStorage.getItem('global_dateFormat'));
       let momntDt = momnt!='Invalid date' ? momnt : ''; 
       return momntDt;
    }
});
app.filter('dateFormat1', function() {
    return function(input) {
        var d = new Date(input);
        return (d.getDate().toString().length > 1 ? d.getDate() : '0' + d.getDate()) + "." +
            ((d.getMonth() + 1).toString().length > 1 ? (d.getMonth() + 1) : '0' + (d.getMonth() + 1)) + "." +
            d.getFullYear() + " "
        + ((d.getHours()).toString().length > 1 ? (d.getHours()) : '0' + (d.getHours())) + ":"  
        + ((d.getMinutes()).toString().length > 1 ? (d.getMinutes()) : '0' + (d.getMinutes()));
    }
});
app.filter('dateFormat2', function($window) {
    return function(input) {
        return moment(input).format($window.localStorage.getItem('global_dateFormat')+' | HH:mm');
        /*var d = new Date(input);
        return (d.getDate().toString().length > 1 ? d.getDate() : '0' + d.getDate()) + "." +
            ((d.getMonth() + 1).toString().length > 1 ? (d.getMonth() + 1) : '0' + (d.getMonth() + 1)) + "." +
            d.getFullYear() + " | "
        + ((d.getHours()).toString().length > 1 ? (d.getHours()) : '0' + (d.getHours())) + ":"  
        + ((d.getMinutes()).toString().length > 1 ? (d.getMinutes()) : '0' + (d.getMinutes()));*/
    }
});
app.filter('dateFormatDisplayFront', function($window) {
    return function(input) {
        //console.log('input', input)
        var d = new Date(input);
        if( ! isNaN(Date.parse(d)) ){
            return (d.getDate().toString().length > 1 ? d.getDate() : '0' + d.getDate()) + "." +
                ((d.getMonth() + 1).toString().length > 1 ? (d.getMonth() + 1) : '0' + (d.getMonth() + 1)) + "." +
                d.getFullYear() + " | "
            + ((d.getHours()).toString().length > 1 ? (d.getHours()) : '0' + (d.getHours())) + ":"  
            + ((d.getMinutes()).toString().length > 1 ? (d.getMinutes()) : '0' + (d.getMinutes()));
        }else{
            //console.log(Date.parse(d))
            return '' 
        }
    }
});
app.filter('commaseperator', function() {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            return 'NA';
        } else {
            return input.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
    }
});
//-------------first letter capitalized----------------//
app.filter('capitalize', function() {
    return function(input) {
        return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
    }
});
//------------ append year after input----------------//
app.filter('year', function($filter) {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            return 'No minimum(without restriction)';
        } else {
            return input + ' year';
        }
    }
});
//------------ append per year after input----------------//
app.filter('perYear', function($filter) {

    return function(input) {
        return input + ' per year';
    }
});

//------------ append $(input)M for input----------------//
app.filter('appendCurrency', function($filter) {

    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            return '$ None';
        } else {
            return '$ ' + input.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
    }
});

//------------ append $(input) for input----------------//
app.filter('appendPercent', function($filter) {

    return function(input) {

        if (input == undefined || input == '') {
            return '$ None';
        } else {
            return '$ ' + input;
        }
    }
});

//------------ append $(input) for input----------------//
app.filter('appendPercentage', function($filter) {

    return function(input) {

        if (input == undefined || input == '') {
            return 'None';
        } else {
            return input + ' %';
        }
    }
});
//------------ append risk value----------------//
app.filter('appendRisk', function($filter) {
    return function(input) {
        if (input == 1) {
            return 'Very Low';
        } else if (input == 2) {
            return 'Low';
        } else if (input == 3) {
            return 'Medium';
        } else if (input == 4) {
            return 'High';
        }
    }
});
//------------ country code to country name ----------------//
app.filter('codetoCountry', function() {
    return function(input, countries) {
        if (!angular.isUndefined(countries) && !angular.isUndefined(input)) {
            var tempContry = '';
            angular.forEach(countries, function(country) {
                if (angular.equals(country.code, input)) {
                    tempContry = country.name;
                }
            });
            return tempContry;
        } else {
            return input;
        }
    }
});
//------------horizon year filter -----------------------//
app.filter('yearfilter', function($window) {
    return function(items, types) {
        var filtered = [];
        angular.forEach(items, function(item) {
            if (types.year3 == true) {
                if (item.horizon_year < 3)
                    filtered.push(item);
            }
            if (types.year5 == true) {
                if ((item.horizon_year >= 3) && (item.horizon_year <= 5))
                    filtered.push(item);
            }
            if (types.year10 == true) {
                if (item.horizon_year >= 5 && item.horizon_year <= 10)
                    filtered.push(item);
            }
            if (types.year11 == true) {
                if (item.horizon_year > 10)
                    filtered.push(item);
            }
            if (types.year3 == false && types.year5 == false && types.year10 == false && types.year11 == false) {
                filtered.push(item);
            }
        });
        return filtered;
    };
});

//------------horizon year filter -----------------------//
app.filter('riskfilter', function() {
    return function(data, risktypes) {
        var filtered = [];
        angular.forEach(data, function(item) {
            if (risktypes.verylow == true) {
                if (item.risk == 1)
                    filtered.push(item);
            }
            if (risktypes.low == true) {
                if (item.risk == 2)
                    filtered.push(item);
            }
            if (risktypes.medium == true) {
                if (item.risk == 3)
                    filtered.push(item);
            }
            if (risktypes.high == true) {
                if (item.risk == 4)
                    filtered.push(item);
            }
            if (risktypes.verylow == false && risktypes.low == false && risktypes.medium == false && risktypes.high == false) {
                filtered.push(item);
            }
        });
        return filtered;
    };
});

app.filter('numberFixedLen', function() {
    return function(n, len) {
        var num = parseInt(n, 10);
        len = parseInt(len, 10);
        if (isNaN(num) || isNaN(len)) {
            return n;
        }
        num = '' + num;
        while (num.length < len) {
            num = '0' + num;
        }
        return num;
    };
});

app.filter('filterMultiple', ['$filter', function($filter) {
    return function(items, keyObj) {
        var filterObj = {
            data: items,
            filteredData: [],
            applyFilter: function(obj, key) {
                var fData = [];
                if (this.filteredData.length == 0)
                    this.filteredData = this.data;
                if (obj) {
                    var fObj = {};
                    if (!angular.isArray(obj)) {
                        fObj[key] = obj;
                        fData = fData.concat($filter('filter')(this.filteredData, fObj));
                    } else if (angular.isArray(obj)) {
                        if (obj.length > 0) {
                            for (var i = 0; i < obj.length; i++) {
                                if (angular.isDefined(obj[i])) {
                                    fObj[key] = obj[i];
                                    fData = fData.concat($filter('filter')(this.filteredData, fObj));
                                }
                            }

                        }
                    }
                    if (fData.length > 0) {
                        this.filteredData = fData;
                    }
                }
            }
        };

        if (keyObj) {
            angular.forEach(keyObj, function(obj, key) {
                filterObj.applyFilter(obj, key);
            });
        }

        return filterObj.filteredData;
    }
}]);

app.filter('unique', function() {
    return function(input, key) {
        var unique = {};
        var uniqueList = [];
        for (var i = 0; i < input.length; i++) {
            if (typeof unique[input[i][key]] == "undefined") {
                unique[input[i][key]] = "";
                uniqueList.push(input[i]);
            }
        }
        return uniqueList;
    };
});
//time formate
app.filter('timeFilter', function($filter) {
    return function(input) {
        if (input == null) {
            return "";
        }
        var _date = $filter('date')(new Date(input), 'HH:mm:ss');
        return _date.toUpperCase();
    };
});
app.filter('filterByTags', function($log) {
    return function(items, tags) {
        var filtered = [];
        (items || []).forEach(function(item) {
            var matches = tags.some(function(tag) {
                return (item.poNumber.search(tag.text.toUpperCase()) > -1) ||
                    (item.poNumber.search(tag.text.toUpperCase()) > -1);
            });
            if (matches) {
                filtered.push(item);
            }
        });
        return filtered;
    };
});
app.filter('filterInvoiceByTags', function($log) {
    return function(items, tags) {
        var filtered = [];
        (items || []).forEach(function(item) {
            var scoopNo = item.orderNumber;
            var matches = tags.some(function(tag) {
                return (scoopNo.search(tag.text.toUpperCase()) > -1) ||
                    (scoopNo.search(tag.text.toUpperCase()) > -1);
            });
            if (matches) {
                filtered.push(item);
            }
        });
        return filtered;
    };
});
app.filter('dateRange', function() {
        return function( items, fromDate, toDate ) {
            var filtered = [];
            angular.forEach(items, function(item) {
                if(item.JobDueDate){
                    if(Date.parse(item.JobDueDate.split('.').reverse().join('-')) >= fromDate && Date.parse(item.JobDueDate.split('.').reverse().join('-')) <= toDate) {
                        filtered.push(item);
                    } 
                }
            });
            return filtered;
        };
});

app.filter('ratingRange', function() {
        return function(items,low,high) {
            
            var filtered = [];
            angular.forEach(items, function(item) {
                if(item.OverallRating && item.OverallRating != null){
                    if(item.OverallRating >= low && item.OverallRating <= high) {
                        filtered.push(item);
                    } 
                }
            });
            return filtered;
        };
});
app.filter('dateLessThenToday', function() {
        return function(items,today) {
            var filtered = [];
            angular.forEach(items, function(item) {
                if(Date.parse(item.DueDate.split(' ')[0].split('.').reverse().join('-')) < Date.parse(today.split('.').reverse().join('-'))){
                    filtered.push(item);
                }
            });
            return filtered;
        };
});
app.filter('customNumber', function($filter,$window) {
    return function(input) {
        var decimalSeparator = $window.localStorage.getItem('DecimalSeparator')
        const numStr = String(input);
        // String Contains Decimal
        var numFix = 2;
        // if (numStr.includes('.')) {
        //     var dec = numStr.split('.')[1].length;
        //     if(dec == 3)
        //         numFix = 3;
        //     if(dec > 3)
        //         numFix = 4;       
        // };
        var number = $filter('number')(input,numFix);
        if(number){
            if(decimalSeparator){
                if(decimalSeparator == '.'){
                    return number;
                }else{
                    return number.split('.')[0].replace(/,/g,'.')+','+number.split('.')[1];
                }
            }else{
                return number
            }
        }
    };
});
app.filter('customNumber4Digit', function($filter,$window) {
    return function(input) {
        var decimalSeparator = $window.localStorage.getItem('DecimalSeparator')
        const numStr = String(input);
        // String Contains Decimal
        var numFix = 2;
        if (numStr.includes('.')) {
            var dec = numStr.split('.')[1].length;
            if(dec == 3)
                numFix = 3;
            if(dec > 3)
                numFix = 4;       
        };
        var number = $filter('number')(input,numFix);
        if(number){
            if(decimalSeparator){
                if(decimalSeparator == '.'){
                    return number;
                }else{
                    return number.split('.')[0].replace(/,/g,'.')+','+number.split('.')[1];
                }
            }else{
                return number
            }
        }
    };
});

app.filter('filterJobs', function() {
        return function(items) {
            var filtered = [];
            angular.forEach(items, function(item) {
                if(item.item_id == 2){
                    filtered.push(item);
                }
            });
            return filtered;
        };
});


//------------ Currency formate ----------------//
app.filter('currencyCommaformat', function($filter) {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            //return '$ None';
            return '-';
        } else {
            //var currencydata = input.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, " ");
            var isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
            if (isSafari) {
                var currencydata = input.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
            }else{
                var currencydata = input.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, " ");
            }
            return currencydata.replace(".", ',');
        }
    }
});
app.filter('currencyCommaDcmlformat', function($filter) {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            //return '$ None';
            return '0';
        } else {
            //var currencydata = input.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, " ");
            //var currencydata = input.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, " ");
            //const input1 = input % 1 != 0 ? (Math.round(input * 100) / 100).toFixed(2) : input;
            var input1 = input.toString().match(/^-?\d+(?:\.\d{0,2})?/)[0];
            var isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
            if (isSafari) {
                var currencydata = input1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "-");
            }else{
                var currencydata = input1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, "-");
            }
            var currencydata1 = currencydata.replace(".", ',');
            //var n1 = a1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
            return currencydata1.replace("-", '.');
        }
    }
});
app.filter('CurrencyNumbersCommaformat', function($filter) {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            return '-';
        } else {
            //console.log(input);
            //var str1 = input.toFixed(2);
            var str1 = input;
            var str=str1.toString();
            var numarray=str.split('.');
            var a=new Array();
            a=numarray;
            var a1=a[0];
            //var a2=',00';
            var a2='';
            if(a[1]==undefined && a[1]!=='00'){
                a[1]='';
            }else{ var a2 = ','+a[1].slice(0, 2); }
            var isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
            if (isSafari) {
                var n1 = a1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }else{
                var n1 = a1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
            }
            return n1 + a2 ;
            //return n1 + a2 + ' EUR';
        }
    }
});
app.filter('filterCurrencyComma', function() {
    return function(input, currencyType='EUR') {
        if (input == undefined || input == 0 || input == '') {
            return '-';
        } else {
            var currencyType = currencyType.includes(',') ? currencyType.split(',')[0] : currencyType;
            //console.log(input);
            //var str1 = input.toFixed(2);
            //var str1 = input;
            //var str=str1.toString();
            var numarray = input.toString().split('.');
            //var a=new Array();
            //a=numarray;
            var a1=numarray[0];
            //var a2=',00';
            var a2='';
            if(input.toString().includes('.')){
                 var a2 = ','+numarray.pop().slice(0, 2); 
            }
            var isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
            if (isSafari) {
                var n1 = a1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }else{
                var n1 = a1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
            }
            return n1 + a2 + ' ' + currencyType;
        }
    };
});
app.filter('NumbersCommaformat', function($filter) {
    return function(input) {
        if (input == undefined || input == '') {
            return 0;
        } else {
            //var str1 = input.toFixed(2);
            var decNo = 2;
            // Remove characters except numbers or decimal numbers
            // var inputNo = input.toString().replace(/[^0-9.]/g, '');
            var inputNo = input.toString().replace(/[^0-9.-]/g, '');
            var numarray = inputNo.toString().split('.');
            var a1 = numarray[0];
            var a2 = ',00';
            if(inputNo.toString().includes('.')){
                var decml = numarray.pop()
                decNo = (decml.length > 3) ? 4 : (decml.length == 3) ? 3 : 2 
                var a2 = ','+decml.slice(0, decNo); 
            }
            // for safari we need to changes in pattern
            var isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
            if (isSafari) {
                var n1 = a1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }else{
                var n1 = a1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
            }
            return n1 + a2;
        }
    }
});
app.filter('NumbersCommaformatzero', function($filter) {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            return '';
        } else {
            var numarray=input.toString().split('.');
            var a1=numarray[0];
            //var a2=',00';
            var a2='';
            if(input.toString().includes('.')){
                 var a2 = ','+numarray.pop().slice(0, 2); 
            }
            const isChrome = navigator.userAgent.includes("Chrome");
            const isSafari = navigator.userAgent.includes("Safari") && !isChrome;
            if (isSafari) {
                var n1 = a1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }else{
                var n1 = a1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
            }
            n1 = n1 ? n1 : 0 ;
            return n1 + a2;
        }
    }
});
app.filter('Textcharacter', function($filter) {
    return function(input) {
        if (input == undefined || input == 0 || input == '') {
            return '';
        } else {
            var texts = input; 
            if(input.length > 13){
                texts = input.substr(0,10) + '...';
            }
            return texts;
        }
    }
});
app.filter('localDate', ['$filter', function($filter) {
    return function(input) {
        var localTime = new Date(input);
        return $filter('date')(localTime, 'medium');
    };
}]);

