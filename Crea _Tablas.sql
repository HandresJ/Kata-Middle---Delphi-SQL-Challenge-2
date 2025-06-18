
-- Tabla principal de caficultores
CREATE TABLE [FNC_VOTACION].[dbo].[CAFICULTORES] (
id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombre VARCHAR(100),
identificacion VARCHAR(20),
ciudad VARCHAR(50),
tipo_producto VARCHAR(50) -- Ahorros, Corriente, Débito
);
-- Tabla de abonos a monedero
CREATE TABLE [FNC_VOTACION].[dbo].[ABONOS_MONEDERO] (
id INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
id_caficultor INT,
valor DECIMAL(18, 2),
fecha DATE,
FOREIGN KEY (id_caficultor) REFERENCES CAFICULTORES(id)
);
-- Vista para consultar saldo por caficultor
CREATE VIEW SALDO_MONEDERO AS
SELECT id_caficultor, SUM(valor) AS saldo
FROM ABONOS_MONEDERO
GROUP BY id_caficultor;


