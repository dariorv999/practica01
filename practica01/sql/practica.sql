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
('Echeveria', 'Echeveria elegans', 'Crassulaceae', 'Verde azulado', 10, 3500, 'Bajo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvPwn_sR72mbiUdcClHLzYj-Z0C9Fr3CFII9qb_B-axHFEDKlga_58n30&s=10', true),
('Sábila', 'Aloe vera', 'Asphodelaceae', 'Verde', 60, 4500, 'Medio', 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/31/Aloe_vera_JRVdH_10.jpg/960px-Aloe_vera_JRVdH_10.jpg?utm_source=es.wikipedia.org&utm_campaign=index&utm_content=thumbnail', true),
('Haworthia cebra', 'Haworthiopsis fasciata', 'Asphodelaceae', 'Verde oscuro con franjas blancas', 12, 2800, 'Bajo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW0a8i9k_iP6HpZBexqcAYDjTSTHmaYDh87I2ZlBaWATJFBRGO_oaXY6Q&s=10', true),
('Cola de burro', 'Sedum morganianum', 'Crassulaceae', 'Verde grisáceo', 40, 5200, 'Medio', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbUnH5mi9GJ3d3vfdgqqAox-t09_c0eIXItPzn7oim5j2otlJSranMFQyp&s=10', true),
('Árbol de jade', 'Crassula ovata', 'Crassulaceae', 'Verde brillante', 100, 4000, 'Bajo', 'https://content.elmueble.com/medio/2021/12/01/planta-de-jade_89d72781_1000x1000.jpeg', true),
('Planta fantasma', 'Graptopetalum paraguayense', 'Crassulaceae', 'Gris plateado', 20, 3200, 'Bajo', 'https://media.admagazine.com/photos/618a5d75b94700461d620f14/3:2/w_3456,h_2304,c_limit/94535.jpg', true),
('Piedra viviente', 'Lithops lesliei', 'Aizoaceae', 'Marrón y gris', 3, 3800, 'Bajo', 'https://viverosgonzalez.es/17000-large_default/lithops-.jpg', true),
('Kalanchoe', 'Kalanchoe blossfeldiana', 'Crassulaceae', 'Rojo', 30, 3000, 'Medio', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDhcJor9DVBDRLsLeI9F5P3qKdr5d2arLUG_Ox6BhAIe2mIeAsTHwMwopM&s=10', true),
('Siempreviva', 'Sempervivum tectorum', 'Crassulaceae', 'Verde con puntas rojas', 8, 2500, 'Bajo', 'https://www.picturethisai.com/wiki-image/1080/154193943058186253.jpeg', true),
('Asiento de suegra', 'Echinocactus grusonii', 'Cactaceae', 'Verde con espinas doradas', 60, 9500, 'Bajo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROTfXHrpflu3epOqEPOwyYeXZ4VoqCM7Jcl3HvvGSNMK079HkvT2rvYX8&s=10', true),
('Perla de collar', 'Senecio rowleyanus', 'Asteraceae', 'Verde', 30, 4800, 'Medio', 'https://www.verdeesvida.es/files/plant/24122022104124_Senecio%20rowleyanus%20Maja%20Dumat%20CC.jpg', true);