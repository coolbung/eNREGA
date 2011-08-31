<?php

$o[] = array('ashwin.date@tekdi.net', 'Ashwin');
$o[] = array('priyadarshan.21@gmail.com', 'Priyadarshan');
$o[] = array('suvikas@gmail.com', 'Suvikas');
$o[] = array('reddy.kapil@gmail.com', 'Kapil');
$o[] = array('ravibalgi@gmail.com', 'Ravi');
$o[] = array('milindmilind@gmail.com', 'Milind');
$o[] = array('atheist.nikhil@gmail.com', 'Nikhil');
shuffle($o);
?>


<table>
<?php foreach ($o as $i) : ?>
<tr>
	<td><img src="http://www.gravatar.com/avatar/<?= md5($i[0]) ?>?rating=PG&default=wavatar" /></td>
	<td><?= $i[1] ?></td>
</tr>
<?php endforeach; ?>
</table>
