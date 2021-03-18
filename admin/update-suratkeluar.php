<?php
include "../conn.php";

$id = $_POST['id'];
$keterangan = $_POST['keterangan'];
$date= $_POST['date'];

$query = mysql_query("UPDATE surat_keluar SET keterangan='$keterangan', tanggal='$date' WHERE id_suratkeluar='$id'")or die(mysql_error());
if ($query){
header('location:suratkeluar.php');	
} else {
	echo "gagal";
    }
?>