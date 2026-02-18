<?php


require_once './utils/functions.php';


if( !isAuthenticated() )
{
    
    redirectTo('login.php');
}


require_once './repository/gameRepository.php';
require_once './repository/playerRepository.php';


$player = getAuthenticatedPlayer();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    
    if (isset($_POST['update_password'])) {
        $oldPwd = $_POST['old-password'];
        $newPwd = $_POST['new-password'];

        
        if (password_verify($oldPwd, $player['password'])) {
            
           
            updatePlayerPassword($player['id'], $newPwd);
            
          
            header('Location: account.php?success=1');
            exit;
        } else {
            
            $error = "L'ancien mot de passe est incorrect.";
        }
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    
    if (isset($_POST['delete_account'])) {
        
       
        deletePlayer($player['id']);
        
       
        session_destroy();
        unset($_SESSION);
        
        
        header('Location: index.php');
        exit;
    }
}

// Récupération de l'historique à faire de ce joueur
$playerGame = getPlayerHistory( $player['id'] );




$template = './template/account.phtml';


include_once './template/layout.phtml';