/**************************************************************************************************/
/***
/***	TERNSTYLE (TM) ELAPSOR JAVASCRIPT DOCUMENT (ternElapse (tm) version 2.2 for jQuery)
/***	-----------------------------------------------------------------------
/***	Written by Matthew Praetzel. Copyright (c) 2009 Matthew Praetzel.
/***	-----------------------------------------------------------------------
/***	All Rights Reserved. Any use of these functions & scripts without written consent is prohibited.
/***
/**************************************************************************************************/

/*-----------------------
	ternElapse (tm) v2.1
-----------------------*/
$ = $ ? $ : jQuery;
jQuery.fn.extend({
	elapsor :
	function (a) {
		var defaults = {
			image : '',
			color : '#fff',
			opacity : 65,
			func : null,
			text : '',
			text_style : {
				color : '#333',
				'font-size' : '11px'
			}
		}
		//
		a = $.extend(defaults,a);
		this.w = [this.innerWidth(),this.innerHeight()];
		this.s = [this.scrollLeft(),this.scrollTop()];
		a.opacity = a.opacity ? '0.'+a.opacity.toString() : .65;
		a.color = a.color ? a.color : '#000';
		a.text_style = a.text_style ? a.text_style : {
			color : '#fff',
			'font-size' : '16px'
		}
		this.mask = this.find('.ternMask').get(0);
		if(!this.mask) {
			this.mask = document.createElement('div');
			jQuery(this.mask).css({
				'display'	: 'none',
				'position'	: 'absolute',
				'clear'		: 'both',
				'overflow'	: 'hidden',
				'z-index'	: 10000,
				'top'		: 0,
				'left'		: 0,
				'width'		: this.get(0).scrollWidth,
				'height'	: this.get(0).scrollHeight
			});
			this.prepend(this.mask);
			jQuery(this.mask).addClass('ternMask');
		}
		if(a.image || a.text) {
			this.createElapsor(a);
		}
		else if(this.elap) {
			jQuery(this.elap).css('display','none');
		}
		jQuery(this.mask).css({
			'opacity'			: a.opacity,
			'background-color'	: a.color,
			'display'			: 'block'
		});
		if(a.func) { a.func(); }
	},
	createElapsor :
	function (a) {
		this.elap = this.find('.ternElapsor').get(0);
		if(this.elap) {
			var i = $(this.elap).find('img').get(0);
			if(i) {
				i.src = a.image;
			}
			if(a.text) {
				this.elapsorText(a.text);
			}
		}
		else {
			this.elap = document.createElement('div');
			if(a.image) {
				this.image = document.createElement('img');
				this.image.src = a.image;
				this.elap.appendChild(this.image);
				this.elap.appendChild(document.createElement('br'));
			}
			if(a.text) {
				this.text = document.createElement('span');
				this.text.appendChild(document.createTextNode(a.text));
				this.elap.appendChild(this.text);
			}
			this.mask.appendChild(this.elap);
			jQuery(this.elap).addClass('ternElapsor').css({
				'position' : 'absolute',
				'width' : 300,
				'z-index' : 50,
				'text-align' : 'center'
			}).css(a.text_style);
		}
		jQuery(this.elap).css({
			'top' : (this.s[1]+((this.w[1])/2)),
			'left' : (this.s[0]+((this.w[0]-300)/2)),
			'display' : 'block'
		});
		return this.elap;
	},
	elapsorText :
	function (t) {
		$(this.elap).find('span').text(t);
	},
	hideElapsor :
	function () {
		this.mask = this.find('.ternMask').get();
		if(this.mask) {
			jQuery(this.mask).css({
				'display' : 'none'
			})
		}
	}
});