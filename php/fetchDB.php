<?php
    $servername = "localhost";
    $username = "root";
    $password = "nomejodas";
    $dbname = "escalasBD";
    $scale = $_GET["scale"];

    try {
        $connection = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $parameters = array(":scale" => $scale);
        $statement = $connection->prepare(
            "SELECT D.degree_name, D.degree_position, D.degree_number, D.natural_note, D.sharp_note, D.flat_note, D.major, D.minor, D.diminished, D.augmented
             FROM degree D, scale_degree SD, scales S
             WHERE D.id = SD.id_degree
                AND S.id = SD.id_scale
                AND S.scale_name LIKE :scale;"
        );
        $statement->execute($parameters);
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($result);
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
?>