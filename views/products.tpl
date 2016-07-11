<table>
<tr>
	<th>id</th>
	<th>name</th>
	<th>categor_id</th>
	<th>producer_id</th>
	<th>measur_id</th>
</tr>
<?php foreach ($products as $product) : ?>
	<tr>
		<td> <?=$product->getId() ?>       </td>
		<td> <?=$product->getName() ?>     </td>
		<td> <?=$product->getCategory() ?> </td>
		<td> <?=$product->getProducer() ?> </td>
		<td> <?=$product->getMeasur() ?>   </td>
	</tr>
<?php endforeach; ?>
</table>