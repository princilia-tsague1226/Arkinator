<?php


if( 
    !empty( $_POST )
)
{
    
    require_once './utils/functions.php';

    try {

       
        if(
            !isset( $_POST['username'] ) || empty( $_POST['username'] ) ||
            !isset( $_POST['password'] ) || empty( $_POST['password'] )
        )
        {
            
            throw new Exception("Tous les champs sont obligatoires.");
        }

        
        require_once './repository/playerRepository.php';

        
        $player = getPlayerByUsername( $_POST['username'] );

        
        if( !$player || !password_verify( $_POST['password'], $player['password'] ) )
        {
            
            throw new Exception("Identifiants invalides.");
        }

        
        authenticatePlayer( $player );

        redirectTo('index.php');

    }
    catch( Exception $e )
    {
        $error = $e->getMessage();
    }
}


$template = './template/login.phtml';


include_once './template/layout.phtml';