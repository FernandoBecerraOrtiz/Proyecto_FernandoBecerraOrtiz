DROP DATABASE IF EXISTS proyectoFBOdb;

CREATE DATABASE IF NOT EXISTS proyectoFBOdb;

USE proyectoFBOdb;

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('estudiante', 'profesor', 'admin') NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	foto_perfil VARCHAR (255) NULL
);

-- Insertar usuarios con fechas aleatorias
INSERT INTO usuarios (nombre, email, password, tipo_usuario, fecha_registro, foto_perfil) VALUES
('Fernando Becerra Ortiz', 'fernando@gmail.com', '123', 'estudiante', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'person.svg'),
('Pedro Santos Royano', 'pedro@gmail.com', '456', 'profesor', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'person.svg'),
('Admin FooBar', 'adminfoobar@gmail.com', 'admin', 'admin', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'person.svg'),
('Carlos Azaustre', 'carlosazaustre@gmail.com', '123', 'profesor', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'images/team/carlosazaustre.png'),
('Carmen Ansio', 'carmenansio@gmail.com', '123', 'profesor', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'images/team/carmenansio.png'),
('Carlos Santana Vega', 'dotcsv@gmail.com', '123', 'profesor', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'images/team/dotcsv.png'),
('Miguel Ángel Durán', 'midudev@gmail.com', '123', 'profesor', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'images/team/midudev.png'),
('Miriam González', 'miriamgonp@gmail.com', '123', 'profesor', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'images/team/miriamgonp.png'),
('Brais Moure', 'mouredev@gmail.com', '123', 'profesor', DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY), 'images/team/mouredev.png');

-- Crear tabla de cursos
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    profesor_id INT,
    precio DECIMAL(10,2) DEFAULT 0.00,
    nivel ENUM('básico', 'intermedio', 'avanzado') NOT NULL,
    duracion INT NOT NULL,
    imagen_portada VARCHAR(255) DEFAULT NULL,
    CONSTRAINT fk_curso_profesor FOREIGN KEY (profesor_id) 
        REFERENCES usuarios(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Insertar cursos con fechas aleatorias
INSERT INTO cursos (titulo, descripcion, profesor_id, precio, nivel, duracion, fecha_creacion, imagen_portada) VALUES
('Curso de Astro', 'Descubre cómo crear sitios web ultrarrápidos con Astro. Aprende a combinar componentes de diferentes frameworks, optimizar el rendimiento y desplegar proyectos eficientes.', 2, 29.99, 'intermedio', 10, 'images/cursos/astro.webp'),
('Curso de Tailwind', 'Domina Tailwind CSS, el framework de estilos más eficiente y moderno. Aprende a crear interfaces atractivas sin escribir CSS personalizado.', 2, 24.99, 'básico', 8, 'images/cursos/tailwind.webp'),
('Curso de Bootstrap', 'Aprende a construir sitios web totalmente responsivos con Bootstrap, el framework CSS más popular. Conoce su sistema de grid, componentes interactivos y personalización avanzada para crear proyectos visualmente atractivos en poco tiempo.', 2, 19.99, 'básico', 6, 'images/cursos/bootstrap.webp'),
('Curso de jQuery', 'Facilita la manipulación del DOM y la interacción con JavaScript mediante jQuery. Aprende a utilizar selectores, animaciones, eventos y peticiones AJAX para mejorar la experiencia del usuario en tus proyectos. Un curso dirigido a desarrolladores con conocimientos previos de JavaScript que desean optimizar su código.', 2, 14.99, 'intermedio', 7, 'images/cursos/jquery.webp'),
('Curso de JavaScript', 'Aprende JavaScript desde lo más básico hasta técnicas avanzadas, con buenas prácticas y ejemplos prácticos. Ideal para desarrolladores frontend.', 1, 49.99, 'intermedio', 30, 'images/cursos/javascript.webp'),
('Curso de Python', 'Aprende cómo aplicar técnicas de Machine Learning usando Python. Desde la teoría básica hasta la implementación de modelos complejos.', 3, 69.99, 'avanzado', 40, 'images/cursos/python.webp'),
('Curso de PHP', 'Este curso abarca el desarrollo backend con PHP, cubriendo desde la instalación de servidores locales hasta la creación de aplicaciones web interactivas.', 5, 39.99, 'intermedio', 30, 'images/cursos/php.webp');

-- Crear tabla de categorías
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
	descripcion VARCHAR(255) NOT NULL
);

-- Insertar categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Desarrollo Web', 'Todo sobre desarrollo web'),
('Programación', 'Lenguajes de programación'),
('Frontend', 'Diseño y desarrollo del lado del cliente'),
('Backend', 'Lógica de servidor y bases de datos'),
('Bases de Datos', 'Gestión y administración de bases de datos'),
('DevOps', 'Prácticas de desarrollo y operaciones'),
('JavaScript', 'El lenguaje de la web'),
('CSS', 'Hojas de estilo en cascada'),
('PHP', 'Desarrollo backend con PHP');

-- Relación cursos-categorías (Muchos a muchos)
CREATE TABLE cursos_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    categoria_id INT,
    CONSTRAINT fk_curso_categoria_curso FOREIGN KEY (curso_id) 
        REFERENCES cursos(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_curso_categoria_categoria FOREIGN KEY (categoria_id) 
        REFERENCES categorias(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Relacionar cursos con categorías (pertenecen a más de una categoría) relacion N:M
INSERT INTO cursos_categorias (curso_id, categoria_id) VALUES
(1, 6),  -- Curso de Astro -> DevOps
(1, 4),  -- Curso de Astro -> Frontend
(2, 9),  -- Curso de Tailwind -> CSS
(2, 4),  -- Curso de Tailwind -> Frontend
(3, 9),  -- Curso de Bootstrap -> CSS
(3, 4),  -- Curso de Bootstrap -> Frontend
(4, 7),  -- Curso de jQuery -> JavaScript
(4, 4),  -- Curso de jQuery -> Frontend
(5, 7),  -- Curso de JavaScript -> JavaScript
(5, 4),  -- Curso de JavaScript -> Frontend
(6, 2),  -- Curso de Python -> Programación
(6, 5),  -- Curso de Python -> Bases de Datos
(7, 8),  -- Curso de PHP -> PHP
(7, 2);  -- Curso de PHP -> Programación

-- Crear tabla de lecciones
CREATE TABLE lecciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    video_url VARCHAR(255) DEFAULT NULL,
    orden INT NOT NULL,
    CONSTRAINT fk_leccion_curso FOREIGN KEY (curso_id) 
        REFERENCES cursos(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Insertar lecciones con fechas aleatorias
INSERT INTO lecciones (curso_id, titulo, contenido, video_url, orden) VALUES
-- Lecciones para Curso de Astro
(1, 'Introducción a Astro', 'Qué es Astro y por qué usarlo.', 'https://www.youtube.com/watch?v=F2pw1C9eKXw', 1),
(1, 'Instalación y configuración', 'Cómo instalar Astro en tu entorno.', 'https://www.youtube.com/watch?v=JFHmIp58YOU', 2),
(1, 'Componentes en Astro', 'Uso de componentes y slots.', 'https://www.youtube.com/watch?v=rK-rNRPyET0', 3),
(1, 'Integración con Markdown', 'Cómo usar Markdown en Astro.', 'https://www.youtube.com/watch?v=KNtax5dHPfI', 4),
(1, 'Despliegue', 'Cómo desplegar un sitio Astro.', 'https://www.youtube.com/watch?v=-d7L2n6y5PU', 5),

-- Lecciones para Curso de Tailwind
(2, 'Introducción a Tailwind', 'Cómo funciona Tailwind CSS.', 'https://www.youtube.com/watch?v=bxmDnn7lrnk', 1),
(2, 'Configuración del proyecto', 'Configurando Tailwind en un proyecto.', 'https://www.youtube.com/watch?v=3ZMUgga6SsY', 2),
(2, 'Utilidades de diseño', 'Uso de utilidades para diseño rápido.', 'https://www.youtube.com/watch?v=w0KZhi3DD-0', 3),
(2, 'Componentes reutilizables', 'Creando componentes con Tailwind.', 'https://www.youtube.com/watch?v=1g4W2U-l350', 4),
(2, 'Optimización y producción', 'Optimizar Tailwind para producción.', 'https://www.youtube.com/watch?v=6UVQlB1eo5A', 5),

-- Lecciones para Curso de Bootstrap
(3, 'Introducción a Bootstrap', 'Qué es Bootstrap y cómo usarlo.', 'https://www.youtube.com/watch?v=O_9u1P5YjVc', 1),
(3, 'Sistema de grillas', 'Cómo funciona el sistema de grillas.', 'https://www.youtube.com/watch?v=YQRmczOYIG0', 2),
(3, 'Componentes esenciales', 'Uso de botones, alertas, modales.', 'https://www.youtube.com/watch?v=iUCyU_U0J2E', 3),
(3, 'Personalización con Sass', 'Personalizando Bootstrap con Sass.', 'https://www.youtube.com/watch?v=ZZXGmoQ4PdI', 4),
(3, 'Despliegue de proyectos', 'Buenas prácticas para usar Bootstrap.', 'https://www.youtube.com/watch?v=nCeHeA7IsvU', 5),

-- Lecciones para Curso de jQuery
(4, 'Introducción a jQuery', 'Qué es jQuery y sus beneficios.', 'https://www.youtube.com/watch?v=jVe1GBCqFIE', 1),
(4, 'Selección de elementos', 'Cómo seleccionar elementos con jQuery.', 'https://www.youtube.com/watch?v=hcO4JsLsvqg', 2),
(4, 'Eventos en jQuery', 'Manejo de eventos con jQuery.', 'https://www.youtube.com/watch?v=MaEyWOI7Abs', 3),
(4, 'Manipulación del DOM', 'Añadir y eliminar elementos dinámicamente.', 'https://www.youtube.com/watch?v=Z0RcDRsPh1Q', 4),
(4, 'AJAX y jQuery', 'Hacer peticiones AJAX con jQuery.', 'https://www.youtube.com/watch?v=TvYxbPuIqWc', 5),

-- Lecciones para Curso de JavaScript
(5, 'Introducción a JavaScript', 'Aprende los fundamentos de JavaScript, variables, tipos de datos, y operaciones básicas.', 'https://www.youtube.com/watch?v=upDLs1sn7g4', 1),
(5, 'Funciones en JavaScript', 'Cómo crear y utilizar funciones en JavaScript.', 'https://www.youtube.com/watch?v=drz1jbNlo_o', 2),
(5, 'Objetos en JavaScript', 'Introducción a los objetos y cómo usarlos en JavaScript.', 'https://www.youtube.com/watch?v=moeQzF5VjQA', 3),
(5, 'Eventos en JavaScript', 'Manejo de eventos como clics, cambios de formulario, y más.', 'https://www.youtube.com/watch?v=BIK3gGBeJO0', 4),
(5, 'Promesas y asincronía', 'Cómo manejar código asíncrono usando promesas y async/await.', 'https://www.youtube.com/watch?v=PoRJizFvTSE', 5),

-- Lecciones para Curso de Python
(6, 'Introducción a Python', 'Sintaxis básica, variables, y tipos de datos en Python.', 'https://www.youtube.com/watch?v=YYXdXT2l-Gg', 1),
(6, 'Condiciones y bucles', 'Cómo usar estructuras de control como if, else, while y for en Python.', 'https://www.youtube.com/watch?v=k9TUPpGqYTo', 2),
(6, 'Funciones en Python', 'Cómo definir y usar funciones en Python.', 'https://www.youtube.com/watch?v=khKv-8q7YmY', 3),
(6, 'Manejo de archivos', 'Cómo leer y escribir archivos en Python.', 'https://www.youtube.com/watch?v=W8KRzm-HUcc', 4),
(6, 'Clases y objetos', 'Introducción a la programación orientada a objetos en Python.', 'https://www.youtube.com/watch?v=daefaLgNkw0', 5),

-- Lecciones para Curso de PHP
(7, 'Introducción a PHP', 'Qué es PHP y cómo funciona.', 'https://www.youtube.com/watch?v=pWG7ajC_OVo', 1),
(7, 'Variables y operadores', 'Cómo declarar variables y usar operadores.', 'https://www.youtube.com/watch?v=3B-CnezwEeo', 2),
(7, 'Estructuras de control', 'Condiciones y bucles en PHP.', 'https://www.youtube.com/watch?v=ABcXbZLm5G8', 3),
(7, 'Conexión con MySQL', 'Cómo conectar PHP con bases de datos MySQL.', 'https://www.youtube.com/watch?v=2CXme275t9k', 4),
(7, 'Desarrollo de una app CRUD', 'Crear una app CRUD con PHP.', 'https://www.youtube.com/watch?v=U2EliFC9NrQ', 5);

-- Seguimiento del progreso de los estudiantes usuario_leccion relacion N:M
CREATE TABLE progreso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    leccion_id INT,
    completado BOOLEAN DEFAULT 0,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_progreso_usuario FOREIGN KEY (usuario_id) 
        REFERENCES usuarios(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_progreso_leccion FOREIGN KEY (leccion_id) 
        REFERENCES lecciones(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Registro de progreso del estudiante en todos los cursos
INSERT INTO progreso (usuario_id, leccion_id, completado, fecha_actualizacion) VALUES
(1, 2, FLOOR(RAND() * 2), DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)), 
(1, 3, FLOOR(RAND() * 2), DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 5, FLOOR(RAND() * 2), DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 1, FLOOR(RAND() * 2), DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 4, FLOOR(RAND() * 2), DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 2, FLOOR(RAND() * 2), DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 3, FLOOR(RAND() * 2), DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY));

-- Inscripciones de estudiantes en cursos
CREATE TABLE inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    curso_id INT,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_inscripcion_usuario FOREIGN KEY (usuario_id) 
        REFERENCES usuarios(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_inscripcion_curso FOREIGN KEY (curso_id) 
        REFERENCES cursos(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Inscripción del estudiante en todos los cursos usuario_curso relacion N:M
INSERT INTO inscripciones (usuario_id, curso_id, fecha_inscripcion) VALUES
(1, 1, DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 2, DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 3, DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 4, DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 5, DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 6, DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY)),
(1, 7, DATE_ADD('2024-01-01', INTERVAL RAND() * (DATEDIFF('2025-12-31', '2024-01-01')) DAY));

-- Tabla para almacenar cambios en la base de datos a modo de logs, se activa mediante triggers al modificar otras tablas
CREATE TABLE auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    tabla_afectada VARCHAR(100),
    registro_id INT,
    detalles TEXT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- TRIGGERS TABLA AUDITORIA

-- Trigers tabla usuario:

-- Registro de un nuevo usuario
DELIMITER $$

CREATE TRIGGER auditoria_insert_usuario
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (usuario_id, accion, tabla_afectada, registro_id, detalles, fecha_hora)
    VALUES (NEW.id, 'INSERT', 'usuarios', NEW.id, CONCAT('Nuevo usuario registrado: ', NEW.nombre), NOW());
END $$

DELIMITER ;

-- Eliminación de un usuario
DELIMITER $$

CREATE TRIGGER auditoria_delete_usuario
AFTER DELETE ON usuarios
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (usuario_id, accion, tabla_afectada, registro_id, detalles, fecha_hora)
    VALUES (OLD.id, 'DELETE', 'usuarios', OLD.id, CONCAT('Usuario eliminado: ', OLD.nombre), NOW());
END $$

DELIMITER ;

-- Triggers para la Tabla cursos

-- Creación de un nuevo curso

DELIMITER $$

CREATE TRIGGER auditoria_insert_curso
AFTER INSERT ON cursos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (usuario_id, accion, tabla_afectada, registro_id, detalles, fecha_hora)
    VALUES (NEW.creado_por, 'INSERT', 'cursos', NEW.id, CONCAT('Nuevo curso creado: ', NEW.nombre), NOW());
END $$

DELIMITER ;

-- Eliminación de un curso
DELIMITER $$

CREATE TRIGGER auditoria_delete_curso
AFTER DELETE ON cursos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (usuario_id, accion, tabla_afectada, registro_id, detalles, fecha_hora)
    VALUES (OLD.creado_por, 'DELETE', 'cursos', OLD.id, CONCAT('Curso eliminado: ', OLD.nombre), NOW());
END $$

DELIMITER ;

-- Triggers para la Tabla lecciones
-- Creación de una nueva lección
DELIMITER $$

CREATE TRIGGER auditoria_insert_leccion
AFTER INSERT ON lecciones
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (usuario_id, accion, tabla_afectada, registro_id, detalles, fecha_hora)
    VALUES (NEW.creado_por, 'INSERT', 'lecciones', NEW.id, CONCAT('Nueva lección creada: ', NEW.nombre, ' en curso ', NEW.curso_id), NOW());
END $$

DELIMITER ;

-- Eliminación de una lección
DELIMITER $$

CREATE TRIGGER auditoria_delete_leccion
AFTER DELETE ON lecciones
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (usuario_id, accion, tabla_afectada, registro_id, detalles, fecha_hora)
    VALUES (OLD.creado_por, 'DELETE', 'lecciones', OLD.id, CONCAT('Lección eliminada: ', OLD.nombre, ' del curso ', OLD.curso_id), NOW());
END $$

DELIMITER ;
