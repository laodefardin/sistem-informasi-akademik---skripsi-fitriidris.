<?php
$namafolder="gambar_suratmasuk/"; //tempat menyimpan file
/*
$con=mysql_connect("localhost","root","") or die("Gagal");
mysql_select_db("ecommerce")  or die("Gagal");
*/
include "../conn.php";
if (!empty($_FILES["nama_file"]["tmp_name"]))
{
	$jenis_gambar=$_FILES['nama_file']['type'];
        $keterangan = $_POST['keterangan'];
		$date= $_POST['date'];
	if($jenis_gambar=="image/jpeg" || $jenis_gambar=="image/jpg" || $jenis_gambar=="image/gif" || $jenis_gambar=="image/png")
	{			
		$gambar = $namafolder . basename($_FILES['nama_file']['name']);		
		if (move_uploaded_file($_FILES['nama_file']['tmp_name'], $gambar)) {
			$sql="INSERT INTO surat_masuk(keterangan,tanggal,gambar) VALUES
            ('$keterangan','$date','$gambar')";
			$res=mysql_query($sql) or die (mysql_error());
			
            echo "<script>alert('Gambar Berhasil Di Input'); 
		window.location = 'suratmasuk'</script>";	   
		} else {
		   echo "<script>alert('Gambar gagal dikirim'); 
		window.location = 'input-suratmasuk'</script>";
		}
   } else {
		echo "Jenis gambar yang anda kirim salah. Harus .jpg .gif .png";
   }
} else {
	echo "Anda belum memilih gambar";
}
?>