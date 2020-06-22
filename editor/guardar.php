<?php

include_once 'conexion.php';
$bandera = $_REQUEST['bandera'];
$id = $_REQUEST['codigo'];
$contenido = htmlspecialchars($_REQUEST['editor1'], ENT_QUOTES);
$estado = $_REQUEST['estado'];


echo guardarDocumento($bandera, $id, $contenido, $estado);

function guardarDocumento($bandera, $id, $contenido, $estado) {
    $db = new Conect_MySql();
    $sql = "call insertarDocumeneto('$bandera','$id','$contenido','$estado')";
    $query = $db->execute($sql);
    $rpt = '';
    while ($row = $db->fetch_row($query)) {
        $rpt = $row['rpt'];
    }

    $db->close_db();

    return $rpt;
}
