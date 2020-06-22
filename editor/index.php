<!DOCTYPE html>
<?php
include_once 'conexion.php';

$id = isset($_REQUEST['id']) ? $_REQUEST['id'] : 5;

$db = new Conect_MySql();
$sql = "select * from documento where id =" . $id;

$query = $db->execute($sql);
while ($row = $db->fetch_row($query)) {
    $contenido = $row['contenido'];
    $codigo = $row['id'];
}
$db->close_db();
?>
<html>
    <head>
        <meta charset="utf-8">
        <title>A Simple Page with CKEditor</title>
        <!-- Make sure the path to CKEditor is correct. -->
        <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
        <script src="ckeditor/config.js" type="text/javascript"></script>
    </head>
    <body>
        <form action="guardar.php" method="POST">
            <input type="hidden" name="codigo" value="<?php echo $codigo ?>">
            <input type="hidden" name="bandera" value="2">

            <select id="etiqueta" name="etiqueta" onchange="InsertHTML()">
                <option value="">Seleccionar</option>
                <option value="(NOMPERSONA)">Nombre Persona</option>
                <option value="(DNIPERSONA)">DNI persona</option>
                <option value="(FOTPERSONA)">Foto Persona</option>
            </select>
            <br>
            <br>
            <textarea name="editor1" id="editor1" rows="10" cols="80">
                <?php echo $contenido ?>
            </textarea>
            <input type="checkbox" name="estado" id="estado" value="1" checked="true">
            <script type="text/javascript" >
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace('editor1');
            </script>

            <script>
                function InsertHTML() {
                    // Get the editor instance that we want to interact with.
                    var editor = CKEDITOR.instances.editor1;
                    var value = document.getElementById('etiqueta').value;

                    // Check the active editing mode.
                    if (editor.mode == 'wysiwyg')
                    {
                        editor.insertHtml(value);
                    } else
                        alert('You must be in WYSIWYG mode!');
                }
            </script>
        </form>
    </body>
</html>