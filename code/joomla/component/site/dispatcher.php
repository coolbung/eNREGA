<?php 

class ComEnregaDispatcher extends ComDefaultDispatcher {

    protected function _initialize(KConfig $config)
    {
        parent::_initialize($config);
        
        //Force the controller to the information found in the request
        if($config->request->view) {
            $config->controller = $config->request->view;
        }
        
        // Data year handling
        $getyear 		= KRequest::get('get.year', 'int');
        $sessionyear 	= KRequest::get('session.year', 'int');
        
        if ($getyear) {
			KRequest::set('session.year', $getyear);
		} elseif (!$sessionyear) {
			KRequest::set('session.year', date('Y'));
		}
    }
}
