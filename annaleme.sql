CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE quartos (
id_quarto SERIAL PRIMARY KEY,
numero_quarto DECIMAL (5,2) UNIQUE NOT NULL,
tipo_quarto VARCHAR (100)
);


CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY,
data_inicio_reserva DATE NOT NULL,
horario_reserva TIME NOT NULL,
data_termino_reserva DATE NOT NULL,
id_hospede INT NOT NULL,
id_quarto INT NOT NULL,
reserva_ativa BOOLEAN NOT NULL,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes(nome, email) VALUES 
('James Beaufort', 'james.beaufort@gmail.com'),
('Ruby Bell', 'ruby.bell@gmail.com'),
('Lydia Beaufort', 'lydia.beaufort@gmail.com'),
('Lin Wang', 'lin.wang@gmail.com');

INSERT INTO quartos(numero_quarto, tipo_quarto) VALUES
(50, 'Duplo Solteiro'),
(4, 'Standard'),
(15, 'Deluxo'),
(35, 'Quarto Casal');
