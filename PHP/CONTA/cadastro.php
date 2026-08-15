<?php
//Faz a ligação com a conexão e verifica se usuário já está logado
include '../conexao.php';

//Armazena as mensagens
$mensagem = '';

//Pega os dados e valida
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
  $senha = $_POST['senha'];
  $usuario = htmlspecialchars($_POST['usuario']);

  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $mensagem = 'E-mail inválido.';
  } elseif (strlen($senha) < 3) {
    $mensagem = 'A senha deve ter pelo menos 3 caracteres.';
  } else {
    try {
      $stmt = $conn->prepare("SELECT id_usuario FROM usuarios WHERE email = :email");
      $stmt->bindParam(':email', $email);
      $stmt->execute();

      if ($stmt->rowCount() > 0) {
        $mensagem = 'Este e-mail já está cadastrado.';
      } else {
        $senha_hash = password_hash($senha, PASSWORD_DEFAULT);


        //Adiciona o novo usuário no banco
        $sql = "INSERT INTO usuarios (usuario, email, senha_hash) VALUES (:usuario, :email, :senha_hash)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':usuario', $usuario);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':senha_hash', $senha_hash);
        $stmt->execute();

        $mensagem = 'Cadastro realizado com sucesso!';
      }
    } catch (PDOException $e) {
      $mensagem = 'Erro ao cadastrar: ' . $e->getMessage();
    }
  }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Cadastro</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="../../CSS/cadastro.css" />
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <div class="d-flex align-items-center">
          <a class="me-3" href="../../index.php">
            <img src="../../IMAGES/Explore.png" alt="Logo Explore Já" class="img-fluid logo-img">
          </a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNavbar">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li><a href="login.php" class="btn btn-personalizado">Login</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <div class="fundo-background">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6 d-flex justify-content-center">
          <div class="caixa-cadastro text-center">
            <h5 class="titulo-modal">Cadastro</h5>

            <!-- Mensagens-->
            <?php if (!empty($mensagem)): ?>
              <div class="alert alert-info mt-3"><?= $mensagem ?></div>
            <?php endif; ?>

            <form action="" method="post" class="mt-4">
              <div class="mb-3">
                <input type="email" name="email" class="form-control campo-cadastro" placeholder="E-mail" required />
              </div>
              <div class="mb-3">
                <input type="password" name="senha" class="form-control campo-cadastro" placeholder="Senha" required />
              </div>
              <div class="mb-4">
                <input type="text" name="usuario" class="form-control campo-cadastro" placeholder="Usuário" required />
              </div>
              <button type="submit" class="btncadastro w-100">Cadastrar-se</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer class="footer-site text-center py-3">
    <div class="container">
      <p class="mb-1">© 2025 Explore Já. Todos os direitos reservados.</p>
      <p class="mb-0">
        <a href="#" class="link-footer">Política de Privacidade</a> |
        <a href="#" class="link-footer">Termos de Uso</a>
      </p>
    </div>
  </footer>
</body>
</html>