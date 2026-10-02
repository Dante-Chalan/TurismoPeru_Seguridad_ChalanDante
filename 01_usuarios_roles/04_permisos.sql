USE [TURISMOPERU_DYCM];
GO

-- Permisos para rol_vendedor (SELECT e INSERT, denegado DELETE)
GRANT SELECT, INSERT ON dbo.cliente TO rol_vendedor;
GRANT SELECT, INSERT ON dbo.reserva TO rol_vendedor;
GRANT SELECT ON dbo.alojamiento TO rol_vendedor;
GRANT SELECT ON dbo.habitacion TO rol_vendedor;
DENY DELETE ON dbo.cliente TO rol_vendedor;
DENY DELETE ON dbo.reserva TO rol_vendedor;

-- Permisos para rol_analista (Únicamente lectura SELECT)
GRANT SELECT ON dbo.cliente TO rol_analista;
GRANT SELECT ON dbo.reserva TO rol_analista;
GRANT SELECT ON dbo.pago TO rol_analista;
GRANT SELECT ON dbo.alojamiento TO rol_analista;
GRANT SELECT ON dbo.habitacion TO rol_analista;
GRANT SELECT ON dbo.paquete TO rol_analista;
GRANT SELECT ON dbo.lugar_turistico TO rol_analista;

DENY INSERT, UPDATE, DELETE ON dbo.cliente TO rol_analista;
DENY INSERT, UPDATE, DELETE ON dbo.reserva TO rol_analista;
DENY INSERT, UPDATE, DELETE ON dbo.pago TO rol_analista;
DENY INSERT, UPDATE, DELETE ON dbo.alojamiento TO rol_analista;
DENY INSERT, UPDATE, DELETE ON dbo.habitacion TO rol_analista;
DENY INSERT, UPDATE, DELETE ON dbo.paquete TO rol_analista;
DENY INSERT, UPDATE, DELETE ON dbo.lugar_turistico TO rol_analista;

-- Asignar los nuevos usuarios a sus respectivos roles
ALTER ROLE [db_owner] ADD MEMBER [turismo_admin_v2];
ALTER ROLE [rol_vendedor] ADD MEMBER [turismo_vendedor_v2];
ALTER ROLE [rol_analista] ADD MEMBER [turismo_analista_v2];
GO