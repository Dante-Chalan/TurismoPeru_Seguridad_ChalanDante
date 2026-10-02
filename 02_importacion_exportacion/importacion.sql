USE TURISMOPERU_DYCM;
GO

-- 1. Crear tabla staging
IF OBJECT_ID('dbo.cliente_importacion', 'U') IS NOT NULL
    DROP TABLE dbo.cliente_importacion;
GO

CREATE TABLE dbo.cliente_importacion (
    Documento VARCHAR(20),
    Nombres VARCHAR(100),
    ApellidoPaterno VARCHAR(100),
    ApellidoMaterno VARCHAR(100)
);
GO

-- 2. Identificar registros duplicados
SELECT 
    Documento, 
    COUNT(*) AS Cantidad_Duplicados
FROM dbo.cliente_importacion
GROUP BY Documento
HAVING COUNT(*) > 1;
GO

-- 3. Insertar registros validos en persona
INSERT INTO dbo.persona (
    tipo_persona, 
    nombres, 
    apaterno, 
    amaterno, 
    numero_documento, 
    estado, 
    fecha_registro
)
SELECT DISTINCT 
    'N',
    LTRIM(RTRIM(Nombres)),
    LTRIM(RTRIM(ApellidoPaterno)),
    LTRIM(RTRIM(ApellidoMaterno)),
    LTRIM(RTRIM(Documento)),
    'Activo',
    GETDATE()
FROM dbo.cliente_importacion imp
WHERE imp.Documento IS NOT NULL 
  AND LTRIM(RTRIM(imp.Documento)) <> ''
  AND NOT EXISTS (
      SELECT 1 
      FROM dbo.persona p 
      WHERE p.numero_documento = imp.Documento
  );
GO

-- 4. Registrar clientes
INSERT INTO dbo.cliente (id_persona)
SELECT p.id_persona
FROM dbo.persona p
WHERE p.numero_documento IN (SELECT DISTINCT Documento FROM dbo.cliente_importacion)
  AND NOT EXISTS (
      SELECT 1 
      FROM dbo.cliente c 
      WHERE c.id_persona = p.id_persona
  );
GO