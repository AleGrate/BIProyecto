--select * from seguro_g26473471.producto where cod_tipo_producto=1;
--select * from seguro_g26473471.tipo_producto;

UPDATE seguro_g26473471.producto SET cod_tipo_producto=3 WHERE cod_producto=2;
UPDATE seguro_g26473471.producto SET cod_tipo_producto=3 WHERE cod_producto=3; 
UPDATE seguro_g26473471.producto SET cod_tipo_producto=3 WHERE cod_producto=5; 
UPDATE seguro_g26473471.producto SET cod_tipo_producto=3 WHERE cod_producto=22; 
UPDATE seguro_g26473471.producto SET cod_tipo_producto=3 WHERE cod_producto=19; 
UPDATE seguro_g26473471.producto SET cod_tipo_producto=3 WHERE cod_producto=29; 
UPDATE seguro_g26473471.producto SET cod_tipo_producto=3 WHERE cod_producto=6; 

UPDATE seguro_g26473471.registro_contrato SET estado_contrato='Activo' WHERE estado_contrato='Suspendido'; 