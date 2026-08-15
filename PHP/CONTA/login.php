<?php
//Faz a ligação com a conexão e verifica se usuário já está logado
session_start();
include '../conexao.php';

$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
  $senha = $_POST['senha'];

  try {
    $stmt = $conn->prepare("SELECT id_usuario, usuario, senha_hash FROM usuarios WHERE email = :email");
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    if ($stmt->rowCount() === 1) {
      $usuario = $stmt->fetch(PDO::FETCH_ASSOC);
      if (password_verify($senha, $usuario['senha_hash'])) {
        $_SESSION['id_usuario'] = $usuario['id_usuario'];
        $_SESSION['usuario'] = $usuario['usuario'];
        header('Location: ../../index.php');
        exit;
      } else {
        $mensagem = 'Senha incorreta.';
      }
    } else {
      $mensagem = 'E-mail não encontrado.';
    }
  } catch (PDOException $e) {
    $mensagem = 'Erro ao logar: ' . $e->getMessage();
  }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Explore Já - Login</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="../../CSS/login.css" />
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <a class="me-3" href="../../index.php">
          <img src="../../IMAGES/Explore.png" alt="Logo Explore Já" class="img-fluid logo-img">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
    </nav>
  </header>

  <div class="fundo-background">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6 d-flex justify-content-center">
          <main class="container-login">
            <div class="caixa-login">
              <h5 class="text-center mb-4">Login</h5>

              <!-- Mensagem de login-->
              <?php if (!empty($mensagem)): ?>
                <div class="alert alert-danger text-center"><?= $mensagem ?></div>
              <?php endif; ?>

              <form action="" method="post">
                <input type="email" name="email" class="form-control campo-login mb-3" placeholder="E-mail" required />
                <input type="password" name="senha" class="form-control campo-login mb-3" placeholder="Senha" required />
                <button type="submit" class="btncadastro w-100">Entrar</button>
              </form>

              <p class="text-center mt-3">
                Ainda não tem uma conta?
                <a href="cadastro.php" class="link-footer">Cadastre-se</a>
              </p>
            </div>
          </main>
        </div>
      </div>
    </div>
  </div>

  <!-- FOOTER -->
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