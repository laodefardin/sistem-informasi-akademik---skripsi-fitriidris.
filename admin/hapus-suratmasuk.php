<?php
include "../conn.php";
$id = $_GET['id'];

$query = mysql_query("DELETE FROM surat_masuk WHERE id_suratmasuk='$id'");
if ($query){
	echo "<script>alert('Data Berhasil dihapus!'); window.location = 'suratmasuk'</script>";	
} else {
	echo "<script>alert('Data Gagal dihapus!'); window.location = 'suratmasuk'</script>";
}
?>