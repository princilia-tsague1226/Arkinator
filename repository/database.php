<?php

// Fonction qui connecte PDO à la base de données et retourne l'objet PDO connecté
function getConnection(): PDO
{
    $host        = 'db.3wa.io';
    $dbName      = 'princiliatsaguetefouegang_datasAkinator';
    $sqlUser     = 'princiliatsaguetefouegang';
    $sqlPassword = 'a238acca97d9f04fcd16f61247f1df85';
    
    try {
        $pdo = new PDO(
            'mysql:host='. $host .';port=3306;dbname='. $dbName .';charset=utf8',
            $sqlUser,
            $sqlPassword
        );
    
        return $pdo;
    } catch (PDOException $e) {
        die('The connection failed : ' . $e->getMessage());
    }    
}