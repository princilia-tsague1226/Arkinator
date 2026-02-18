<?php


if( 
    !empty( $_POST )
)
{
   
    require_once './utils/functions.php';

    try {

        
        if(
            !isset( $_POST['username'] ) || empty( $_POST['username'] ) ||
            !isset( $_POST['email'] ) || empty( $_POST['email'] ) ||
            !isset( $_POST['password'] ) || empty( $_POST['password'] )
        )
        {
            
            throw new Exception("All fields are required.");
        }

        
        $emailRegex    = '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,4}$/';
        $passwordRegex = '/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])\S{8,16}$/';

        if( !preg_match( $emailRegex, $_POST['email']) )
        {
            
            throw new Exception("Le format de l'email est invalide");
        }


        if( !preg_match( $passwordRegex, $_POST['password']) )
        {
            
            throw new Exception("Votre mot de passe doit contenir entre 8 et 16 lettres, avec au moins une majuscule, une minuscule, 1 chiffre et 1 caractère spécial.");
        }

        
        require_once './repository/playerRepository.php';

       
        addPlayer( $_POST['username'], $_POST['email'], $_POST['password'] );

       
        redirectTo('login.php');

    }
    catch( Exception $e ) 
    {
        
        $error = $e->getMessage();
    }
}


$template = './template/register.phtml';


include_once './template/layout.phtml';