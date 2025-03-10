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


INSERT INTO reservas (data_inicio_reserva,horario_reserva, data_termino_reserva, id_hospede, id_quarto, reserva_ativa) VALUES
('2024-06-02', '20:00', '2024-06-04', 1, 1,'false'),
('2024-06-03', '21:00', '2024-06-05', 2, 2,'true'),
('2024-06-04', '19:00', '2024-06-06', 3, 3,'false'),
('2024-06-05', '19:00', '2024-06-07', 4, 4,'true');

SELECT 
  r.id_reserva,
  h.nome AS hospede,
  h.email,
  q.numero_quarto AS quarto,
  q.tipo_quarto,
  r.data_inicio_reserva,
  r.horario_reserva,
  r. data_termino_reserva

FROM
  reservas r
JOIN
  quartos q ON r.id_quarto = q.id_quarto
JOIN
  hospedes h ON r.id_hospede = h.id_hospede
WHERE
  r.data_termino_reserva <= '2024-06-05';


SELECT 
  r.id_reserva,
  h.nome AS hospede,
  h.email,
  q.numero_quarto AS quarto,
  q.tipo_quarto

FROM
  quartos q
LEFT JOIN
  reservas r ON  q.id_quarto = r.id_quarto
LEFT JOIN 
    hospedes h ON r.id_hospede = h.id_hospede;


SELECT
  r.id_reserva, 
  q.numero_quarto AS quarto_sem_reserva, 
  r.reserva_ativa

FROM 
  reservas r 
JOIN 
  quartos q ON r.id_quarto = q.id_quarto 
WHERE
  r.reserva_ativa = false; 
