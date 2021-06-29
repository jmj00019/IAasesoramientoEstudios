-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2021 a las 13:16:24
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iaguiasuja`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

DROP TABLE IF EXISTS `grado`;
CREATE TABLE `grado` (
  `id` int(5) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`, `link`) VALUES
(1, 'Doble Máster en Análisis, conservación y restauración de habitats y MPFES', 'https://www.ujaen.es/estudios/oferta-academica/masteres/doble-master-en-analisis-conservacion-y-restauracion-de-componentes-fisicos-y-bioticos-de'),
(2, 'Doble Máster en Avances en seguridad de los alimentos y MFPES (Profesorado)', 'https://www.ujaen.es/estudios/oferta-academica/masteres/doble-master-universitario-en-avances-en-seguridad-de-los-alimentos-y-en-profesorado-en'),
(3, 'Doble Máster en Biotecnología y Biomedicina y MFPES (Profesorado)', 'https://www.ujaen.es/estudios/oferta-academica/masteres/doble-master-en-biotecnologia-y-biomedicina-y-master-en-profesorado-en-eso-bachillerato-fp'),
(4, 'Doble Máster en Lengua española y literatura y MFPES (Profesorado)', 'https://www.ujaen.es/estudios/oferta-academica/masteres/doble-master-en-lengua-espanola-y-literatura-investigacion-y-aplicaciones-profesionales-y'),
(5, 'Doble Máster en Olivar y aceite de oliva y MFPES (Profesorado)', 'https://www.ujaen.es/estudios/oferta-academica/masteres/doble-master-en-olivar-y-aceite-de-oliva-esp-elaiotecnia-y-master-en-profesorado-en-eso'),
(6, 'Doble Máster en Matemáticas y Profesorado ESO, Bachiller, FP y Ens. Idiomas', 'https://www.ujaen.es/estudios/oferta-academica/masteres/doble-master-universitario-en-matematicas-y-master-en-profesorado-en-eso-bachillerato-fp-o'),
(7, 'Máster en Administración de Empresas (MBA)', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-administracion-de-empresas-mba'),
(8, 'Máster en Dependencia e igualdad en la autonomía personal', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-dependencia-e-igualdad-en-la-autonomia-personal'),
(9, 'Máster en Estudios avanzados en patrimonio cultural: Historia, arte y terri', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-estudios-avanzados-en-patrimonio-cultural-historia-arte-y'),
(10, 'Máster Interuniversitario en Química aplicada', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-interuniversitario-en-quimica-aplicada-uja-uco-uhu-uma'),
(11, 'Máster en Prevención de riesgos laborales', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-prevencion-de-riesgos-laborales'),
(12, 'Máster en Profesorado de ESO, Bachillerato, Form. Profesional y En.Idiomas', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-profesorado-de-educacion-secundaria-obligatoria-y-bachillerato'),
(13, 'Máster Univ. en Análisis, conservación y restauración de componentes físico', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-analisis-conservacion-y-restauracion-de-componentes-fisicos-y'),
(14, 'Máster Univ. en Análisis crítico de las desigualdades de género e intervenc', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-analisis-critico-de-las-desigualdades-de-genero-e-intervencion'),
(15, 'Máster Univ. en Análisis histórico del mundo actual', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-interuniversitario-en-analisis-historico-del-mundo-actual-uja-ual-uca-unia-uhu-upo'),
(16, 'Máster Univ. en Avances en seguridad de los alimentos', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-avances-en-seguridad-de-los-alimentos'),
(17, 'Máster Univ. en Biotecnología y biomedicina', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-biotecnologia-y-biomedicina'),
(18, 'Máster Univ. en Derecho público y de la administración pública', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-derecho-publico-y-de-la-administracion-publica'),
(19, 'Máster Univ. en Dirección, gestión y emprendimiento de Centros y Servicios', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-direccion-gestion-y-emprendimiento-en-centros-y-servicios'),
(20, 'Máster Univ. en Economía y desarrollo territorial', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-interuniversitario-en-economia-y-desarrollo-territorial-uja-uca'),
(21, 'Máster Univ. en Energías renovables', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-energias-renovables'),
(22, 'Máster Univ. en Enseñanza bilingüe y aprendizaje integrado de contenidos y', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-interuniversitario-en-ensenanza-bilingue-y-aprendizaje-integrado-de-contenidos-y'),
(23, 'Máster Univ. en Gerontología: longevidad, salud y calidad', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-gerontologia-longevidad-salud-y-calidad'),
(24, 'Máster Univ. en Ingeniería geodésica y geofísica aplicada', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-geodesica-y-geofisica-aplicada'),
(25, 'Máster Univ. en Ingeniería geomática y geoinformación', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-geomatica-y-geoinformacion'),
(26, 'Máster Univ. en Intervención asistida con animales', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-interuniversitario-en-intervencion-asistida-con-animales-uja-unia'),
(27, 'Máster Univ. en Investigación en ciencias de la salud', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-investigacion-y-educacion-estetica-artes-musica-y-diseno-por-la'),
(28, 'Máster Univ. en Investigación y educación estética: artes, música y diseño', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-investigacion-y-educacion-estetica-artes-musica-y-diseno-por-la'),
(29, 'Máster Univ. en Investigación y docencia en cienc. actividad física y salud', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-investigacion-y-docencia-en-ciencias-de-la-actividad-fisica-y'),
(30, 'Máster Univ. en Justicia penal y sistema penitenciario', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-justicia-penal-y-sistema-penitenciario'),
(31, 'Máster Univ. en Lengua española y literatura: investigación y aplicaciones', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-lengua-espanola-y-literatura-investigacion-y-aplicaciones'),
(32, 'Máster Univ. en Olivar y aceite de oliva', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-olivar-y-aceite-de-oliva'),
(33, 'Máster Univ. en Online en English Studies (OMIES) / Estudios ingleses', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-online-en-english-studies-omies-estudios-ingleses'),
(34, 'Máster Univ. en Planificación y gestión sostenible del turismo', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-planificacion-y-gestion-sostenible-del-turismo'),
(35, 'Máster Univ. en Psicología general sanitaria', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-psicologia-general-sanitaria'),
(36, 'Máster Univ. en Psicología positiva', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-psicologia-positiva'),
(37, 'Doble Grado en Ingeniería eléctrica e Ingeniería electrónica industrial', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-electrica-y-grado-en-ingenieria-electronica-industrial-eps-jaen'),
(38, 'Doble Grado en Ingeniería eléctrica e Ingeniería mecánica', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-electrica-y-grado-en-ingenieria-mecanica-eps-jaen'),
(39, 'Doble Grado en Ingeniería mecánica e Ingeniería de organización industrial', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-mecanica-y-grado-en-ingenieria-en-organizacion-industrial-eps-jaen'),
(40, 'Doble Grado en Ingeniería mecánica e Ingeniería electrónica industrial', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-electronica-industrial-y-grado-en-ingenieria-mecanica-eps-jaen'),
(41, 'Doble Máster en Ingeniería informática y Seguridad informática', 'https://www.ujaen.es/estudios/oferta-academica/masteres/doble-master-universitario-en-ingenieria-informatica-y-seguridad-informatica'),
(42, 'Grado en Ingeniería de organización industrial', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-de-organizacion-industrial-eps-jaen'),
(43, 'Grado en Ingeniería eléctrica', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-electrica-eps-jaen'),
(44, 'Grado en Ingeniería electrónica industrial', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-electronica-industrial-eps-jaen'),
(45, 'Grado en Ingeniería geomática y topográfica', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-geomatica-y-topografica-eps-jaen'),
(46, 'Grado en Ingeniería informática', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-informatica-eps-jaen'),
(47, 'Grado en Ingeniería mecánica', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-mecanica-eps-jaen'),
(48, 'Máster en Ingeniería industrial', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-industrial'),
(49, 'Máster en Ingeniería informática', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-informatica'),
(50, 'Máster Univ. en Seguridad informática', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-seguridad-informatica'),
(51, 'Máster Univ. en Ingeniería mecatrónica', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-mecatronica'),
(52, 'Grado en Ingeniería mecánica EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-mecanica-eps-linares'),
(53, 'Doble Grado en Ingeniería de recursos energéticos e Ing. química industrial EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-de-recursos-energeticos-y-grado-en-ingenieria-quimica-industrial'),
(54, 'Doble Grado en Ingeniería eléctrica e Ingeniería mecánica EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-electrica-y-grado-en-ingenieria-mecanica-eps-linares'),
(55, 'Doble Grado en Ingeniería de tecnologías mineras e Ingeniería civil EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-civil-y-grado-en-ingenieria-de-tecnologias-mineras-eps-linares'),
(56, 'Doble Grado en Ingeniería eléctrica e Ingeniería química industrial EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-de-recursos-energeticos-y-grado-en-ingenieria-quimica-industrial'),
(57, 'Doble Grado Ing. de tecnologías de la telecomunicación e Ing. telemática EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-ingenieria-de-tecnologias-de-telecomunicacion-y-grado-en-ingenieria'),
(58, 'Grado en Ingeniería civil EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-civil-eps-linares'),
(59, 'Grado en Ingeniería de recursos energéticos EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-de-recursos-energeticos-eps-linares'),
(60, 'Grado en Ingeniería de tecnologías de telecomunicación EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-de-tecnologias-de-telecomunicacion-eps-linares'),
(61, 'Grado en Ingeniería de tecnologías mineras EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-de-tecnologias-mineras-eps-linares'),
(62, 'Grado en Ingeniería eléctrica EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-electrica-eps-linares'),
(63, 'Grado en Ingeniería química industrial EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-quimica-industrial-eps-linares'),
(64, 'Grado en Ingeniería telemática EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ingenieria-telematica-eps-linares'),
(65, 'Máster en Ingeniería de telecomunicación EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-de-telecomunicacion'),
(66, 'Máster Univ. en Industria conectada EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-industria-conectada'),
(67, 'Máster Univ. en Ingeniería de los materiales y construcción sostenible EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-de-los-materiales-y-construccion-sostenible'),
(68, 'Máster Univ. en Ingeniería del transporte terrestre y logística EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-ingenieria-del-transporte-terrestre-y-logistica'),
(69, 'Máster Univ. en Ingeniería de minas EPS Linares', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-interuniversitario-en-ingenieria-de-minas-uco-uhu-uja'),
(70, 'Doble Grado en Administración y dirección de empresas y Finanzas y contabil', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-administracion-y-direccion-de-empresas-y-grado-en-finanzas-y-contabilidad'),
(71, 'Doble Grado en Derecho y Administración y dirección de empresas', 'https://www.ujaen.es/estudios/oferta-academica/grados/doble-grado-en-administracion-y-direccion-de-empresas-y-grado-en-derecho'),
(72, 'Grado en Administración y dirección de empresas', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-administracion-y-direccion-de-empresas-ade'),
(73, 'Grado en Derecho', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-derecho'),
(74, 'Grado en Estadística y empresa', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-estadistica-y-empresa'),
(75, 'Grado en Finanzas y contabilidad', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-finanzas-y-contabilidad'),
(76, 'Grado en Gestión y administración pública', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-gestion-y-administracion-publica'),
(77, 'Grado en Relaciones laborales y recursos humanos', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-relaciones-laborales-y-recursos-humanos'),
(78, 'Grado en Turismo', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-turismo'),
(79, 'Máster en Abogacía', 'https://www.ujaen.es/estudios/oferta-academica/masteres/master-universitario-en-abogacia'),
(80, 'Grado en Enfermería', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-enfermeria'),
(81, 'Grado en Fisioterapia', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-fisioterapia'),
(82, 'Grado en Biología', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-biologia'),
(83, 'Grado en Ciencias ambientales', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-ciencias-ambientales'),
(84, 'Grado en Química', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-quimica'),
(85, 'Grado en Arqueología', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-interuniversitario-en-arqueologia'),
(86, 'Grado en Educación infantil', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-educacion-infantil'),
(87, 'Grado en Educación primaria', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-educacion-primaria'),
(88, 'Grado en Educación social', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-educacion-social'),
(89, 'Grado en Estudios ingleses', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-estudios-ingleses'),
(90, 'Grado en Filología hispánica', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-filologia-hispanica'),
(91, 'Grado en Geografía e historia', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-geografia-e-historia'),
(92, 'Grado en Historia del arte', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-historia-del-arte'),
(93, 'Grado en Psicología', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-psicologia'),
(94, 'Grado en Trabajo social', 'https://www.ujaen.es/estudios/oferta-academica/grados/grado-en-trabajo-social');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grado` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
