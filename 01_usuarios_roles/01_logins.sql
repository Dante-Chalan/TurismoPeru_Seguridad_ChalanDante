USE [master];
GO

-- Crear Logins a nivel de servidor con nombres ajustados
CREATE LOGIN [turismo_admin_v2] WITH PASSWORD = N'AdminPass2026!@#', CHECK_EXPIRATION = OFF, CHECK_POLICY = ON;
CREATE LOGIN [turismo_vendedor_v2] WITH PASSWORD = N'VendedorPass2026!@#', CHECK_EXPIRATION = OFF, CHECK_POLICY = ON;
CREATE LOGIN [turismo_analista_v2] WITH PASSWORD = N'AnalistaPass2026!@#', CHECK_EXPIRATION = OFF, CHECK_POLICY = ON;
GO