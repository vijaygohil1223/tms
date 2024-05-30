<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Directory where the file will be uploaded
    $target_dir = 'uploads/fileupload/';

    // Ensure the uploads directory exists
    if (!is_dir($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    // Get the file extension
    $file_extension = pathinfo($_FILES["myfile"]["name"], PATHINFO_EXTENSION);

    // Generate a new filename with the current timestamp
    $new_filename = time().'-testfile' . '.' . $file_extension;

    // Full path to the new file
    $target_file = $target_dir . basename($new_filename);

    // Check if the file is an actual file or a fake file
    if (isset($_POST["submit"])) {
        $check = getimagesize($_FILES["myfile"]["tmp_name"]);
        if ($check !== false) {
            echo "File is an image - " . $check["mime"] . ".<br>";
        } else {
            echo "File is not an image.<br>";
        }
    }

    // Check if the file already exists
    if (file_exists($target_file)) {
        echo "Sorry, file already exists.<br>";
    }

    // Check file size (5MB maximum)
    if ($_FILES["myfile"]["size"] > 5000000) {
        echo "Sorry, your file is too large.<br>";
    }

    // Allow certain file formats (optional)
    $allowed_extensions = array("jpg", "png", "jpeg", "gif");
    if (!in_array($file_extension, $allowed_extensions)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.<br>";
    }

    // Check if $uploadOk is set to 0 by an error
    if (move_uploaded_file($_FILES["myfile"]["tmp_name"], $target_file)) {
        echo "The file " . htmlspecialchars(basename($_FILES["myfile"]["name"])) . " has been uploaded as " . htmlspecialchars($new_filename) . ".<br>";
    } else {
        echo "Sorry, there was an error uploading your file.<br>";
    }
}



?>
