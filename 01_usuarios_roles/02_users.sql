USE [TURISMOPERU_DYCM];
GO

-- Crear Usuarios asociados a los nuevos Logins dentro de la base de datos
CREATE USER [turismo_admin_v2] FOR LOGIN [turismo_admin_v2];
CREATE USER [turismo_vendedor_v2] FOR LOGIN [turismo_vendedor_v2];
CREATE USER [turismo_analista_v2] FOR LOGIN [turismo_analista_v2];
GO