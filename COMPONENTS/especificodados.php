<?php
//Faz a ligação com a conexão e verifica se usuário já está logado
include '../PHP/conexao.php';
session_start();

//Armazena mensagens que podem ser exibidas após redirecionamnetos (Correção de erro do Protti)
function flash($tipo, $mensagem) {
  $_SESSION['flash'][] = ['tipo' => $tipo, 'mensagem' => $mensagem];
}

//Pega o nome e o ID do usuário, se ele estiver logado
$usuarioLogado = $_SESSION['usuario'] ?? null;
$idUsuario = $_SESSION['id_usuario'] ?? null;

//Busca ID do ponto
if (!isset($_GET['id'])) {
  echo "<p class='text-center mt-5 text-danger'>Ponto turístico não especificado.</p>";
  exit;
}

$idPonto = $_GET['id'];

//Trata as infos enviadas pelo POST para não ocorrer duplicação (Correção Protti)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $acao = $_POST['acao'] ?? '';

  // Favoritar e Desfavoritar
  if ($acao === 'favoritar' && isset($_POST['favoritar'])) {
    //Verifica se está logado
    if (!$idUsuario) {
      flash('warning', 'Você precisa estar logado para favoritar.');
    } else {
      //Verifica se o ponto já está favoritado
      $stmtCheck = $conn->prepare("SELECT 1 FROM favoritos WHERE id_usuario = :id_usuario AND id_ponto = :id_ponto");
      $stmtCheck->bindParam(':id_usuario', $idUsuario, PDO::PARAM_INT);
      $stmtCheck->bindParam(':id_ponto', $idPonto, PDO::PARAM_INT);
      $stmtCheck->execute();

    //Adiciona o favoritado no banco  
      if ($stmtCheck->rowCount() === 0) {
        $stmtInsert = $conn->prepare("
          INSERT INTO favoritos (id_usuario, usuario, id_ponto, ponto_turistico)
          SELECT :id_usuario, :usuario, id_ponto, ponto_turistico
          FROM pontos_turisticos WHERE id_ponto = :id_ponto
        ");
        $stmtInsert->bindParam(':id_usuario', $idUsuario, PDO::PARAM_INT);
        $stmtInsert->bindParam(':usuario', $_SESSION['usuario']);
        $stmtInsert->bindParam(':id_ponto', $idPonto, PDO::PARAM_INT);
        $stmtInsert->execute();
        flash('success', 'Favoritado com sucesso!');

    //Tira do banco o favoritado
      } else {
        $stmtDelete = $conn->prepare("DELETE FROM favoritos WHERE id_usuario = :id_usuario AND id_ponto = :id_ponto");
        $stmtDelete->bindParam(':id_usuario', $idUsuario, PDO::PARAM_INT);
        $stmtDelete->bindParam(':id_ponto', $idPonto, PDO::PARAM_INT);
        $stmtDelete->execute();
        flash('warning', 'Removido dos favoritos.');
      }
    }

    //Redireciona para a mesma página (Correção do Protti)
    header('Location: ' . $_SERVER['PHP_SELF'] . '?id=' . urlencode((string)$idPonto), true, 303);
    exit;
  }

  //Fazer avaliação
  if ($acao === 'comentar' && isset($_POST['feedback'])) {
    if (!$idUsuario) {
      //Verifica se está logado
      flash('warning', 'Você precisa estar logado para comentar.');
    } else {

      //Limpa o POST
      $feedback = trim($_POST['feedback']);

      if ($feedback !== '') {
      //Adiciona avaliação no banco
        $stmtInsert = $conn->prepare("
          INSERT INTO avaliacoes (id_usuario, id_ponto, nota, feedback)
          VALUES (:id_usuario, :id_ponto, 5, :feedback)
        ");
        $stmtInsert->bindParam(':id_usuario', $idUsuario, PDO::PARAM_INT);
        $stmtInsert->bindParam(':id_ponto', $idPonto, PDO::PARAM_INT);
        $stmtInsert->bindParam(':feedback', $feedback);
        $stmtInsert->execute();
        flash('success', 'Comentário enviado com sucesso!');
      } else {
        flash('warning', 'O comentário não pode estar vazio.');
      }
    }

    //Redireciona para a mesma página (Correção do Protti)
    header('Location: ' . $_SERVER['PHP_SELF'] . '?id=' . urlencode((string)$idPonto), true, 303);
    exit;
  }
}

//Pega as infos
$stmt = $conn->prepare("
  SELECT ponto_turistico, descricao, horario_funcionamento, principais_atracoes,
         preco_medio, endereco, formas_acesso, foto_principal, cidade, estado,
         latitude, longitude
  FROM pontos_turisticos
  WHERE id_ponto = :id
");
$stmt->bindParam(':id', $idPonto, PDO::PARAM_INT);
$stmt->execute();
$ponto = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$ponto) {
  echo "<p class='text-center mt-5 text-warning'>Ponto turístico não encontrado.</p>";
  exit;
}

//Busca as avaliações feitas pelo usuário (liga duas tabelas e dá apelidos - teste que fiz para ver como fica)
$stmtAvaliacoes = $conn->prepare("
  SELECT a.feedback, a.data_avaliacao, u.usuario
  FROM avaliacoes a
  JOIN usuarios u ON a.id_usuario = u.id_usuario
  WHERE a.id_ponto = :id
  ORDER BY a.data_avaliacao DESC
");
$stmtAvaliacoes->bindParam(':id', $idPonto, PDO::PARAM_INT);
$stmtAvaliacoes->execute();
$avaliacoes = $stmtAvaliacoes->fetchAll(PDO::FETCH_ASSOC);

// Verifica se já está favoritado ou não
$favoritado = false;
if ($idUsuario) {
  $stmtFav = $conn->prepare("SELECT 1 FROM favoritos WHERE id_usuario = :id_usuario AND id_ponto = :id_ponto");
  $stmtFav->bindParam(':id_usuario', $idUsuario, PDO::PARAM_INT);
  $stmtFav->bindParam(':id_ponto', $idPonto, PDO::PARAM_INT);
  $stmtFav->execute();
  $favoritado = $stmtFav->rowCount() > 0;
}

//Serve para limpar o navegador, para que não fique sujeira nele (Correção do Protti)
header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
header('Pragma: no-cache');
?>