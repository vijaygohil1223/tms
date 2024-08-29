<?php
function unlinkProcess() {
    // Database connection details
    $host = 'localhost';
    $dbname = 'kanhawhp_tms';
    $user = 'root';
    $pass = '';
    $batchLimit = 2;

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Database connection failed: " . $e->getMessage());
    }

    // Query to fetch image paths with limit and where unlink flag is false
    $query = "SELECT id, name FROM tms_temp_filemanager WHERE unlink_flag = 0 LIMIT :batchLimit";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':batchLimit', $batchLimit, PDO::PARAM_INT);
    $stmt->execute();
    $files = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($files)) {
        echo "No files to process.\n";
        return;
    }

    // Define the temp folder and zip file path
    $tempFolder = 'C:/xampp/htdocs/TMS/uploads/tempZipBkp/';
    $zipFileName = 'backup_' . date('Ymd_His') . '.zip';
    $zipFilePath = $tempFolder . $zipFileName;

    // Ensure directory exists and has write permissions
    if (!is_dir($tempFolder)) {
        if (!mkdir($tempFolder, 0777, true)) {
            die("Failed to create folder: $tempFolder\n");
        }
    }

    // Create a ZIP file
    $zip = new ZipArchive();
    $zip->open($zipFilePath, ZipArchive::CREATE | ZipArchive::OVERWRITE);

    foreach ($files as $file) {
        $filePath = "C:/xampp/htdocs/TMS/uploads/fileupload/" . $file['name'];

        if (file_exists($filePath)) {
            // Add file to the ZIP archive
            if (!$zip->addFile($filePath, basename($filePath))) {
                echo "Failed to add file: $filePath to ZIP.\n";
                continue;
            }

            // Remove the file
            if (unlink($filePath)) {
                // Update the flag in the database
                $updateQuery = "UPDATE tms_temp_filemanager SET unlink_flag = 1 WHERE id = :id";
                $updateStmt = $pdo->prepare($updateQuery);
                $updateStmt->bindParam(':id', $file['id'], PDO::PARAM_INT);
                $updateStmt->execute();
            } else {
                echo "Error removing file: $filePath\n";
            }
        } else {
            echo "File does not exist: $filePath\n";
        }
    }

    // Close the ZIP file
    if (!$zip->close()) {
        echo "Failed to close the ZIP file. The file might not have been created correctly.\n";
    } else {
        echo "Backup created successfully at $zipFilePath\n";
    }
}

unlinkProcess();
?>
