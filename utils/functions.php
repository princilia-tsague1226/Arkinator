<?php

// La fonction construit et retourne une adresse URL selon un fichier de page et un tableau de paramètres
function navlink( string $fileName, array $params = [] ): string
{
    // initialisation de lien à générer 
    // (qui doit donc pointer vers un fichier de page, en partant d'une autre page stockée au même niveau que celle qui l'affiche)
    $link = $fileName;

    // s'il y a des paramètres GET à ajouter au lien
    if( count($params) > 0 )
    {
        // On récupère toutes les clés du tableau associatif $params
        $keys = array_keys($params);

        // On récupère la dernier clé de $params
        $lastKey = end($keys);

        // On ouvre la chaine de requête dans le lien
        $link .= '?';

        // Pour chaque clé de $params, qui est donc le nom du paramètre associé à sa valeur
        foreach( $params as $key => $value )
        {
            // On concatène le nom du paramètre, le signe égal, et la valeur
            $link .= $key . '=' . $value;

            // Si ce n'est pas le dernier couple param=valeur à mettre dans la chaine de requête
            if( $key !== $lastKey )
            {
                // On concatène le signe & pour le paramètre suivant
                $link .= '&';
            }
        }
    }
    return $link;
}

// La fonction redirige vers une page en s'appuyant sur la fonction ci-dessus pour construire l'adresse URL de destination
function redirectTo( string $fileName, array $params = [] ): void
{
    header('Location:'. navlink($fileName, $params) );
    exit();
}

// Fonction qui authentifie l'utilisateur en inscrivant ses informations dans la session
function authenticatePlayer( $playerData ): void
{
    startSessionIfIsNot();
    $_SESSION['player'] = $playerData;
}

// Fonction qui retourne vrai si un utilisateur est authentifié, faux s'il ne l'est pas
function isAuthenticated(): bool
{
    startSessionIfIsNot();
    return array_key_exists('player', $_SESSION) && !empty($_SESSION['player']);
}

// Fonction qui retourne les informations de l'utilisateur authentifié, stockées dans la session
function getAuthenticatedPlayer(): array
{
    startSessionIfIsNot();
    return $_SESSION['player'];
}

// Fonction qui démarre une session pour donner accès à $_SESSION si ce n'est pas déjà accessible
function startSessionIfIsNot()
{
    if( !isset($_SESSION) )
    {
        session_start();
    }
}

