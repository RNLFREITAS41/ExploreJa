<?php
$host = 'localhost';
$user = 'root';      
$password = '';      
$dbname = 'exploreja'; 

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    
    // Configura o PDO para reportar erros como exceções (melhor para o tratamento interno)
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


} catch (PDOException $e) {
    error_log("Falha de Conexão PDO: " . $e->getMessage());
    die(); 
}

?>