@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds ejercicio 1'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zcds_LBC as select from zbd_empleado_lbc
{
    key nombre as NombreID,
    key edad as EdadID,
    
    case  nombre
    when 'Paco' then 'alumno Paco'
    when 'Lola' then 'alumna Lola'
    else 'el alumno no existe'
    end as Case1
}
