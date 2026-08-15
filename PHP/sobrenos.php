<?php
//Faz a ligação com a conexão e verifica se usuário já está logado

session_start();
//Pega o nome do usuário
include 'conexao.php';

$usuarioLogado = $_SESSION['usuario'] ?? null;
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sobre Nós</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="../CSS/sobrenos.css">
  <link rel="stylesheet" href="../CSS/modal.css">
</head>
<body>


<header>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <div class="d-flex align-items-center">
        <a class="navbar-brand me-3" href="../index.php">
          <img src="../IMAGES/Explore.png" alt="Logo Explore Já" class="img-fluid logo-img">
        </a>
      </div>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mainNavbar">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <!-- Se estiver na conta é exibido o nome e ele possuí a opção de deslogar-->
          <?php if ($usuarioLogado): ?>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-person-circle me-2"></i> <?= htmlspecialchars($usuarioLogado) ?>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item text-danger" href="../PHP/CONTA/deslogar.php">Sair</a></li>
            </ul>
          </li>
        <?php endif; ?>

        </ul>
      </div>
    </div>
  </nav>
</header>

  <main class="container my-5">
    <div class="mb-4 p-4 bg-light rounded shadow-sm">
      <h2>O que é o ExploreJá? </h2>
      <p>O Explore Já é um espaço criado para quem acredita que viajar é muito mais do que se deslocar de um lugar para outro, é viver histórias, colecionar momentos e se conectar com o mundo de um jeito único. Nosso objetivo é facilitar a jornada de quem busca conhecer novos destinos, apresentando os melhores pontos turísticos, curiosidades locais e experiências que tornam cada viagem inesquecível.
        Aqui, cada detalhe é pensado para ajudar você a descobrir e explorar os melhores pontos turisticos  com mais praticidade, confiança e encantamento. Reunimos informações, dicas e roteiros personalizados para transformar o simples ato de conhecer lugares novos em parte da diversão.</p>
    </div>

    <div class="mb-4 p-4 bg-light rounded shadow-sm">
      <h2>Nossa Missão</h2>
      <p>Nossa missão é tornar o turismo acessível, inspirador e responsável, conectando exploradores a lugares incríveis e incentivando o contato genuíno com a cultura, a natureza e as pessoas. Queremos que cada visitante encontre aqui não apenas destinos, mas motivos para explorar, seja uma cidade histórica, uma praia escondida ou um parque repleto de natureza.
      Acreditamos que descobrir novos locais transforma, e por isso buscamos oferecer conteúdos que despertem a curiosidade e o desejo de desbravar o novo com consciência e respeito.
      </p>
    </div>

    <div class="mb-4 p-4 bg-light rounded shadow-sm">
      <h2>Nossa Visão</h2>
      <p>Ser reconhecido como o principal guia digital de turismo do Brasil, referência em confiança, praticidade e inspiração.
       Queremos criar uma comunidade de exploradores apaixonados por viagens, onde cada pessoa encontre no Explore Já um aliado para planejar, descobrir e compartilhar experiências únicas. Nosso olhar vai além do mapa: buscamos promover um turismo sustentável, inclusivo e culturalmente rico, que valorize as belezas e histórias de cada destino.
      </p>
    </div>

    <div class="mb-4 p-4 bg-light rounded shadow-sm">
      <h2>Nossos Valores</h2>
      <p>Exploração e Descoberta: incentivar a curiosidade e o desejo de conhecer o novo.
        <br>
      Autenticidade: valorizar as experiências locais e verdadeiras de cada destino.
      <br>
      Sustentabilidade: promover o turismo responsável e o respeito ao meio ambiente.
      <br>
      Inovação: usar tecnologia para tornar a jornada do viajante mais prática e envolvente.
      <br>
      Comunidade: conectar pessoas e culturas, fortalecendo laços e ampliando horizontes.
      <br>
      Confiança: garantir informações seguras e recomendações de qualidade aos usuários.</p>
    </div>
  </main>

  <footer class="footer-site text-center text-light py-4 mt-5">
  <div class="container">
    <p class="mb-1">© 2025 Explore Já. Todos os direitos reservados.</p>
    <p class="mb-0">
      <a href="#" class="link-footer text-light">Política de Privacidade</a> |
      <a href="#" class="link-footer text-light">Termos de Uso</a>
    </p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
