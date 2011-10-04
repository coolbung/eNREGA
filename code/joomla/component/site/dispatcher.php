<?php 

class ComEnregaDispatcher extends ComDefaultDispatcher {

    protected function _initialize(KConfig $config)
    {
        parent::_initialize($config);
        
        //Force the controller to the information found in the request
        if($config->request->view) {
            $config->controller = $config->request->view;
        }
        KRequest::set('session.year', null);
        // Data year handling
        $getyear 		= KRequest::get('get.year', 'int');
        $sessionyear 	= KRequest::get('session.year', 'int');
        
        if ($getyear) {
			KRequest::set('session.year', $getyear);
		} elseif (!$sessionyear) {
			KRequest::set('session.year', $this->getFY(date('Y-m-d'), '4/1', '3/30'));
		}
    }
    
    function getFY($inputDate, $fyStart, $fyEnd){
		$date = strtotime($inputDate);
		$inputyear = strftime('%Y',$date);
		   
		$fystartdate = strtotime($fyStart.$inputyear);
		$fyenddate = strtotime($fyEnd.$inputyear);

		if($date < $fyenddate){
			$fy = intval($inputyear);
		}else{
			$fy = intval(intval($inputyear) + 1);
		}
		
		$fystr = ($fy-1) . '-' . $fy;
		return $fystr;
   
	}
}
