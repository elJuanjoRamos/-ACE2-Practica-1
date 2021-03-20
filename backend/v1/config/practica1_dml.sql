INSERT INTO TIPO_USUARIO(nombre) VALUES('Atleta');
INSERT INTO TIPO_USUARIO(nombre) VALUES('Coach');

CALL Crear_Usuario('Juan Jose', 'Ramos Campos', 'admin', 'admin', 21, 'M', 133, 165, 1);
CALL Crear_Usuario('Monica', 'Castro', 'mcastro', '123', 20, 'F', 120, 142, 1);

INSERT INTO TEMPERATURA(tipo, descripcion, rango_sup, rango_inf, edad_sup,edad_inf, edad)
VALUES ('Hipotermia', 'Caída importante y peligrosa de la temperatura corporal. La causa más común es la exposición prolongada al frío.', 36.5, 0, 100, 18, 'Adulto');
INSERT INTO TEMPERATURA(tipo, descripcion, rango_sup, rango_inf, edad_sup,edad_inf, edad)
VALUES ('Normal', 'Temperatura Estable', 37.5, 36.5, 100, 18, 'Adulto');
INSERT INTO TEMPERATURA(tipo, descripcion, rango_sup, rango_inf, edad_sup,edad_inf, edad)
VALUES ('Febricula', 'Estado de elevada temperatura que, sin llegar a ser fiebre, indica que algo sucede en nuestro cuerpo.', 38, 37.5, 100, 18, 'Adulto');
INSERT INTO TEMPERATURA(tipo, descripcion, rango_sup, rango_inf, edad_sup,edad_inf, edad)
VALUES ('Fiebre', 'Aumento temporal en la temperatura del cuerpo en respuesta a alguna enfermedad o padecimiento', 100, 38, 100, 18, 'Adulto');


SELECT * FROM TEMPERATURA
