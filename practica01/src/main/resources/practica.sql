drop database if exists practica;
drop user if exists usuario_practica;

CREATE database practica
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

create user 'usuario_practica'@'%' identified by 'la_Clave';

grant select, insert, update, delete on practica.* to 'usuario_practica'@'%';
flush privileges;

use practica;

create table suculenta (
  id_suculenta INT NOT NULL AUTO_INCREMENT,
  nombre_comun VARCHAR(80) NOT NULL,
  nombre_cientifico VARCHAR(120) NOT NULL,
  familia VARCHAR(60),
  color_principal VARCHAR(40),
  altura_cm DOUBLE NOT NULL CHECK (altura_cm > 0),
  precio_estimado DECIMAL(10,2) NOT NULL CHECK (precio_estimado >= 0),
  nivel_riego VARCHAR(20) NOT NULL,
  ruta_imagen VARCHAR(1024),
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id_suculenta),
  UNIQUE (nombre_cientifico))
  ENGINE = InnoDB;

INSERT INTO suculenta (nombre_comun, nombre_cientifico, familia, color_principal, altura_cm, precio_estimado, nivel_riego, ruta_imagen, activo) VALUES
('Echeveria', 'Echeveria elegans', 'Crassulaceae', 'Verde azulado', 10, 3500, 'Bajo', 'https://placehold.co/300x200/5f9ea0/ffffff?text=Echeveria+elegans', true),
('Sábila', 'Aloe vera', 'Asphodelaceae', 'Verde', 60, 4500, 'Medio', 'https://placehold.co/300x200/2e8b57/ffffff?text=Aloe+vera', true),
('Haworthia cebra', 'Haworthiopsis fasciata', 'Asphodelaceae', 'Verde oscuro con franjas blancas', 12, 2800, 'Bajo', 'https://placehold.co/300x200/355e3b/ffffff?text=Haworthiopsis+fasciata', true),
('Cola de burro', 'Sedum morganianum', 'Crassulaceae', 'Verde grisáceo', 40, 5200, 'Medio', 'https://placehold.co/300x200/8fbc8f/ffffff?text=Sedum+morganianum', true),
('Árbol de jade', 'Crassula ovata', 'Crassulaceae', 'Verde brillante', 100, 4000, 'Bajo', 'https://placehold.co/300x200/228b22/ffffff?text=Crassula+ovata', true),
('Planta fantasma', 'Graptopetalum paraguayense', 'Crassulaceae', 'Gris plateado', 20, 3200, 'Bajo', 'https://placehold.co/300x200/a9a9a9/ffffff?text=Graptopetalum', true),
('Piedra viviente', 'Lithops lesliei', 'Aizoaceae', 'Marrón y gris', 3, 3800, 'Bajo', 'https://placehold.co/300x200/8b7765/ffffff?text=Lithops+lesliei', true),
('Kalanchoe', 'Kalanchoe blossfeldiana', 'Crassulaceae', 'Rojo', 30, 3000, 'Medio', 'https://placehold.co/300x200/c0392b/ffffff?text=Kalanchoe', true),
('Siempreviva', 'Sempervivum tectorum', 'Crassulaceae', 'Verde con puntas rojas', 8, 2500, 'Bajo', 'https://placehold.co/300x200/6b8e23/ffffff?text=Sempervivum', true),
('Asiento de suegra', 'Echinocactus grusonii', 'Cactaceae', 'Verde con espinas doradas', 60, 9500, 'Bajo', 'https://placehold.co/300x200/b8860b/ffffff?text=Echinocactus', true),
('Perla de collar', 'Senecio rowleyanus', 'Asteraceae', 'Verde', 30, 4800, 'Medio', 'https://placehold.co/300x200/9acd32/ffffff?text=Senecio+rowleyanus', false);