<?php



class test {

	//price1 data manage

	    public function __construct() {

	        $this->_db = db::getInstance();

	    }

		public function formatSize($bytes) {
			$sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
			$factor = floor((strlen($bytes) - 1) / 3);
			return sprintf("%.2f", $bytes / pow(1024, $factor)) . " " . $sizes[$factor];
		}

		public function getLargestFiles($directory, $limit = 5) {
			$files = [];
			
			// Open the directory
			if ($handle = opendir($directory)) {
				while (false !== ($entry = readdir($handle))) {
					$filePath = $directory . DIRECTORY_SEPARATOR . $entry;
		
					// Check if it is a file
					if (is_file($filePath)) {
						$files[$filePath] = filesize($filePath); // Store file size
					}
				}
				closedir($handle);
			}
		
			// Sort files by size in descending order
			arsort($files);
		
			// Return the top N largest files
			return array_slice($files, 0, $limit, true);
		}

		public function fetchFileFromFolder($post){
			echo "Anil";
			print_r($post);
			exit;
			$directory = $post['directory'];
			print_r($directory);
			exit;
			$largestFiles = self::getLargestFiles($directory);
			$tempArray = [];
			foreach ($largestFiles as $file => $size) {
				$tempArray = basename($file) . " - " . self::formatSize($size) . "\n";
			}
			return $tempArray;
		}





}