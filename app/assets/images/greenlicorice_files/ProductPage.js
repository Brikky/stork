function pvSelect(src, e, PID,PVhref) {//Element does not have to be a link. Pass the HREF here.

	this.pvDetailS = function (data) {
	    document.location.hash = 'pv=' + PID;
	    $jq(document).attr('title', data.PageTitle);
	    $jq('meta[name=description]').attr('content', data.MetaDescription);
	    $jq('link[rel=canonical]').attr('href', data.LinkCanonical);
	    for (var key in data.productDetailsDictionary) {
	        if (data.productDetailsDictionary.hasOwnProperty(key)) {
	            $jq("#" + key).replaceWith($jq(data.productDetailsDictionary[key]));
	        }
	    }
	    try {
	        var twitterwjs = de("twitter-wjs");
	        if (twitterwjs) {
	            twitterwjs.parentElement.removeChild(twitterwjs);
	            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");
	        }
	        CloudZoomReIni();
	        FB.XFBML.parse();
	    } catch (ex) { }
	}
	this.pvDetailE = function (jqXHR, stat, err) {
	    location.href = PVhref;
	}
	var This = this;
	$jq.ajax({
	    url: PVhref,
	    cache: false,
	    type: 'POST',
	    data: { 'isJSON': 1 },
	    dataType: 'json',
	    timeout: 5000,
	    success: function (data) { This.pvDetailS(data); },
	    error: function (jqXHR, stat, err) { This.pvDetailE(jqXHR, stat, err); }
	});
}

      


