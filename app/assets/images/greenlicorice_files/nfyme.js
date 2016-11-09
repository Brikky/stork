
/*
vc Notify me 1.0
*/

function vcNtfyMe(e, pid, pname, sku) {

	if (typeof vcNtfyMeT === 'undefined' || vcNtfyMeT == null) { vcNtfyMeObj = null; return; }

	// Deep copy e (IE7 and 8 have issues using the event object in the nested functions)
	this.e = $jq.extend(true, {}, e);

	// Bind Esc Key
	this.vcNtfyMeEscSet = f;
	var thisEsc = this;
	if (!this.vcNtfyMeEscSet) { this.vcNtfyMeEscSet = t; $jq(document).bind('keydown.vcNtfyMe', function (keyE) { if (keyE.keyCode == 27) { thisEsc.Esc(keyE); } }); }

	this.ntfyMeAjax = null;
	this.$objLoader = null;
	this.$contentOverlay = null

	this.msgBx = new vcMsgBox(e);
	this.msgBx.content = '<div id="vcNtfyMeWrap">' + vcNtfyMeT + '</div>';
	this.msgBx.position = 'center';
	this.msgBx.reCenter = !IsThisMobiDev();
	this.msgBx.closeButtonOnClick = 'vcNtfyMeObj.Close(event);';
	this.msgBx.closeLinkOnClick = 'vcNtfyMeObj.Close(event); return false;';
	this.msgBx.closeOnEsc = f;
	this.msgBx.modal = t;
	vcMsgBoxZIC = vcMsgBoxZIC + 1000;
	this.msgBx.Pop();
	vcMsgBoxZIC = vcMsgBoxZIC - 1000;

	// Close
	this.Close = function (e) {
		// code to handle ajax aborting in case it is running still

		// Unbind Esc Key
		$jq(document).unbind('keydown.vcNtfyMe');
		this.vcNtfyMeEscSet = f;

		this.msgBx.Off(e)
		this.msgBx = null;
		vcNtfyMeObj = null;
	}

	//  NotifyS
	this.NotifyS = function (data) {
		if (data.error) {
			this.NotifyE(null, null, null, data);
			return;
		}
		var $content = $jq('#vcNtfyMeWrap', this.msgBx.vcMsgBoxE);
		var thisNotifyS = this;
		$content.animate({ opacity: 0 }, 200);
		this.RemoveOverlay(function () {
			$newContent = $jq(data.content);
			$content.css('overflow', 'visible');
			$content.height($content.height());
			PreLoadImages($newContent, 3000, function () {
				$content.html($newContent);
				$newContent.height($newContent.height());
				var thisThisNotifyS = thisNotifyS;
				var newh = $newContent.height();
				$content.animate({ height: newh }, 300, function () {
					thisThisNotifyS.msgBx.ReCenter();
					$content.animate({ opacity: 1 }, 300);
				});
			});
		});

	}

	this.NotifyE = function (jqXHR, stat, err, data) {

		// Remove the loader animation.
		this.RemoveOverlay();
		var This = this;
		if (data.error) {
			if (data.error === "1") {
				This.NotifyMainError();
			}
			else {
				var $NtyMeEmailError = $jq('#NtyMeEmailError', this.msgBx.vcMsgBoxE)
				if ($NtyMeEmailError.length > 0) {
					$NtyMeEmailError.html(data.error);
					$NtyMeEmailError.show();
				}
			}
		}
	}

	this.NotifyMainError = function () {
		var $NtyMeError = $jq('#NtyMeErrorMessage', this.msgBx.vcMsgBoxE);
		var $NtyMeBody = $jq('#NtyMeBody', this.msgBx.vcMsgBoxE);

		$NtyMeBody.hide();
		$NtyMeError.show(200);
	}


	// Notify
	this.Notify = function (e) {

		var $content = $jq('#vcNtfyMeWrap', this.msgBx.vcMsgBoxE);
		if ($content.length > 0) {
			this.$contentOverlay = $jq('<div style="position:absolute; top:1px; left:1px; background-color:#fff; width:' + ($content.width() - 2) + 'px; height:' + ($content.height() - 2) + 'px;"></div>');
			this.$contentOverlay.css({ opacity: 0 });
			this.$contentOverlay.css('z-index', vcMsgBoxZIC + 1001);
			this.$objLoader = $jq('<div id="vcNtfyMeLoaderElement" style="padding:0; border:0; margin:0; font-style:normal; font-weight:normal; list-style:none; font-size:100%; font-weight:normal; width:30px; height:30px; background:url(/images/atcLoader.png) no-repeat; position:absolute; top:' + ($content.height() / 2 - 15) + 'px; left:' + ($content.width() / 2 - 15) + 'px;"></div>').sprite({ fps: 12, no_of_frames: 12 });
			this.$objLoader.hide();
			this.$objLoader.css('z-index', vcMsgBoxZIC + 1002);
			$content.after(this.$contentOverlay, this.$objLoader);
			this.$contentOverlay.animate({ opacity: 0.80 }, 300);
			$jq(this.$objLoader).fadeIn(300);

			var This = this;
			this.ntfyMeAjax = $jq.ajax({
				url: '/Articles/NotifyMe.aspx',
				cache: false,
				type: 'POST',
				data: { pid: pid, email: $jq('#NotifyMeEmail').val(), pname: pname, sku: sku },
				dataType: 'json',
				timeout: 15000,
				success: function (data) { This.NotifyS(data); },
				error: function (jqXHR, stat, err) { This.NotifyE(null, stat, err, null); }
				
			});
		}
	}
	//error: function (jqXHR, stat, err) { This.NotifyE(stat, err); }
	//error: $jq.proxy(function (jqXHR, stat, err) { this.NotifyE(jqXHR, stat, err, src); }, this)

	// RemoveOverlay
	this.RemoveOverlay = function (callback) {
		var thisOverlay = this;
		if (this.$contentOverlay) {
			this.$contentOverlay.stop().fadeOut(400, function () {
				thisOverlay.$contentOverlay.remove();
				thisOverlay.$contentOverlay = null;
			});

		}
		if (this.$objLoader) {
			this.$objLoader.stop().fadeOut(400, function () {
				thisOverlay.$objLoader.destroy();
				thisOverlay.$objLoader.remove();
				thisOverlay.$objLoader = null;
				if (callback) { callback(); }
			});
		}
	}

	// Esc
	this.Esc = function (e) {
		if (this.ntfyMeAjax == null) {
			this.Close(e);
		}
		else {
			return false;
		}
	}

}

//
// Close Notify
//
var vcNtfyMeObj = null;
function vcNtfyMeDo(e, src, pid, pname, sku) {
	if (vcNtfyMeObj == null) {
		vcNtfyMeObj = new vcNtfyMe(e, pid, pname, sku);
	}
}

