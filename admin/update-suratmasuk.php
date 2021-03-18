<?php
include "../conn.php";

$id = $_POST['id'];
$keterangan = $_POST['keterangan'];
$date= $_POST['date'];

$query = mysql_query("UPDATE surat_masuk SET keterangan='$keterangan', tanggal='$date' WHERE id_suratmasuk='$id'")or die(mysql_error());
if ($query){
header('location:suratmasuk.php');	
} else {
	echo "gagal";
    }
?>