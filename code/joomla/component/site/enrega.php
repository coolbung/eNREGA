<?php 
/*if (KRequest::get('get.year', 'int')) {
	KRequest::set('session.year', KRequest::get('get.year'));
}*/
echo KFactory::get('site::com.enrega.dispatcher')->dispatch(); 
?>
