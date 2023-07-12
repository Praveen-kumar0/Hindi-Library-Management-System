<?php include 'protect.php'?>
<?php
	#fetch data from database
	// $connection = mysqli_connect("localhost","root","");
	// mysqli_query($connection,'SET NAMES UTF8');
	// $db = mysqli_select_db($connection,"lms");
    include "../asset/dbconnect.php";
	$book_name = "";
	$author = "";
	$category = "";
	$book_no = "";
	$price = "";
?>

<html>
<style>
	.Available {
		color: #009104;
	}
	.Issued {
		color: #ad0000;
	}
</style>

<body> 
<?php
// Get the accession no.
$text = $_GET['text'];
$connection = mysqli_connect("localhost","root","");
mysqli_query($connection,'SET NAMES UTF8');
$db = mysqli_select_db($connection,"lms");

echo '<div class="row d-flex justify-content-center mb-5">
<div class="col-md-10">
    <table class="table table-hover">
        <thead class="sticky-top" style="background-color: #d9e2ff">
            <tr>
                <th style="width:12%">Accession No</th>
                <th>Book Title</th>
                <th style="width:12.5%">Author</th>
                <th>Publisher</th>
                <th style="width:11%">Category</th>
                <th style="width:12%">Purchase Year</th>
                <th style="width:10%">Book Price</th>
                <th colspan="2" style="width:13%">Actions	</th>
            </tr>
        </thead>';

if ($text == "") {
    $query = "select * from books order by substr(ac_no from 1 for 2), cast(substr(ac_no from 1) AS UNSIGNED)";
    $query_run = mysqli_query($connection,$query);
    while ($row = mysqli_fetch_assoc($query_run)){
        echo '<tbody class="bg-light">';
        echo "<tr>";
        echo "<td>" . $row['ac_no'] . "</td>";
        echo "<td>" . $row['book_name'] . "</td>";
        echo "<td>" . $row['author'] . "</td>";
        echo "<td>" . $row['publisher'] . "</td>";
        echo "<td>" . $row['category'] . "</td>";
        echo "<td>" . $row['purchase_year'] . "</td>";
        echo "<td>" . $row['book_price'] . "</td>";
        $an = $row['ac_no'];
		echo "<td><a href='edit_book.php?an=$an'>Edit</a></td>";
		echo "<td><a href='delete_book.php?an=$an'>Delete</a></td>";
        echo "<tr>";
        echo "</tbody>";
    }
}

elseif ($text !== "") {
	$query = "select * from books where ac_no like '%$text%' or book_name like '%$text%' or author like '%$text%' or publisher like '%$text%' or category like '%$text%' or purchase_year like '%$text%' or book_price like '%$text%' or issue_status like '%$text%' order by substr(ac_no from 1 for 2), cast(substr(ac_no from 1) AS UNSIGNED)";
    $query_run = mysqli_query($connection,$query);
    while ($row = mysqli_fetch_assoc($query_run)){
        echo '<tbody class="bg-light">';
        echo "<tr>";
        echo "<td>" . $row['ac_no'] . "</td>";
        echo "<td>" . $row['book_name'] . "</td>";
        echo "<td>" . $row['author'] . "</td>";
        echo "<td>" . $row['publisher'] . "</td>";
        echo "<td>" . $row['category'] . "</td>";
        echo "<td>" . $row['purchase_year'] . "</td>";
        echo "<td>" . $row['book_price'] . "</td>";
        $an = $row['ac_no'];
		echo "<td><a href='edit_book.php?an=$an'>Edit</a></td>";
		echo "<td><a href='delete_book.php?an=$an'>Delete</a></td>";
        echo "<tr>";
        echo "</tbody>";
	}
}
echo "</table>
</div>
</div>";
?>

</body>
</html>