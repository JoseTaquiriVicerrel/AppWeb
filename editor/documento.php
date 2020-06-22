<?php

require_once ($_SERVER['DOCUMENT_ROOT'] . '/editor/dompdf/autoload.inc.php');

use Dompdf\Dompdf;

$idp = $_REQUEST['idp'];
include_once 'conexion.php';


$db = new Conect_MySql();
$sql = "select * from persona where id=" . $idp;

$query = $db->execute($sql);

while ($row = $db->fetch_row($query)) {
    $nombre = $row['nombre'];
    $dni = $row['dni'];
    $persona = $row['id'];
}

$sql2 = "select * from documento where id = 5";

$query2 = $db->execute($sql2);
while ($row2 = $db->fetch_row($query2)) {
    $contenido = $row2['contenido'];
}

$db->close_db();

$html = html_entity_decode($contenido, ENT_QUOTES);

$foto = '<img src="imagenes/'.$persona.'.jpg" style="width:90px;">';

$html = str_replace('(NOMPERSONA)', $nombre, $html);
$html = str_replace('(DNIPERSONA)', $dni, $html);
$html = str_replace('(FOTPERSONA)', $foto, $html);


$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', ''); // (Opcional) Configurar papel y orientación(horizontal=landscape)
$dompdf->render(); // Generar el PDF desde contenido HTML
$pdf = $dompdf->output(); // Obtener el PDF generado
$dompdf->stream("rptDocumentoEntregados.pdf", array("Attachment" => false));
