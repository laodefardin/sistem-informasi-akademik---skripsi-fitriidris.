<?php
include "../conn.php";
$id = $_GET['id'];

$query = mysql_query("DELETE FROM surat_keluar WHERE id_suratkeluar='$id'");
if ($query){
	echo "<script>alert('Data Berhasil dihapus!'); window.location = 'suratkeluar'</script>";	
} else {
	echo "<script>alert('Data Gagal dihapus!'); window.location = 'suratkeluar'</script>";
}
?>