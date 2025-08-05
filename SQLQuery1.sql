Use master
GO
if exists (select * from Sys.sysdatabases where name = 'DBWebEscuela24')
drop database DBWebEscuela24
GO
create database DBWebEscuela24
GO

use DBWebEscuela24

--CREACION TABLA USUARIO
create table Usuarios (
ID int identity(1,1) primary key,
Nombre varchar(30) not null,
Dni int unique not null,
Mail varchar(40) unique not null,

)
GO

CREATE PROCEDURE Usuarios_Insert
    @Nombre VARCHAR(30),
    @Dni INT,
    @Mail VARCHAR(40)
AS
BEGIN
    INSERT Usuarios
    VALUES (@Nombre, @Dni,@Mail)
	Select @@IDENTITY
END;
GO

CREATE PROCEDURE Usuarios_Update

    @ID INT,
    @Nombre VARCHAR(30),
    @Dni INT,
    @Mail VARCHAR(40)

AS
BEGIN
Update Usuarios
		SET Nombre = @Nombre,
        Dni = @Dni,
		Mail = @Mail
		WHERE ID = @ID;
		END;

GO

CREATE PROCEDURE Usuarios_Delete
    @ID int
AS
BEGIN
    DELETE FROM Usuarios
    WHERE ID = @ID;
END;
GO


CREATE PROCEDURE Usuarios_Find
    @ID int
AS
BEGIN
    SELECT * FROM Usuarios
    WHERE ID = @ID;
END;
GO

--PROCEDURES DE USUARIOS ESPECIALES DE EXISTENCIA
CREATE PROCEDURE Usuarios_MailExists
    @ID int,
    @Mail varchar(40)
AS
BEGIN
    SELECT COUNT(*) FROM Usuarios
    WHERE ID <> @ID AND Mail = @Mail;
END;
GO

CREATE PROCEDURE Usuarios_DniExists
    @ID int,
    @Dni int
AS
BEGIN
    SELECT COUNT(*) FROM Usuarios
    WHERE ID <> @ID AND Dni = @Dni;
END;
GO

--****************PROCEDURES ESPECIALES DE BUSQUEDA*****************

CREATE PROCEDURE Usuarios_FindByMail
    @Mail varchar(40)
AS
BEGIN
    SELECT * FROM Usuarios
    WHERE Mail = @Mail;
END;
GO

CREATE PROCEDURE Usuarios_FindByDni
    @Dni int
AS
BEGIN
    SELECT * FROM Usuarios
    WHERE Dni = @Dni;
END;
GO
--**************PROCEDURES DE LISTADO
CREATE PROCEDURE Usuarios_List
AS
BEGIN
    SELECT * FROM Usuarios;
END;
GO

---------------------------------------------------------------------

--CREACION TABLA Carrera
create table Carreras (
ID int identity(1,1) primary key,
Nombre varchar(30) not null,
Duracion int not null,
Sigla varchar(20) unique not null,
Titulo varchar(40) unique not null,

)
GO

CREATE PROCEDURE Carreras_Insert
    @Nombre VARCHAR(30),
    @Duracion INT,
    @Sigla VARCHAR(20),
	@Titulo VARCHAR(40)
AS
BEGIN
    INSERT Carreras
    VALUES (@Nombre, @Duracion,@Sigla, @Titulo)
	Select @@IDENTITY
END;
GO

CREATE PROCEDURE Carreras_Update

    @ID INT,
    @Nombre VARCHAR(30),
    @Duracion INT,
    @Sigla VARCHAR(20),
	@Titulo VARCHAR(40)

AS
BEGIN
Update Carreras
		SET Nombre = @Nombre,
        Duracion = @Duracion,
		Sigla = @Sigla,
		Titulo = @Titulo
		WHERE ID = @ID;
		END;

GO

CREATE PROCEDURE Carreras_Delete
    @ID int
AS
BEGIN
    DELETE FROM Carreras
    WHERE ID = @ID;
END;
GO


CREATE PROCEDURE Carreras_Find
    @ID int
AS
BEGIN
    SELECT * FROM Carreras
    WHERE ID = @ID;
END;
GO

--PROCEDURES DE USUARIOS ESPECIALES DE EXISTENCIA
CREATE PROCEDURE Carreras_NombreExist
    @ID int,
    @Nombre varchar(30)
AS
BEGIN
    SELECT COUNT(*) FROM Carreras
    WHERE ID <> @ID AND Nombre = @Nombre;
END;
GO

CREATE PROCEDURE Carreras_SiglaExist
    @ID int,
    @Sigla varchar(20)
AS
BEGIN
    SELECT COUNT(*) FROM Carreras
    WHERE ID <> @ID AND Sigla = @Sigla;
END;
GO

CREATE PROCEDURE Carreras_List
AS
BEGIN
    SELECT * FROM Carreras;
END;
GO