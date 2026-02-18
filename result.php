<?php

require_once './utils/functions.php';
require_once './repository/quizRepository.php';
require_once './repository/gameRepository.php';

// 1. Récupération de l'ID du résultat
$id = isset($_GET['id']) ? (int)$_GET['id'] : null;

if (!$id) {
    redirectTo('index.php');
}

// 2. Récupération des données de la boisson
$result = getResultById($id);

if (!$result) {
    redirectTo('index.php');
}



$id_drink = $_GET['id'] ?? null; 

if ($id_boisson_trouvee !== null && isAuthenticated()) {
    $player = getAuthenticatedPlayer();
    
    
    saveGame($player['id'], (int)$id_drink);
}



$template = './template/result.phtml';
include_once './template/layout.phtml';