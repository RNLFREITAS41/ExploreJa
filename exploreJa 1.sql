CREATE DATABASE exploreja;
USE exploreja;

CREATE TABLE usuarios ( 
id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
usuario VARCHAR(100) NOT NULL, 
email VARCHAR(100) UNIQUE, 
senha_hash VARCHAR(255) NOT NULL, 
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP 
); 

CREATE TABLE categorias ( 
id_categoria INT AUTO_INCREMENT PRIMARY KEY, 
categoria VARCHAR(100) 
);

CREATE TABLE cidades (
    id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL
);


CREATE TABLE pontos_turisticos ( 
id_ponto INT AUTO_INCREMENT PRIMARY KEY, 
ponto_turistico VARCHAR(150), 
descricao TEXT, 
horario_funcionamento VARCHAR(100), 
principais_atracoes TEXT, 
preco_medio DECIMAL(10,2), 
endereco VARCHAR(255), 
cidade VARCHAR(100), 
id_cidade INT,
estado CHAR(2), 
formas_acesso TEXT, 
id_categoria INT,
categoria VARCHAR(100), 
foto_principal VARCHAR(255),
latitude DECIMAL(10, 8) NOT NULL,
longitude DECIMAL(11, 8) NOT NULL,
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
FOREIGN KEY (id_cidade) REFERENCES cidades(id_cidade) 
); 
 

CREATE TABLE avaliacoes ( 
id_avaliacao INT AUTO_INCREMENT PRIMARY KEY, 
id_usuario INT, 
id_ponto INT, 
nota INT CHECK (nota BETWEEN 1 AND 5), 
feedback TEXT, 
data_avaliacao DATETIME DEFAULT CURRENT_TIMESTAMP, 
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario), 
FOREIGN KEY (id_ponto) REFERENCES pontos_turisticos(id_ponto) 
); 


CREATE TABLE favoritos (
id_favorito INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
usuario VARCHAR(100) NOT NULL,
id_ponto INT, 
ponto_turistico VARCHAR(150),
data_favorito DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
FOREIGN KEY (id_ponto) REFERENCES pontos_turisticos(id_ponto)
);

INSERT INTO cidades (cidade, estado) VALUES
('São Paulo', 'SP'),
('Sorocaba', 'SP'),
('Campinas', 'SP'),
('Ribeirão Preto', 'SP'),
('Santos', 'SP');

INSERT INTO categorias (categoria) VALUES
('Parques'),
('Museus e Exposições'),
('Centros Históricos e Igrejas'),
('Lazer'),
('Centros Comerciais'),
('Teatros e Cinemas'),
('Parques Temáticos'),
('Mercados e Feiras');

INSERT INTO pontos_turisticos (ponto_turistico, descricao, horario_funcionamento, principais_atracoes, preco_medio, endereco, cidade, estado, formas_acesso, categoria, id_categoria, foto_principal, id_cidade, latitude, longitude) VALUES
('Parque Ibirapuera', 'Maior parque urbano de SP, com 158 hectares de verde.', 'Das 5h à 0h (varia por atração)', 'Pavilhão japonês, ciclovia, lago artificial.', 0.00, 'Av. Pedro Álvares Cabral, s/n - Vila Mariana, São Paulo - SP, 04094-000', 'São Paulo', 'SP', 'Metrô (Linha 5-Lilás, Est. AACD-Servidor) ou carro via Av. Brigadeiro Faria Lima.', 'Parques', 1, 'sp1.webp', 1, -23.5874162, -46.6576336),
('Parque da Independência', 'Parque histórico com museu e monumentos.', 'Das 6h às 18h', 'Museu do Ipiranga, obelisco, trilhas.', 0.00, 'R. dos Patriotas, 100 - Ipiranga, São Paulo - SP, 01514-000', 'São Paulo', 'SP', 'Ônibus 476R-10 ou carro via Av. do Estado.', 'Parques e Áreas Verdes', 1, 'sp2.webp', 1, -23.5841629, -46.6124022),
('Jardim Botânico de São Paulo', 'Jardim com plantas nativas e exóticas.', 'Segunda a domingo, 9h às 17h', 'Estufas, orquidário, trilhas ecológicas.', 15.00, 'Av. Miguel Estéfano, 3031 - Água Funda, São Paulo - SP, 04301-904', 'São Paulo', 'SP', 'Ônibus 4742-10 ou carro via Av. do Cursino.', 'Parques', 1, 'sp3.webp', 1, -23.6393149, -46.6298855),
('Parque do Carmo', 'Parque com lago e auditório ao ar livre.', 'Das 5h30 às 18h', 'Viveiro Manequinho, pedalinhos, shows gratuitos.', 0.00, 'Av. Afonso de Sampaio e Sousa, 951 - Itaquera, São Paulo - SP, 08270-120', 'São Paulo', 'SP', 'Metrô (Linha 3-Vermelha, Est. Itaquera) + ônibus.', 'Parques', 1, 'sp4.webp', 1, -23.5717448, -46.5125088),
('Parque Estadual da Cantareira', 'Reserva de mata atlântica com trilhas.', 'Das 8h às 17h (fim de semana 9h às 16h)', 'Mirantes, cachoeiras, observação de fauna.', 0.00, 'R. do Horto, 1799 - Tremembé, São Paulo - SP, 02377-000', 'São Paulo', 'SP', 'Ônibus 1742-10 ou carro via Rod. Pres. Dutra.', 'Parques', 1, 'sp5.webp', 1, -23.4543056, -46.7080643),
('Parque Villa-Lobos', 'Parque moderno com espaços culturais.', 'Das 7h às 20h', 'Auditório ao ar livre, pista de skate, feiras.', 0.00, 'Av. Prof. Fonseca Rodrigues, 2001 - Alto de Pinheiros, São Paulo - SP, 05458-000', 'São Paulo', 'SP', 'Ônibus CPTM (Est. Presidente Altino) ou carro via Marginal Pinheiros.', 'Parques', 1, 'sp6.jpg', 1, -23.5418534, -46.7663366),


('Museu de Arte de São Paulo (MASP)', 'Maior acervo de arte ocidental da América Latina.', 'Terça a domingo, 10h às 18h (qui até 21h)', 'Obras de Van Gogh, Picasso, arquitetura suspensa.', 70.00, 'Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200', 'São Paulo', 'SP', 'Metrô (Linha 2-Verde, Est. Trianon-MASP).', 'Museus e Exposições', 2, 'sp7.webp', 1, -23.561414, -46.6558819),
('Museu do Futebol', 'Museu interativo sobre a história do futebol brasileiro.', 'Terça a domingo, 9h às 17h', 'Salas temáticas, pelés, copa do mundo.', 20.00, 'Praça Charles Miller, s/n - Pacaembu, São Paulo - SP, 01297-010', 'São Paulo', 'SP', 'Metrô (Linha 3-Vermelha, Est. Marechal Deodoro) + ônibus.', 'Museus e Exposições', 2, 'sp8.jpeg', 1, -23.547692, -46.6677113),
('Pinacoteca do Estado de São Paulo', 'Museu de arte com foco em modernismo brasileiro.', 'Sábado a segunda, 10h às 17h; terça a quinta 10h às 18h', 'Obras de Tarsila do Amaral, mostras itinerantes.', 25.00, 'Praça da Luz, 2 - Bom Retiro, São Paulo - SP, 01118-200', 'São Paulo', 'SP', 'Metrô (Linha 7-Rubi CPTM, Est. Luz).', 'Museus e Exposições', 2, 'sp9.webp', 1, -23.5343612, -46.6362509),
('Casa das Rosas', 'Espaço cultural com literatura e artes.', 'Terça a sábado, 11h às 17h', 'Biblioteca, exposições fotográficas, jardim.', 0.00, 'Av. Paulista, 37 - Paraíso, São Paulo - SP, 01311-100', 'São Paulo', 'SP', 'Metrô (Linha 2-Verde, Est. Brigadeiro).', 'Museus e Exposições', 2, 'sp11.webp', 1, -23.5710635, -46.6477281),
('Museu Catavento Cultural e Educacional', 'Museu interativo com temas científicos e temáticos.', 'Terça a domingo, 9h às 17h', 'Simuladores, planetário, exposições hands-on.', 15.00, 'Av. Mercês, 115 - Mercês, São Paulo - SP, 01228-000', 'São Paulo', 'SP', 'Metrô (Linha 3-Vermelha, Est. Santa Cecília).', 'Museus e Exposições', 2, 'sp34.webp', 1, -23.5440513, -46.6272063),
('Museu da Imigração Japonesa', 'História da imigração nipo-brasileira.', 'Terça a domingo, 10h às 17h', 'Documentos, fotos, reconstruções de vilas.', 20.00, 'R. São Joaquim, 381 - Liberdade, São Paulo - SP, 01508-900', 'São Paulo', 'SP', 'Metrô (Linha 1-Azul, Est. São Joaquim).', 'Museus e Exposições', 2, 'sp12.webp', 1, -23.5612483, -46.6377072),


('Pátio do Colégio', 'Fundação de São Paulo em 1554 pelos jesuítas.', 'Segunda a sexta 9h às 17h; sáb/dom 10h às 16h', 'Capela original, museu da cidade.', 6.00, 'Praça da Sé - Sé, São Paulo - SP, 01001-000', 'São Paulo', 'SP', 'Metrô (Linha 1-Azul, Est. Sé).', 'Centros Históricos e Igrejas', 3, 'sp13.jpg', 1, -23.5479871, -46.6351942),
('Catedral da Sé', 'Maior igreja gótica da América Latina.', 'Diário 8h às 19h', 'Cripta arqueológica, vitrais, torre.', 0.00, 'Praça da Sé - Sé, São Paulo - SP, 01001-000', 'São Paulo', 'SP', 'Metrô (Est. Sé).', 'Centros Históricos e Igrejas', 3, 'sp14.webp', 1, -23.5512802, -46.6369176),
('Mosteiro de São Bento', 'Monastério beneditino do século XVI.', 'Segunda a sábado 9h às 17h; dom missas', 'Igreja barroca, cantos gregorianos.', 0.00, 'Largo de São Bento, s/n - Sé, São Paulo - SP, 01014-900', 'São Paulo', 'SP', 'Metrô (Est. São Bento).', 'Centros Históricos e Igrejas', 3, 'sp15.webp', 1, -23.5435486, -51.2482565),
('Igreja de São Francisco de Assis', 'Igreja barroca do século XVII.', 'Diário 8h às 17h', 'Talhas douradas, claustro.', 0.00, 'Largo São Francisco, s/n - Sé, São Paulo - SP, 01005-010', 'São Paulo', 'SP', 'A pé do centro histórico.', 'Centros Históricos e Igrejas', 3, 'sp16.webp', 1, -23.5497814, -46.7814183),


('Represa de Guarapiranga', 'Represa com áreas de lazer aquático.', 'Aberto 24h (atividades pagas variam)', 'Passeios de barco, pesca, praias artificiais.', 0.00, 'Av. das Nações Unidas, s/n - Parelheiros, São Paulo - SP, 04795-000', 'São Paulo', 'SP', 'Ônibus 607R ou carro via Rod. Régis Bittencourt.', 'Lazer', 4, 'sp17.jpg', 1, -23.7349023, -46.8384045),
('Lago do Parque Ibirapuera', 'Lago central com pedalinhos.', 'Das 9h às 17h (pedalinhos)', 'Passeios de barco, observação de aves.', 20.00, 'Av. Pedro Álvares Cabral, s/n - Vila Mariana, São Paulo - SP, 04094-000', 'São Paulo', 'SP', 'Metrô (Est. AACD-Servidor).', 'Lazer', 4, 'sp18.JPG', 1, -23.5861253, -46.6655847),
('Represa de Taiaçupeba', 'Área natural com cachoeiras e banho.', 'Aberto 24h', 'Piscinas naturais, camping.', 0.00, 'Estrada de Taiaçupeba, km 5 - Suzano (próximo SP), SP', 'São Paulo', 'SP', 'Carro via Rod. Índio Tibiriçá (acesso de SP).', 'Lazer', 4, 'sp19.jpg', 1, -23.5929799, -46.2953524),


('Shopping Ibirapuera', 'Shopping de luxo com 450 lojas.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Marcas internacionais, cinemas, food hall.', 0.00, 'Av. Ibirapuera, 3103 - Moema, São Paulo - SP, 04078-002', 'São Paulo', 'SP', 'Metrô (Linha 5-Lilás, Est. Eucaliptos).', 'Centros Comerciais', 5, 'sp20.jfif', 1, -23.6102566, -46.6692184),
('Shopping Eldorado', 'Shopping familiar com expansão recente.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Aquário temático, praça de alimentação.', 0.00, 'Av. Rebouças, 3970 - Pinheiros, São Paulo - SP, 04502-001', 'São Paulo', 'SP', 'Ônibus 175R-10 ou carro via Av. Rebouças.', 'Centros Comerciais', 5, 'sp21.webp', 1, -23.5725766, -46.6985826),
('Shopping Morumbi', 'Maior shopping de SP com 490 lojas e áreas de lazer.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Pista de gelo, gourmet, eventos corporativos.', 0.00, 'Av. Roque Petroni Júnior, 1089 - Brooklin Novo, São Paulo - SP, 04552-000', 'São Paulo', 'SP', 'Ônibus 675P-10 ou carro via Av. Berrini.', 'Centros Comerciais', 5, 'sp22.webp', 1, -23.6233618, -46.7014101),
('Shopping JK Iguatemi', 'Shopping de alto padrão com marcas de luxo.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Designers internacionais, restaurantes finos, cinema.', 0.00, 'Av. Pres. Juscelino Kubitschek, 2041 - Vila Olímpia, São Paulo - SP, 04543-011', 'São Paulo', 'SP', 'Metrô (Linha 4-Amarela, Est. Fradique Coutinho) + ônibus ou carro via Av. Juscelino Kubitschek.', 'Centros Comerciais', 5, 'sp23.webp', 1, -23.591448, -46.692394),
('Shopping Anália Franco', 'Shopping familiar no leste da cidade.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Cinemas, praça de alimentação, brinquedoteca.', 0.00, 'Av. Regente Feijó, 1739 - Vila Ré, São Paulo - SP, 03621-000', 'São Paulo', 'SP', 'Ônibus 311M-10 ou metrô (Linha 3-Vermelha, Est. Guilhermina-Esperança).', 'Centros Comerciais', 5, 'sp24.webp', 1, -23.5614365, -46.563005),

('Teatro Municipal de São Paulo', 'Principal casa de ópera e espetáculos clássicos desde 1911.', 'Varia por evento (geralmente 20h; visitas guiadas sáb/dom 12h)', 'Óperas, balés, orquestra sinfônica.', 50.00, 'Praça Ramos de Azevedo - República, São Paulo - SP, 01018-010', 'São Paulo', 'SP', 'Metrô (Linha 3-Vermelha, Est. República) ou ônibus centro.', 'Teatros e Cinemas', 6, 'sp25.webp', 1, -23.5452348, -46.638615),
('Theatro São Pedro', 'Teatro histórico com programação variada.', 'Varia por evento (bilheteria 10h às 20h)', 'Peças teatrais, musicais, concertos.', 40.00, 'Rua Barra Funda, 171 - Barra Funda, São Paulo - SP, 01152-000.', 'São Paulo', 'SP', 'Metrô (Linha 4-Amarela, Est. República).', 'Teatros e Cinemas', 6, 'sp26.webp', 1, -23.5323024, -51.2680899),
('CineSesc', 'Cinema cultural com filmes independentes e debates.', 'Varia por sessão (geralmente 14h às 22h)', 'Mostras internacionais, curtas-metragens.', 20.00, 'R. Augusta, 2070 - Consolação, São Paulo - SP, 01312-000', 'São Paulo', 'SP', 'Metrô (Linha 2-Verde, Est. Consolação).', 'Teatros e Cinemas', 6, 'sp27.jpg', 1, -23.5604023, -46.6650621),
('Espaço Itaú de Cinema Frei Caneca', 'Complexo de cinemas com foco em arte.', 'Varia por sessão (10h às 0h)', 'Salas temáticas, festivais de cinema.', 30.00, 'R. Frei Caneca, 569 - Consolação, São Paulo - SP, 01307-001', 'São Paulo', 'SP', 'Metrô (Linha 2-Verde, Est. Consolação).', 'Teatros e Cinemas', 6, 'sp28.webp', 1, -23.5552186, -46.6607461),
('Auditório Ibirapuera', 'Espaço para shows e concertos ao ar livre/coberto.', 'Varia por evento (bilheteria 10h às 18h)', 'Apresentações de jazz, rock, clássica.', 60.00, 'Av. Pedro Álvares Cabral, s/n - Ibirapuera, São Paulo - SP, 04094-000', 'São Paulo', 'SP', 'Metrô (Est. AACD-Servidor).', 'Teatros e Cinemas', 6, 'sp29.jpg', 1, -23.5855891, -46.6591305),
('Sala São Paulo', 'Sala de concertos da orquestra sinfônica.', 'Varia por evento (geralmente 20h)', 'Acústica perfeita, arquitetura neoclássica.', 80.00, 'Pça. Júlio Prestes, 16 - Nova Estação, São Paulo - SP, 01224-010', 'São Paulo', 'SP', 'Metrô/CPTM (Est. Júlio Prestes).', 'Teatros e Cinemas', 6, 'sp30.webp', 1, -23.5342039, -46.6423433),

('Zoológico de São Paulo', 'Maior zoológico da América Latina com 3.200 animais.', 'Seg a sex 9h às 17h; sáb/dom 9h às 18h', 'Safari, aquário integrado, shows educativos.', 35.00, 'Av. Miguel Estéfano, 4241 - Água Funda, São Paulo - SP, 04301-905', 'São Paulo', 'SP', 'Ônibus 4742-10 ou carro via Av. do Cursino.', 'Parques Temáticos', 7, 'sp31.webp', 1, -23.6508725, -46.6230244),
('Parque da Mônica', 'Parque temático infantil baseado em quadrinhos de Mauricio de Sousa.', 'Quarta a domingo, 10h às 17h', 'Atrações com Cebolinha, Cascão; shows interativos.', 80.00, 'R. Dr. Zuquim, 555 - Jd. Ipanema, São Paulo - SP, 04279-000', 'São Paulo', 'SP', 'Metrô (Linha 1-Azul, Est. Jabaquara) + ônibus 7.', 'Parques Temáticos', 7, 'sp32.webp', 1, -23.6785342, -46.70124),
('Aquário de São Paulo', 'Maior aquário da América Latina com 3.500 espécies.', 'Seg a sex 9h às 17h; sáb/dom 9h às 19h', 'Túnel subaquático, pinguinário, toques em arraias.', 100.00, 'R. Huet Bacelar, 407 - Mooca, São Paulo - SP, 03121-050', 'São Paulo', 'SP', 'Ônibus 3111-10 ou metrô (Linha 3-Vermelha, Est. Bresser-Mooca).', 'Parques Temáticos', 7, 'sp33.webp', 1, -23.5933082, -46.6166203),
('Playcenter Family', 'Parque de diversões familiar com brinquedos clássicos.', 'Sáb a dom e feriados, 13h às 20h', 'Montanha-russa, carrossel, arcade.', 60.00, 'Av. Aricanduva, 5555 - Vila Matilde, São Paulo - SP, 03527-900', 'São Paulo', 'SP', 'Ônibus 6166-10 ou metrô (Linha 5-Lilás, Est. Moema).', 'Parques Temáticos', 7, 'sp36.webp', 1, -23.5667268, -46.5073111),

('Mercado Municipal de São Paulo (Mercadão)', 'Mercado histórico com produtos frescos e comidas típicas.', 'Seg a sáb 7h às 18h; qui a dom até 19h', 'Sanduíche de mortadela, bacalhau, frutas exóticas.', 0.00, 'R. da Cantareira, 306 - Sé, São Paulo - SP, 01024-000', 'São Paulo', 'SP', 'Metrô (Linha 1-Azul, Est. São Bento).', 'Mercados e Feiras', 8, 'sp37.jpg', 1, -23.5420217, -46.631986),
('Mercado de Pinheiros', 'Mercado orgânico com foco em produtores locais.', 'Seg a sáb 9h às 17h', 'Queijos artesanais, pães, pratos gourmet.', 0.00, 'R. Silveira Martins, 20 - Pinheiros, São Paulo - SP, 05417-000', 'São Paulo', 'SP', 'Metrô (Linha 4-Amarela, Est. Fradique Coutinho).', 'Mercados e Feiras', 8, 'sp38.jpg', 1, -23.5656709, -46.6952044),
('Feira da Liberdade', 'Feira asiática no bairro japonês.', 'Domingos 10h às 17h', 'Comidas orientais, artesanato, shows culturais.', 0.00, 'Praça da Liberdade - Liberdade, São Paulo - SP, 01502-000', 'São Paulo', 'SP', 'Metrô (Linha 1-Azul, Est. Liberdade).', 'Mercados e Feiras', 8, 'sp39.jpg', 1, -23.5551711, -46.6399066),
('Feira Orgânica do Parque Ibirapuera', 'Feira semanal de produtos orgânicos.', 'Sáb/dom 9h às 14h', 'Verduras, sucos naturais, artesanato sustentável.', 0.00, 'Av. Pedro Álvares Cabral, s/n - Ibirapuera, São Paulo - SP, 04094-000', 'São Paulo', 'SP', 'Metrô (Est. AACD-Servidor).', 'Mercados e Feiras', 8, 'sp40.webp', 1, -23.5818386, -46.6560668),
('Feira da Benedito Calixto', 'Feira de antiguidades e gastronomia.', 'Sáb 9h às 17h', 'Objetos vintage, doces caseiros, música ao vivo.', 0.00, 'Praça Benedito Calixto - Pinheiros, São Paulo - SP, 05406-040', 'São Paulo', 'SP', 'Ônibus 7752-10 ou metrô (Linha 1-Azul, Est. Paraíso).', 'Mercados e Feiras', 8, 'sp41.webp', 1, -23.5582085, -46.6831626);


INSERT INTO pontos_turisticos (ponto_turistico, descricao, horario_funcionamento, principais_atracoes, preco_medio, endereco, cidade, estado, formas_acesso, categoria, id_categoria, foto_principal, id_cidade, latitude, longitude) VALUES
('Parque Campolim', 'Parque urbano com lagos e áreas verdes extensas.', 'Diariamente das 6h às 20h', 'Pista de corrida, playground, lago com patos', 0.00, 'Av. Itavuvu 1500 - Campolim, Sorocaba - SP 18030-000', 'Sorocaba', 'SP', 'Ônibus linha 100 (STS), carro via Av. Itavuvu', 'Parques', 1, 'sr1.jpg', 2, -23.5301495, -47.4782328),
('Jardim Botânico de Sorocaba', 'Jardim com espécies nativas e programas educativos.', 'Diariamente das 9h às 17h', 'Estufas, viveiro, trilhas botânicas', 0.00, 'Rua Miguel Montoro Lozano, 340 - Jardim Iguatemi, Sorocaba - SP 18055-101', 'Sorocaba', 'SP', 'Ônibus linha 200', 'Parques', 1, 'sr2.jpg', 2, -23.4644975, -47.4397955),
('Parque São Bento', 'Parque com jardins e áreas de descanso.', 'Diariamente das 7h às 19h', 'Academia ao ar livre, lago ornamental', 0.00, 'Av. São Bento 100 - Centro, Sorocaba - SP 18010-000', 'Sorocaba', 'SP', 'A pé do centro', 'Parques', 1, 'sr3.jpg', 2, -23.434806, -47.5249367),
('Parque Kasaro Maru', 'Espaço sobre imigrantes italianos e japoneses.', 'Sábados e domingos das 14h às 18h', 'Artefatos culturais, fotos históricas', 0.00, 'Rua Itália 150 - Vila Fiori, Sorocaba - SP 18045-100', 'Sorocaba', 'SP', 'Carro via Av. São Francisco', 'Parques', 1, 'sr7.jpg', 2, -23.5163889, -47.4672971),
('Trilhas do Parque Natural Chico Mendes', 'Trilhas de hiking e mountain bike.', 'Diariamente das 8h às 17h', 'Rotas ecológicas, mirantes', 0.00, 'Av. Três de Março, 1025 - Alto da Boa Vista, Sorocaba - SP, 18087-480', 'Sorocaba', 'SP', 'Ônibus linha 150', 'Parques', 1, 'sr22.jpg', 2, -23.5126468, -47.7589284),


('Museu de Arte Contemporânea de Sorocaba', 'Galeria com acervo de arte moderna e local.', 'Terça a domingo das 10h às 18h', 'Obras contemporâneas, exposições interativas', 0.00, 'Av. São Francisco 955 - Vila Fiori, Sorocaba - SP 18045-000', 'Sorocaba', 'SP', 'Ônibus linha 200', 'Museus e Exposições', 2, 'sr4.jpg', 2, -23.4964059, -47.4565672),
('Museu Histórico Sorocabano', 'Acervo sobre a história colonial e industrial.', 'Terça a domingo das 9h às 17h', 'Documentos jesuítas, fotos da fundação', 5.00, 'Rua da Penha 497 - Centro, Sorocaba - SP 18010-100', 'Sorocaba', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'sr5.jpg', 2, -23.506739, -47.4403354),
('Secretária da Cultura de Sorocaba', 'Centro com folclore e tradições locais.', 'Segunda a sexta das 9h às 17h', 'Oficinas de artesanato, exposições folclóricas', 0.00, 'Av. Dr. Afonso Vergueiro, 600 - Centro, Sorocaba - SP, 18035-370', 'Sorocaba', 'SP', 'Ônibus linha 150', 'Museus e Exposições', 2, 'sr6.jpg', 2, -23.4968279, -47.4907318),
('Casarão do Brigadeiro Tobias', 'Casa histórica do fundador da cidade.', 'Terça a sexta das 9h às 16h', 'Mobiliário colonial, exposições', 0.00, 'Rua Brigadeiro Tobias 150 - Centro, Sorocaba - SP 18010-200', 'Sorocaba', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'sr14.jpg', 2, -23.5062903, -47.3660139),

('Praça Coronel Fernando Prestes', 'Praça central histórica com monumentos.', 'Aberto 24h', 'Chafariz antigo, casarões coloniais', 0.00, 'Praça Coronel Fernando Prestes s/n - Centro, Sorocaba - SP 18010-000', 'Sorocaba', 'SP', 'A pé do centro', 'Centros Históricos e Igrejas', 3, 'sr12.webp', 2, -23.5309348, -46.6351274),
('Estação Ferroviária de Sorocaba', 'Estação histórica com arquitetura antiga.', 'Diariamente das 5h às 23h', 'Trens antigos, exposições', 0.00, 'Av. Barão de Tatuí 100 - Centro, Sorocaba - SP 18010-400', 'Sorocaba', 'SP', 'Trem CPTM linha 9', 'Centros Históricos e Igrejas', 3, 'sr16.jpg', 2, -23.4962827, -47.4571254),
('Igreja Matriz de Sorocaba', 'Igreja histórica com arquitetura barroca.', 'Diariamente das 8h às 18h; missas variam', 'Altares dourados, vitrais', 0.00, 'Praça Cel. Fernando Prestes, S/Nº - Centro, Sorocaba - SP, 18010-160', 'Sorocaba', 'SP', 'A pé do centro', 'Centros Históricos e Igrejas', 3, 'sr25.jpg', 2, -23.5002728, -47.462976),
('Igreja de São Bento', 'Igreja colonial com festas tradicionais.', 'Diariamente das 9h às 17h', 'Imagens sacras, festas religiosas', 0.00, 'Av. Vinícius de Moraes, 1001 - Parque São Bento, Sorocaba - SP, 18072-060', 'Sorocaba', 'SP', 'Ônibus linha 100', 'Centros Históricos e Igrejas', 3, 'sr26.avif', 2, -23.4347254, -47.5779563),
('Igreja Nossa Senhora da Piedade', 'Igreja com devoção mariana.', 'Diariamente das 7h às 20h', 'Novena, jardim de oração', 0.00, 'rua padre antônio bento, 86 jardim paraíso - Éden, Sorocaba - SP, 18103-000', 'Sorocaba', 'SP', 'Ônibus linha 200', 'Centros Históricos e Igrejas', 3, 'sr27.jpg', 2, -23.4180406, -47.4119732),
('Santuário de Nossa Senhora Aparecida', 'Santuário com romarias regionais.', 'Diariamente das 8h às 18h', 'Réplica da imagem, missas', 0.00, 'Av. Ipanema, 1085 - Vila Nova Sorocaba, Sorocaba - SP, 18070-671', 'Sorocaba', 'SP', 'Ônibus linha 150', 'Centros Históricos e Igrejas', 3, 'sr28.jpg', 2, -23.4816885, -47.6223595),
('Igreja Batista de Sorocaba', 'Igreja evangélica com cultos e retiros.', 'Diariamente das 7h às 19h', 'Auditório, grupos de estudo', 0.00, 'R. Porphyrio Loureiro, 156 - Jardim Santa Rosália, Sorocaba - SP, 18090-060', 'Sorocaba', 'SP', 'A pé da estação', 'Centros Históricos e Igrejas', 3, 'sr29.jpg', 2, -23.491627, -47.5910808),


('Clube de Campo Sorocaba', 'Área com piscina e lago praiano para visitantes.', 'Sábados e domingos das 10h às 16h', 'Jet ski aluguel, banho supervisionado', 30.00, 'Rua do Clube 300 - Vila Helena, Sorocaba - SP 18085-100', 'Sorocaba', 'SP', 'Ônibus linha 300', 'Lazer', 4, 'sr11.webp', 2, -23.4825402, -47.4311935),
('Kartódromo de Sorocaba', 'Pista para kart e esportes motorizados.', 'Sábados e domingos das 9h às 18h', 'Corridas de kart, simuladores', 80.00, 'Rua Paula Donaio Schincariol, 1000 Ch. Agrícola Bandeirantes, Itu - SP, 13313-650', 'Sorocaba', 'SP', 'Carro via Itu', 'Lazer', 4, 'sr21.jpg', 2, -23.2476498, -47.6290645),
('Clube de Escalada de Sorocaba', 'Ginásio para escalada indoor e cursos.', 'Segunda a sábado das 14h às 22h', 'Paredes artificiais, boulder', 30.00, 'Av. Getúlio Vargas, 475 - Jardim Sao Paulo, Sorocaba - SP, 18051-480', 'Sorocaba', 'SP', 'Ônibus linha 300', 'Lazer', 4, 'sr23.webp', 2, -23.5227955, -47.4981809),
('Centro de Tiro e Arco de Sorocaba', 'Campo para tiro ao alvo e arquería.', 'Sábados e domingos das 10h às 16h', 'Alvos móveis, tirolesa', 40.00, 'R. Mário Soave, 512 - Central Parque Sorocaba, Sorocaba - SP, 18051-045', 'Sorocaba', 'SP', 'Carro via Av. São Francisco', 'Lazer', 4, 'sr24.png', 2, -23.5116246, -47.5393554),


('Shopping Iguatemi Esplanada', 'Shopping com lojas variadas e praça de alimentação.', 'Segunda a sábado 10h-22h; dom 14h-20h', 'Marcas nacionais e internacionais, restaurantes', 50.00, 'Av. Itavuvu 2000 - Campolim, Sorocaba - SP 18030-300', 'Sorocaba', 'SP', 'Ônibus linha 100', 'Centros Comerciais', 5, 'sr18.jpg', 2, -23.5336612, -47.4660183),
('Centro Comercial Sorocaba', 'Área comercial com lojas e gastronomia local.', 'Segunda a sábado 9h-19h', 'Lojas de rua, cafés regionais', 40.00, 'Rua Barão do Rio Branco 300 - Centro, Sorocaba - SP 18010-600', 'Sorocaba', 'SP', 'Ônibus linha 150', 'Centros Comerciais', 5, 'sr19.jpeg', 2, -23.4814855, -47.5427258),


('Teatro Municipal de Sorocaba', 'Teatro histórico com espetáculos variados.', 'Apresentações variam; visitas sáb/dom 14h-17h', 'Palco de 600 lugares, acústica avançada', 25.00, 'Rua Barão do Rio Branco 100 - Centro, Sorocaba - SP 18010-100', 'Sorocaba', 'SP', 'Ônibus linha 100', 'Teatros e Cinemas', 6, 'sr13.webp', 2, -23.4770312, -47.4227984),
('Sesc Sorocaba', 'Centro cultural com teatro e shows.', 'Terça a domingo das 9h às 21h', 'Teatro de arena, festivais anuais', 15.00, 'R. Barão de Piratininga, 555 - Jardim Faculdade, Sorocaba - SP, 18030-160', 'Sorocaba', 'SP', 'Ônibus linha 200', 'Teatros e Cinemas', 6, 'sr30.webp', 2, -23.5135421, -47.4634377),


('Represa de Itupararanga (acesso Sorocaba)', 'Represa com praias artificiais e esportes aquáticos.', 'Diariamente das 8h às 18h', 'Banho, pesca, jet ski', 15.00, 'Rod. Raposo Tavares km 110 - limite Sorocaba, Sorocaba - SP 18080-000', 'Sorocaba', 'SP', 'Carro via Rod. Raposo Tavares', 'Parques Temáticos', 7, 'sr8.jpg', 2, -23.6119053, -47.5414091),
('Parque Natural - Porto das Águas', 'Lago com bordas praianas no parque.', 'Diariamente das 6h às 20h', 'Pedalinhos, churrasqueiras aquáticas', 0.00, 'Avenida Quinze de Agosto, 5882-6300 - Sorocaba, SP', 'Sorocaba', 'SP', 'A pé do parque', 'Parques Temáticos', 7, 'sr9.webp', 2, -23.4677113, -47.4514626),
('Represa Hedberg Rio Ipanema', 'Represa com praias fluviais e esportes náuticos.', 'Diariamente das 7h às 19h', 'Canoagem, mergulho recreativo', 20.00, 'Estrada Municipal km 15 - Ipanema (20km), Sorocaba - SP 18090-000', 'Sorocaba', 'SP', 'Carro via Rod. Raposo Tavares', 'Parques Temáticos', 7, 'sr10.jpg', 2, -23.427472, -47.598056),


('Mercado Municipal de Sorocaba', 'Mercado tradicional com arquitetura preservada.', 'Segunda a sábado das 7h às 18h', 'Bancas de alimentos, artesanato', 0.00, 'Av. São Paulo 200 - Centro, Sorocaba - SP 18010-300', 'Sorocaba', 'SP', 'Ônibus linha 150', 'Mercados e Feiras', 8, 'sr15.jpg', 2, -23.498369, -47.4626959),
('Feira de Artesanato de Sorocaba', 'Feira semanal com produtos locais e comida.', 'Sábados das 9h às 17h', 'Artesanato, doces caseiros', 20.00, 'Praça Coronel Fernando Prestes s/n - Centro, Sorocaba - SP 18010-000', 'Sorocaba', 'SP', 'Ônibus linha 200', 'Mercados e Feiras', 8, 'sr20.jpg', 2, -23.480823, -47.5117065),
('Bairro do Centro Histórico de Sorocaba', 'Bairro com ruas antigas e construções coloniais.', 'Aberto 24h', 'Caminhadas guiadas, murais históricos', 0.00, 'Rua Barão do Rio Branco - Centro, Sorocaba - SP 18010-500', 'Sorocaba', 'SP', 'A pé ou bike', 'Mercados e Feiras', 8, 'sr17.jpeg', 2, -23.5000167, -47.4601105);


INSERT INTO pontos_turisticos (ponto_turistico, descricao, horario_funcionamento, principais_atracoes, preco_medio, endereco, cidade, estado, formas_acesso, categoria, id_categoria, foto_principal, id_cidade, latitude, longitude) VALUES
('Parque Ecológico Monsenhor Emílio José Salim', 'Maior parque de Campinas com mata nativa e lago.', 'Terça a domingo, 9h às 17h', 'Trilhas, observação de aves, pedalinhos no lago.', 0.00, 'Rod. Heitor Penteado - Campinas, SP, 13092-543', 'Campinas', 'SP', 'Ônibus 5.2 do Terminal Centro ou carro via Av. John Boyd Dunlop.', 'Parques', 1, 'cp1.jpg', 3, -22.9027518, -47.0306538),
('Parque Portugal (Taquaral)', 'Parque icônico com lago e áreas recreativas.', 'Das 6h às 20h', 'Castelo, museu, ciclovia, feiras de artesanato.', 0.00, 'Av. Dr. Heitor Penteado, 1671 - Parque Taquaral, Campinas - SP, 13087-000', 'Campinas', 'SP', 'Ônibus 15 ou carro via Rod. Anhanguera.', 'Parques', 1, 'cp2.webp', 3, -22.8752743, -47.1963872),
('Parque Botânico Amador Aguiar', 'Reserva florestal com trilhas e preservação ambiental.', 'Seg a sex 8h às 17h; sáb/dom 9h às 16h', 'Trilhas ecológicas, viveiro de mudas, piqueniques.', 0.00, 'Avenida Wellman Galvão de França Rangel - Swiss Park, Campinas - SP, 13049-254', 'Campinas', 'SP', 'Ônibus 68 ou carro via Av. Norte-Sul.', 'Parques', 1, 'cp3.webp', 3, -22.9617255, -47.3622306),
('Parque Linear Ribeirão das Pedras', 'Parque linear ao longo do ribeirão com áreas verdes.', 'Das 7h às 19h', 'Caminhadas, ciclovia, observação de natureza urbana.', 0.00, 'R. Marquês de Abrantes - Jardim Santa Genebra, Campinas - SP, 13080-220', 'Campinas', 'SP', 'Ônibus centro ou carro via Av. Orosimbo Maia.', 'Parques', 1, 'cp4.webp', 3, -22.848441, -47.0691931),
('Jardim Botânico de Unicamp', 'Jardim universitário com plantas nativas e exóticas.', 'Seg a sex 8h às 17h (visitas agendadas)', 'Estufas, herbário, trilhas botânicas.', 0.00, 'Cidade Universitária Zeferino Vaz - Barão Geraldo, Campinas - SP, 13083-970', 'Campinas', 'SP', 'Ônibus Unicamp ou carro via Rod. Campinas-Mogi.', 'Parques', 1, 'cp5.webp', 3, -22.8184393, -47.3531117),

('Museu de Arte de Campinas (MACC)', 'Acervo de arte contemporânea e moderna brasileira.', 'Ter a dom 10h às 18h', 'Obras de Tomie Ohtake, exposições temporárias.', 0.00, 'Av. Benjamin Constant, 1633 - Centro, Campinas - SP, 13010-142', 'Campinas', 'SP', 'Ônibus 68 ou carro via Av. Andrade Neves.', 'Museus e Exposições', 2, 'cp6.jpg', 3, -22.8620537, -47.1052054),
('Museu Histórico de Campinas', 'Museu sobre a fundação e desenvolvimento da cidade.', 'Ter a sex 9h às 17h; sáb/dom 10h às 16h', 'Artefatos coloniais, fotos antigas, salão nobre.', 5.00, 'Rua Coronel Quirino, 02, Parque Bosque dos Jequitibas - Bosque, Campinas - SP, 13025-004', 'Campinas', 'SP', 'Ônibus 15 ou a pé do Largo do Pará.', 'Museus e Exposições', 2, 'cp7.webp', 3, -22.9097254, -47.0515562),

('Catedral Metropolitana de Campinas', 'Igreja neogótica do século XIX, marco histórico.', 'Diário 7h às 19h', 'Vitrais, torre com vista, cripta.', 0.00, 'Praça José Bonifácio, s/n - Centro, Campinas - SP, 13010-190', 'Campinas', 'SP', 'A pé do centro ou ônibus 15.', 'Centros Históricos e Igrejas', 3, 'cp8.webp', 3, -22.9059498, -47.0629112),
('Largo do Pará', 'Praça histórica com edifícios coloniais.', 'Aberto 24h', 'Igreja do Rosário, palacete, arquitetura imperial.', 0.00, 'Largo do Pará - Centro, Campinas - SP 13015-060', 'Campinas', 'SP', 'Ônibus centro', 'Centros Históricos e Igrejas', 3, 'cp9.webp', 3, -22.9099674, -47.0592557),
('Estação Ferroviária Antiga de Campinas', 'Estação histórica de 1884, hoje centro cultural.', 'Seg a sex 9h às 17h', 'Arquitetura vitoriana, exposições sobre ferrovias.', 0.00, 'Praça Mal. Floriano Peixoto - Centro, Campinas - SP, 13010-061', 'Campinas', 'SP', 'Ônibus 68.', 'Centros Históricos e Igrejas', 3, 'cp10.jpg', 3, -22.9086265, -47.0693022),

('Represa Jaguari', 'Represa com áreas de banho e esportes náuticos.', 'Aberto 24h (atividades das 9h às 17h)', 'Banho, pesca, passeios de barco.', 0.00, 'Estr. Mun. do Jaguari - Rio Abaixo, Jacareí - SP, 12334-400', 'Campinas', 'SP', 'Carro via Rod. Campinas-Mogi ou ônibus 68.', 'Lazer', 4, 'cp11.jpg', 3, -22.9503722, -47.9763271),
('Parque Aquático do Taquaral (área temática)', 'Espaço com piscinas e fontes no parque.', 'Das 10h às 16h (verão)', 'Piscinas infantis, toboáguas leves.', 10.00, 'Av. Dr. Heitor Penteado, 1671 - Parque Taquaral, Campinas - SP, 13087-000', 'Campinas', 'SP', 'Ônibus 15.', 'Lazer', 4, 'cp12.jpeg', 3, -22.8725768, -47.0792358),

('Shopping Iguatemi Campinas', 'Shopping premium com marcas de luxo.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Cinemas, gourmet, eventos.', 0.00, 'Av. Iguatemi, 777 - Vila Brandina, Campinas - SP, 13092-902', 'Campinas', 'SP', 'Ônibus 68 ou carro via Av. Norte-Sul.', 'Centros Comerciais', 5, 'cp13.jpg', 3, -22.8926428, -47.0298425),
('Shopping Galleria Campinas', 'Shopping familiar com lazer integrado.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Boliche, cinemas, praça de alimentação.', 0.00, 'Av. Bailarina Selma Parada, s/n - Jardim Nilópolis, Campinas - SP, 13091-901', 'Campinas', 'SP', 'Ônibus 5.2.', 'Centros Comerciais', 5, 'cp14.jpg', 3, -22.8634858, -47.0258773),
('Shopping Parque Dom Pedro', 'Maior shopping da região com 500 lojas.', 'Seg a sáb 10h às 22h; dom 14h às 20h', 'Aquário, pista de kart, restaurantes.', 0.00, 'Av. Guilherme Campos, 500 - Jardim Santa Genebra, Campinas - SP, 13080-000', 'Campinas', 'SP', 'Ônibus 15 ou carro via Rod. Anhanguera.', 'Centros Comerciais', 5, 'cp15.png', 3, -22.8475663, -47.0656794),
('Shopping Prado', 'Shopping tradicional com serviços essenciais.', 'Seg a sáb 9h às 21h; dom 14h às 19h', 'Supermercado, farmácias, lojas variadas.', 0.00, 'Av. Washington Luíz, 2.480 - Parque Prado, Campinas - SP, 13042-105', 'Campinas', 'SP', 'Ônibus 68.', 'Centros Comerciais', 5, 'cp16.jpg', 3, -22.9376536, -47.0521741),

('Teatro Castro Mendes', 'Principal casa de espetáculos de Campinas.', 'Varia por evento (bilheteria 10h às 20h)', 'Peças, musicais, concertos sinfônicos.', 40.00, 'Rua Conselheiro Gomide, 62 - Vila Industrial (Campinas), Campinas - SP, 13035-320', 'Campinas', 'SP', 'Ônibus 15 ou a pé do centro.', 'Teatros e Cinemas', 6, 'cp17.jpeg', 3, -22.9110233, -47.067768),
('Auditório do Iguatemi', 'Espaço para shows e eventos no shopping.', 'Varia por evento (geralmente 19h)', 'Concertos, stand-up, apresentações musicais.', 50.00, 'Av. Iguatemi, 777 - Vila Brandina, Campinas - SP, 13092-902', 'Campinas', 'SP', 'Ônibus 68 ou carro via Av. Norte-Sul.', 'Teatros e Cinemas', 6, 'cp18.jpg', 3, -22.8926428, -47.045292),
('Cinemark do Galleria', 'Complexo de cinemas moderno com salas VIP.', 'Varia por sessão (10h às 0h)', 'Filmes 3D, IMAX, pipoca gourmet.', 35.00, 'Jardim Nilópolis Rodovia Dom Pedro I - Km 131.5 Galleria Shopping, Loja A227, Campinas - SP', 'Campinas', 'SP', 'Ônibus 5.2.', 'Teatros e Cinemas', 6, 'cp19.jpg', 3, -22.86343, -47.0259149),
('Teatro de Arena de Campinas', 'Espaço ao ar livre para espetáculos teatrais.', 'Varia por evento (sáb/dom 20h)', 'Peças contemporâneas, festivais de teatro.', 25.00, 'Cambuí, Campinas - SP, 13025-066', 'Campinas', 'SP', 'Ônibus Unicamp ou carro via Rod. Campinas-Mogi.', 'Teatros e Cinemas', 6, 'cp20.jpg', 3, -22.902502, -47.1254745),

('Bosque dos Jequitibás', 'Zoológico universitário com foco em conservação.', 'Seg a sex 9h às 16h (visitas agendadas)', 'Animais nativos, palestras educativas, observação.', 0.00, 'R. Cel. Quirino, 02 - Bosque, Campinas - SP, 13025-004', 'Campinas', 'SP', 'Ônibus Unicamp.', 'Parques Temáticos', 7, 'cp21.webp', 3, -22.9093173, -47.0534533),
('Parque de Diversões Hopi Hari (próximo a Campinas)', 'Parque temático com atrações radicais (acesso fácil de Campinas).', 'Sáb/dom e feriados 10h às 18h', 'Montanha-russa, shows, áreas temáticas.', 120.00, 'Rod. dos Bandeirantes, km 72 - Moinho, Vinhedo - SP, 13288-390', 'Campinas', 'SP', 'Carro via Rod. Anhanguera (ônibus intermunicipal).', 'Parques Temáticos', 7, 'cp22.jpg', 3, -23.097736, -47.01114),
('Parque Infantil do Taquaral (temático para crianças)', 'Área lúdica com brinquedos temáticos e mini-zoo.', 'Das 9h às 17h', 'Carrossel, playgrounds, animais de granja.', 0.00, 'Av. Dr. Heitor Penteado, 1671 - Parque Taquaral, Campinas - SP, 13087-000', 'Campinas', 'SP', 'Ônibus 15.', 'Parques Temáticos', 7, 'cp23.jpg', 3, -22.8752743, -47.0547665),

('Mercado Municipal de Campinas', 'Mercado central com produtos frescos e comidas típicas.', 'Seg a sáb 7h às 18h; dom 7h às 12h', 'Frutas, queijos, pastelarias, pratos caipiras.', 0.00, 'Av. Benjamin Constant, 875 - Centro, Campinas - SP, 13013-010', 'Campinas', 'SP', 'Ônibus centro ou a pé da Av. Francisco Glicério.', 'Mercados e Feiras', 8, 'cp24.webp', 3, -22.9032225, -47.0663017),
('Feira de Barão Geraldo', 'Feira de produtos orgânicos e sustentáveis.', 'Sábados 8h às 13h', 'Verduras, pães artesanais, sucos naturais.', 0.00, 'Rua Manoel Antunes Novo, 850 - Barão Geraldo, Campinas - SP, 13084-175', 'Campinas', 'SP', 'Ônibus Unicamp.', 'Mercados e Feiras', 8, 'cp25.webp', 3, -22.832454, -47.1062326),
('Feira de Malhas e Gastronomia do Cambuí', 'Feira mensal com roupas e food trucks.', 'Varia por evento (geralmente sáb 10h às 20h)', 'Comidas gourmet, doces, música ao vivo.', 0.00, 'R. Maria Monteiro, 1042 - Cambuí, Campinas - SP, 13025-151', 'Campinas', 'SP', 'Ônibus centro.', 'Mercados e Feiras', 8, 'cp26.jpg', 3, -22.8950935, -48.2058938);


INSERT INTO pontos_turisticos (ponto_turistico, descricao, horario_funcionamento, principais_atracoes, preco_medio, endereco, cidade, estado, formas_acesso, categoria, id_categoria, foto_principal, id_cidade, latitude, longitude) VALUES
('Parque Prefeito Luiz Roberto Jábali', 'Parque urbano com mata nativa e áreas de lazer.', 'Diariamente das 6h às 20h', 'Trilhas ecológicas, playground, pista de corrida', 0.00, 'Av. Costábile Romano, S/n - Ribeirânia, Ribeirão Preto - SP, 14096-030', 'Ribeirão Preto', 'SP', 'Ônibus linha 100 (Transurbano), carro via Av. Cel. Fernando', 'Parques', 1, 'rp1.webp', 4, -21.1959747, -47.7966251),
('Parque Ecológico Maurílio Biagi', 'Reserva com lagos e foco em preservação.', 'Diariamente das 7h às 19h', 'Lago artificial, observatório de aves, ciclovia', 0.00, '107, Av. Elpídio Gomes, 1 - Vila Amelia, Ribeirão Preto - SP', 'Ribeirão Preto', 'SP', 'Ônibus linha 200', 'Parques', 1, 'rp2.jpg', 4, -21.1754673, -47.8189284),
('Horto Florestal de Ribeirão Preto', 'Área de reflorestamento com trilhas leves.', 'Segunda a sexta das 8h às 17h', 'Trilhas ecológicas, viveiros, observação de fauna', 0.00, 'Av. Manoel Antônio Dias, 551 - Jardim Marchesi, Ribeirão Preto - SP, 14031-330', 'Ribeirão Preto', 'SP', 'Ônibus linha 300', 'Parques', 1, 'rp3.jpeg', 4, -21.2067801, -47.8394738),
('Parque do Morro do São Bento', 'Parque com mirante e jardins panorâmicos.', 'Diariamente das 8h às 18h', 'Mirante da cidade, academia ao ar livre', 0.00, 'R. Dom João VI, 305-375 - Jardim Mosteiro, Ribeirão Preto - SP, 14085-290', 'Ribeirão Preto', 'SP', 'A pé do centro', 'Parques', 1, 'rp4.jpg', 4, -21.1727607, -47.8015995),

('Museu da Cana', 'Museu sobre a produção de cachaça e cultura caipira.', 'Terça a domingo das 10h às 18h', 'Degustações, alambiques antigos, exposições interativas', 10.00, 'Fazenda Engenho Central, 1 - Zona Rural, Pontal - SP, 14180-000', 'Ribeirão Preto', 'SP', 'Ônibus linha 100', 'Museus e Exposições', 2, 'rp5.png', 4, -21.0772773, -48.0140999),
('Museu Histórico de Ribeirão Preto', 'Acervo sobre a história cafeeira e colonização.', 'Terça a sexta das 9h às 16h', 'Documentos coloniais, fotos da era do café', 5.00, 'Av. Prof. Dr. Zeferino Vaz, S/n - Campus da Usp, Ribeirão Preto - SP, 14040-020', 'Ribeirão Preto', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'rp6.jpg', 4, -21.171353, -47.8525876),
('Museu do Café', 'Acervo dedicado à história do café em Ribeirão.', 'Terça a domingo das 10h às 16h', 'Moinhos, sacas antigas, degustações', 0.00, 'Campus da USP, Av. Prof. Dr. Zeferino Vaz, s/n - Vila Monte Alegre, Ribeirão Preto - SP, 14040-020', 'Ribeirão Preto', 'SP', 'Ônibus linha 100', 'Museus e Exposições', 2, 'rp7.jpg', 4, -21.17071, -47.8528041),

('Bairro do Centro Histórico de RP', 'Bairro com ruas antigas e construções rurais.', 'Aberto 24h', 'Caminhadas guiadas, murais cafeeiros', 0.00, 'Rua Capitão Salomão - Centro, Ribeirão Preto - SP 14010-500', 'Ribeirão Preto', 'SP', 'A pé ou bike', 'Centros Históricos e Igrejas', 3, 'rp12.jpeg', 4, -21.1770907, -47.8197961),
('Igreja Matriz de Ribeirão Preto', 'Igreja histórica de 1900 com arquitetura neogótica.', 'Diariamente das 8h às 18h; missas variam', 'Vitrais coloridos, torre sineira', 0.00, 'R. Florêncio de Abreu, S/N - Centro, Ribeirão Preto - SP, 14015-060', 'Ribeirão Preto', 'SP', 'A pé do centro', 'Centros Históricos e Igrejas', 3, 'rp18.jpg', 4, -21.1692402, -47.8534934),
('Igreja de São Francisco de Assis', 'Igreja colonial com festas religiosas anuais.', 'Diariamente das 9h às 17h', 'Imagens históricas, capela lateral', 0.00, 'R. João Ferracine, 335 - Subsetor Leste - 5 (L-5), Ribeirão Preto - SP, 14090-550', 'Ribeirão Preto', 'SP', 'Ônibus linha 100', 'Centros Históricos e Igrejas', 3, 'rp19.jpg', 4, -21.1858574, -50.0862012),


('Kartódromo de Ribeirão Preto', 'Pista de kart para corridas de aventura.', 'Sábados e domingos das 9h às 18h', 'Kart profissional, simuladores', 70.00, 'Shopping Santa Úrsula - Estacionamento G5, R. São José, 933 - Higienópolis, Ribeirão Preto - SP, 14010-160', 'Ribeirão Preto', 'SP', 'Carro via Av. Fiusa', 'Lazer', 4, 'rp16.webp', 4, -21.1823607, -47.8112149),
('Represa de Sertãozinho (acesso RP)', 'Represa com praias artificiais e lazer aquático.', 'Diariamente das 8h às 18h (fim de semana)', 'Banho, pesca, barcos a remo', 15.00, 'Av. Dr. Romeu Bonini, s/nº - Água Vermelha, Sertãozinho - SP, 14175-300', 'Ribeirão Preto', 'SP', 'Carro via Rod. Anhanguera, ônibus linha 400', 'Lazer', 4, 'rp8.jpeg', 4, -21.1281418, -50.3482088),
('Centro de Tiro e Arco de Ribeirão', 'Campo para tiro ao alvo e arquería.', 'Sábados e domingos das 10h às 16h', 'Alvos móveis, tirolesa adjacente', 40.00, 'R. Padre Elídio Marchesi, KM 04 - ZONA RURAL, Sertãozinho - SP, 14179-122', 'Ribeirão Preto', 'SP', 'Carro via Av. Cel. Fernando', 'Lazer', 4, 'rp17.jfif', 4, -21.183356, -50.1255849),


('Shopping Ribeirão', 'Shopping regional com lojas e food court.', 'Segunda a sábado 10h-22h; dom 14h-20h', 'Marcas nacionais, restaurantes italianos e japoneses', 50.00, 'Av. Cel. Fernando Ferreira Leite, 1540 - Jardim California, Ribeirão Preto - SP, 14026-900', 'Ribeirão Preto', 'SP', 'Ônibus linha 100, carro via Av. Cel. Fernando', 'Centros Comerciais', 5, 'rp13.webp', 4, -21.2127492, -47.818518),
('Shopping Iguatemi Ribeirão Preto', 'Shopping premium com gastronomia diversificada.', 'Segunda a sábado 10h-22h; dom 14h-20h', 'Food hall com pratos internacionais, cinemas', 45.00, 'Av. Luiz Eduardo Toledo Prado, 900 - Vila do Golfe, Ribeirão Preto - SP, 14027-250', 'Ribeirão Preto', 'SP', 'Ônibus linha 150', 'Centros Comerciais', 5, 'rp15.png', 4, -21.2258911, -47.8370851),


('Teatro Municipal de Ribeirão Preto', 'Teatro principal com espetáculos clássicos.', 'Apresentações variam; visitas sáb/dom 14h-17h', 'Palco de 700 lugares, acústica premium', 25.00, 'Via São Bento - Campos Elísios, Ribeirão Preto - SP, 14085-430', 'Ribeirão Preto', 'SP', 'Ônibus linha 100, estacionamento', 'Teatros e Cinemas', 6, 'rp20.jpeg', 4, -21.172271, -47.8018583),
('Sesc Ribeirão Preto', 'Centro cultural com teatro e shows.', 'Terça a domingo das 9h às 21h', 'Teatro de bolso, festivais anuais', 15.00, 'R. Tibiriçá, 50 - Centro, Ribeirão Preto - SP, 14010-090', 'Ribeirão Preto', 'SP', 'Ônibus linha 200', 'Teatros e Cinemas', 6, 'rp21.jpg', 4, -21.1730041, -47.8097877),
('Auditório do Shopping Ribeirão', 'Espaço para shows comerciais e musicais.', 'Eventos variam; sáb/dom 18h-23h', 'Concertos pop, stand-up', 30.00, 'Av. Cel. Fernando Ferreira Leite, 1540 - Jardim California, Ribeirão Preto - SP, 14026-900', 'Ribeirão Preto', 'SP', 'Ônibus linha 100', 'Teatros e Cinemas', 6, 'rp22.jpeg', 4, -21.2123428, -47.8196216),


('Clube de Regatas', 'Clube com lago e praias internas para esportes.', 'Sábados e domingos das 9h às 17h', 'Natação, vôlei de praia, pedalinhos', 25.00, 'Via José Morães dos Santos, 2800 - Jardim Salgado Filho, Ribeirão Preto - SP, 14079-200', 'Ribeirão Preto', 'SP', 'Ônibus linha 150', 'Parques Temáticos', 7, 'rp9.jpg', 4, -21.104198, -47.761503),
('Praça da República', 'Praça central histórica com edifícios do século XIX.', 'Aberto 24h', 'Chafariz antigo, casarões cafeeiros, eventos culturais', 0.00, 'Praça da República, 386 - 7º Andar - Cj 71 - República, São Paulo - SP, 01045-000', 'Ribeirão Preto', 'SP', 'A pé do centro, ônibus linha 100', 'Parques Temáticos', 7, 'rp10.jpeg', 4, -22.3458091, -48.5353528),


('Feira Livre de Ribeirão Preto', 'Feira semanal com artesanato e comida de rua.', 'Sábados das 8h às 16h', 'Frutas locais, empadinhas, doces caseiros', 15.00, 'R. Dois de Julho, 621 - Vila Tiberio, Ribeirão Preto - SP, 14050-450', 'Ribeirão Preto', 'SP', 'Ônibus linha 100', 'Mercados e Feiras', 8, 'rp14.jpg', 4, -21.1698211, -47.9689057),
('Mercado Municipal de Ribeirão Preto', 'Mercado centenário com arquitetura art déco.', 'Segunda a sábado das 7h às 18h', 'Bancas tradicionais, fachada preservada', 0.00, 'R. São Sebastião, 30- 130 - Centro, Ribeirão Preto - SP, 14015-040', 'Ribeirão Preto', 'SP', 'Ônibus linha 150', 'Mercados e Feiras', 8, 'rp11.jpeg', 4, -21.1943951, -47.8386947);


INSERT INTO pontos_turisticos (ponto_turistico, descricao, horario_funcionamento, principais_atracoes, preco_medio, endereco, cidade, estado, formas_acesso, categoria, id_categoria, foto_principal, id_cidade, latitude, longitude) VALUES
('Orquidário Municipal de Santos', 'Jardim botânico com grande variedade de orquídeas.', 'Terça a domingo das 9h às 17h', 'Orquídeas raras, lago com peixes, borboletário', 8.00, 'Praça Washington, s/n - José Menino, Santos - SP, 11065-600', 'Santos', 'SP', 'Ônibus linha 10, 20', 'Parques', 1, 'st1.jpg', 5, -23.9654495, -46.351703),
('Parque Municipal Roberto Mário Santini', 'Parque com áreas verdes, playground e lago.', 'Diariamente das 6h às 20h', 'Lago para pedalinhos, pista de caminhada', 0.00, 'Av. Pres. Wilson, S/N - José Menino, Santos - SP, 11065-201', 'Santos', 'SP', 'Ônibus linha 30, 40', 'Parques', 1, 'st2.jpeg', 5, -23.9684561, -46.3529303),
('Praça das Bandeiras', 'Praça arborizada com áreas para descanso.', 'Aberto 24h', 'Jardins, bancos, eventos culturais', 0.00, 'Av. Vicente de Carvalho, S/N - Gonzaga, Santos - SP, 11045-501', 'Santos', 'SP', 'A pé do centro', 'Parques', 1, 'st3.webp', 5, -23.9698461, -46.3357407),
('Praça Mauá', 'Praça histórica com monumentos e jardins.', 'Aberto 24h', 'Monumento a Borba Gato, jardins', 0.00, 'Praça Mauá s/n - Centro, Santos - SP 11010-151', 'Santos', 'SP', 'A pé do centro', 'Parques', 1, 'st14.jpg', 5, -23.9335657, -46.3313922),


('Museu do Café', 'Museu dedicado à história do café no Brasil.', 'Terça a domingo das 10h às 18h', 'Exposições interativas, arquitetura histórica', 16.00, 'Rua XV de Novembro 95 - Centro, Santos - SP 11010-000', 'Santos', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'st4.jpg', 5, -23.9325166, -46.3326703),
('Pinacoteca Benedito Calixto', 'Galeria de arte com acervo de artistas locais.', 'Terça a domingo das 10h às 18h', 'Exposições temporárias, ateliês', 0.00, 'Av. Bartholomeu de Gusmão, 15 - Boqueirão, Santos - SP, 11045-400', 'Santos', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'st5.jpg', 5, -23.9732609, -46.3247821),
('Museu Pelé', 'Museu interativo sobre a vida do jogador Pelé.', 'Terça a domingo das 10h às 18h', 'Memorabilia, vídeos, troféus', 15.00, 'Largo Marquês de Monte Alegre, 1 - Valongo, Santos - SP, 11010-260', 'Santos', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'st6.jpeg', 5, -23.9312259, -46.3355897),
('Museu Marítimo de Santos', 'Museu sobre a história do porto e navegação.', 'Terça a domingo das 9h às 17h', 'Modelos de navios, exposições históricas', 5.00, 'Av. Gov. Fernando Costa, 343 - Ponta da Praia, Santos - SP, 11030-181', 'Santos', 'SP', 'A pé do porto', 'Museus e Exposições', 2, 'st7.jpg', 5, -23.9843369, -46.3001523),
('Museu de Pesca', 'Museu com acervo sobre a pesca e biologia marinha.', 'Terça a domingo das 9h às 17h', 'Aquários, exposições de espécies marinhas', 5.00, 'Av. Bartholomeu de Gusmão, 192 - Ponta da Praia, Santos - SP, 11030-906', 'Santos', 'SP', 'Ônibus linha 10', 'Museus e Exposições', 2, 'st8.jpg', 5, -23.9900831, -46.3089629),
('Museu de Arte Sacra de Santos', 'Museu com arte religiosa e objetos históricos.', 'Terça a domingo das 10h às 17h', 'Imagens sacras, mobiliário antigo', 0.00, 'Largo do Mosteiro, de - Morro de São Bento, Santos - SP, 11082-460', 'Santos', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'st10.jpg', 5, -23.9346421, -46.338621),
('Centro Histórico de Santos', 'Área com casarões coloniais e museus.', 'Aberto 24h', 'Arquitetura histórica, cafés, museus', 0.00, 'Rua XV de Novembro - Centro, Santos - SP 11010-151', 'Santos', 'SP', 'A pé do centro', 'Museus e Exposições', 2, 'st13.jpg', 5, -23.9340323, -46.3331906),


('Estação do Valongo', 'Estação ferroviária histórica restaurada.', 'Terça a domingo das 9h às 17h', 'Arquitetura antiga, exposições', 0.00, 'Porto Saboó, Santos - SP, 11010-2600', 'Santos', 'SP', 'A pé do centro', 'Centros Históricos e Igrejas', 3, 'st15.jpg', 5, -23.9311616, -46.3361099),
('Catedral de Santos', 'Igreja matriz com arquitetura neogótica.', 'Diariamente das 7h às 19h; missas variam', 'Vitrais, altares dourados', 0.00, 'Praça Patriarca José Bonifácio, S/N - Centro, Santos - SP, 11013-910', 'Santos', 'SP', 'A pé do centro', 'Centros Históricos e Igrejas', 3, 'st23.jpg', 5, -23.9368216, -46.3269833),
('Santuário de Nossa Senhora Aparecida', 'Santuário com romarias e missas.', 'Diariamente das 8h às 18h', 'Réplica da imagem, eventos religiosos', 0.00, 'Praça Nossa Sra. Aparecida, 614 - Aparecida, Santos - SP, 11020-002', 'Santos', 'SP', 'Ônibus linha 20', 'Centros Históricos e Igrejas', 3, 'st24.webp', 5, -23.9738519, -46.3049837),
('Igreja do Valongo', 'Igreja histórica do século XVIII.', 'Diariamente das 8h às 18h', 'Arquitetura colonial, altares dourados', 10.00, 'Largo Marquês de Monte Alegre, 13 - Valongo, Santos - SP, 11010-260', 'Santos', 'SP', 'A pé do centro', 'Centros Históricos e Igrejas', 3, 'st16.jpg', 5, -23.9315679, -46.3362264),

('Praia do Gonzaga', 'Praia urbana com calçadão e quiosques.', 'Diariamente 24h', 'Banho de mar, esportes aquáticos, bares', 0.00, 'Av. Presidente Wilson - Gonzaga, Santos - SP 11045-000', 'Santos', 'SP', 'Ônibus linha 20', 'Lazer', 4, 'st9.jpg', 5, -23.9664004, -46.3436722),
('Praia do Embaré', 'Praia tranquila com calçadão e quiosques.', 'Diariamente 24h', 'Banho de mar, caminhadas, bares', 0.00, 'Embaré, Santos - SP', 'Santos', 'SP', 'Ônibus linha 40', 'Lazer', 4, 'st11.jpg', 5, -23.9765262, -46.3395816),
('Praia do José Menino', 'Praia com área para esportes e lazer.', 'Diariamente 24h', 'Futebol de areia, vôlei, quiosques', 0.00, 'Santos - SP', 'Santos', 'SP', 'Ônibus linha 50', 'Lazer', 4, 'st12.jpg', 5, -23.9695633, -46.347632),
('Pista de Skate da Orla', 'Área para skate e patins com rampas.', 'Diariamente das 6h às 20h', 'Rampas, half-pipe, street course', 0.00, 'Av. Pres. Wilson, S/N - José Menino, Santos - SP, 11065-201', 'Santos', 'SP', 'Ônibus linha 20', 'Lazer', 4, 'st21.jpeg', 5, -23.9712825, -46.3864305),


('Bares e Restaurantes da Ponta da Praia', 'Área com bares e restaurantes à beira-mar.', 'Diariamente das 11h às 23h', 'Frutos do mar, culinária caiçara', 45.00, 'Av. Gen. San Martin, 152 - Ponta da Praia, Santos - SP, 11030-250', 'Santos', 'SP', 'Ônibus linha 70', 'Centros Comerciais', 5, 'st19.jpg', 5, -23.9874059, -46.3123706),

('Teatro Municipal de Santos', 'Teatro histórico com espetáculos clássicos e contemporâneos.', 'Apresentações variam; visitas sáb/dom 14h-17h', 'Palco de 800 lugares, acústica avançada', 25.00, 'Centro Cultural Patricia Galvão - Av. Senador Pinheiro Machado, 48 - Vila Matias, Santos - SP, 11075-907', 'Santos', 'SP', 'A pé do centro, ônibus linha 10', 'Teatros e Cinemas', 6, 'st25.jpg', 5, -23.9442396, -46.3352735),
('Casa de Cultura de Santos', 'Espaço para teatro experimental em bairro histórico.', 'Segunda a sexta das 14h às 22h', 'Peças locais, performances interativas', 0.00, 'Rua Sete de Setembro, 49 - Vila Nova, Santos - SP, 11013-350', 'Santos', 'SP', 'A pé do centro', 'Teatros e Cinemas', 6, 'st27.jpeg', 5, -23.9400642, -46.3258588),
('Sesc Santos', 'Centro cultural com teatro, shows e dança.', 'Terça a domingo das 9h às 21h', 'Teatro de arena, festivais anuais', 15.00, 'R. Conselheiro Ribas, 136 - Aparecida, Santos - SP, 11040-900', 'Santos', 'SP', 'Ônibus linha 30', 'Teatros e Cinemas', 6, 'st26.jpg', 5, -23.9757311, -46.3142998),


('Centro de Mergulho de Santos', 'Centro para mergulho recreativo e cursos.', 'Segunda a sábado das 9h às 18h', 'Cursos, aluguel de equipamentos', 100.00, 'R. Dom Duarte Leopoldo e Silva, 62 - Marapé, Santos - SP, 11070-130', 'Santos', 'SP', 'Ônibus linha 70', 'Parques Temáticos', 7, 'st20.jpg', 5, -23.9364052,-46.4635124),
('Clube de Vela de Santos', 'Clube para prática de vela e esportes náuticos.', 'Diariamente das 8h às 18h', 'Aulas, regatas, aluguel de barcos', 50.00, 'Av. Rei Pelé, 33/35 - Ponta da Praia, Santos - SP, 11030-401', 'Santos', 'SP', 'Carro via Av. Bartolomeu', 'Parques Temáticos', 7, 'st22.jpeg', 5, -23.767867, -46.7981249),


('Feira de Artesanato da Orla', 'Feira com artesanato local e comidas típicas.', 'Finais de semana das 9h às 18h', 'Artesanato, doces, comidas de praia', 20.00, 'Morro do Monte Serrat, Santos - SP, 11013-153', 'Santos', 'SP', 'Ônibus linha 20', 'Mercados e Feiras', 8, 'st18.jpg', 5, -23.9387609, -46.4724863),
('Mercado Municipal de Santos', 'Mercado tradicional com produtos frescos.', 'Segunda a sábado das 7h às 18h', 'Frutas, peixes, comidas típicas', 0.00, 'Praça Iguatemy Martins - Vila Nova, Santos - SP, 11013', 'Santos', 'SP', 'A pé do centro', 'Mercados e Feiras', 8, 'st17.jpg', 5, -23.9402601, -46.321693);

select*from usuarios;
select*from pontos_turisticos;
select*from categorias;
select*from avaliacoes;
select*from cidades;
