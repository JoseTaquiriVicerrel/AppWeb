<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <style>

            /* Curso CSS aprenderaprogramar.com */
            table {  color: #333; font-family: Helvetica, Arial, sans-serif; width: 640px; border-collapse: collapse;}
            td, th { border: 1px solid transparent; height: 30px; }
            th { background: #D3D3D3; font-weight: bold; }
            td { background: #FAFAFA; text-align: center; }
            tr:nth-child(even) td { background: #F1F1F1; }  
            tr:nth-child(odd) td { background: #FEFEFE; } 
            tr td:hover { background: #666; color: #FFF; }
        </style>
    </head>
    <body>
        <?php
        include_once 'conexion.php';


        $db = new Conect_MySql();
        $sql = "select * from persona";

        $query = $db->execute($sql);

        $db->close_db();
        
        $ruta = 'documento.php?idp=';
        ?>
        <table aling="center" border="1">
            <tr>
                <th>Nombre</th>
                <th>DNI</th>
                <th>Accion</th>
            </tr>
            <?php while ($row = $db->fetch_row($query)) { ?>
                <tr>
                    <td><?php echo $row['nombre'] ?></td>
                    <td><?php echo $row['dni'] ?></td>
                    <td style="text-align: center;">
                        <a href="javascript:void(0)" onclick="popup('<?php echo $ruta.$row['id']; ?>', 1200, 700)" title="imprimir"><img src="imprimir.png"></a>
                    </td>
                </tr>
                <?php
            }
            ?>
        </table>
        <script>
            function popup(url, ancho, alto) {
                var posicion_x;
                var posicion_y;
                posicion_x = (screen.width / 2) - (ancho / 2);
                posicion_y = (screen.height / 2) - (alto / 2);
                window.open(url, "documento", "width=" + ancho + ",height=" + alto + ",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left=" + posicion_x + ",top=" + posicion_y + "");
            }
        </script>
    </body>
</html>
