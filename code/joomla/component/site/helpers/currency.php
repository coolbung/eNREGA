<?php
setlocale(LC_MONETARY, 'en_US');

class KHelperCurrency
{
    public static function format($number)
    {
		$op = '₹ ';
		$op .= number_format($number);
		
		return $op;
    }
}
