var RobsonJunior = function() {

	'use strict';

	/**
	*
	* Set default elements
	*
	**/
	var W = window,
		D = document,
		HTML = D.documentElement,
		BANNER = D.getElementById('mainBanner'),
		titleBlur = D.getElementById('titleBlur'),
		PUBLIC = this,
		PRIVATE = {},
		postInfo = {
			post: D.getElementsByClassName('post'),
			postInfo: D.getElementsByClassName('post-info'),
			postComments: D.getElementsByClassName('post-excerpt')
		},
		breakpoints = {
			xs: 'xs',
			s: 's',
			m: 'm',
			l: 'l',
			xl: 'xl'
		},
		calendar = {
			month: {
				'Jan': 'Jan',
				'Feb': 'Fev',
				'Mar': 'Mar',
				'Apr': 'Abr',
				'May': 'Mai',
				'Jun': 'Jun',
				'Jul': 'Jul',
				'Aug': 'Ago',
				'Sep': 'Set',
				'Oct': 'Out',
				'Nov': 'Nov',
				'Dec': 'Dez'
			}
		};


	/**
	*
	* PRIVATE FUNCTIONS
	*
	**/
	PRIVATE.treatePostDate = function(post){
		var getDate,
			dateArr,
			date = {};

		for(var i = 0, postLen = post.length; i < postLen; i++){
			getDate = post[i].getAttribute('date');
			dateArr = getDate.split(' ');
			post[i].removeAttribute('date');

			date.day = dateArr[2];
			date.month = calendar.month[dateArr[1]];
			date.year = dateArr[3];
			date.hour = dateArr[4];

			PRIVATE.replacePostDate(post[i], date);
		}
	};

	PRIVATE.replacePostDate = function(post, date){
		var dateInfo = date.day + '.' + date.month + '.' + date.year,
			hourInfo = date.hour.substr(0,5);

		post.innerHTML = '<li class="post-date">' + dateInfo + '</li>'
						+ '<li class="post-hour">' + hourInfo + '</li> ';
	};

	PRIVATE.excerpt = function(post, comments){
		var str = '',
			postLen = post.length,
			comLen = comments.length,
			testQtd = (postLen === comLen);

		if (testQtd){
			for(var i = 0; i < postLen; i++){
				str = comments[i].innerHTML.substr(0, 220);
				comments[i].innerHTML = str.replace(/(\<.*?\\?.?\>)/g,'') + '...';
			}
		}
	};

	PRIVATE.getDocWidth = function() {
		return Math.max(
			D.body.scrollWidth, HTML.scrollWidth,
			D.body.offsetWidth, HTML.offsetWidth,
			D.body.clientWidth, HTML.clientWidth
		);
	};

	PRIVATE.getMainBannerHeight = function() {
		return Math.max(
			BANNER.offsetHeight, BANNER.offsetHeight,
			BANNER.clientHeight, BANNER.clientHeight
		);
	};

	PRIVATE.setBodyClass = function(width) {
		switch(true) {
			case width >= 1280:
				HTML.setAttribute('breakpoint', breakpoints.xl);
				break;
			case width >= 1024 && width < 1280:
				HTML.setAttribute('breakpoint', breakpoints.l);
				break;
			case width >= 768 && width < 1024:
				HTML.setAttribute('breakpoint', breakpoints.m);
				break;
			case width >= 320 && width < 768:
				HTML.setAttribute('breakpoint', breakpoints.s);
				break;
			case width < 320:
				HTML.setAttribute('breakpoint', breakpoints.xs);
				break;
			default:
				console.log('Sorry, your HTML size is not define.');
		}
	};

	PRIVATE.setContentPosition = function(position) {
		D.getElementById('main').style.marginTop = (position - 10) + 'px';
	};

	PRIVATE.blurLayer = function(height){
		if( titleBlur != null && titleBlur != undefined ){
			titleBlur.style.height = (height + 36) + 'px';
		}
	};

	PRIVATE.listeners = function() {
		var mBannerHeight,
			img = new Image(),
			dw;

		img.src = "http://robsonjunior.cc/virtualization/img/virtualization.jpg";
		BANNER.appendChild(img);

		img.addEventListener('load', function(){
			mBannerHeight = PRIVATE.getMainBannerHeight();

			PRIVATE.setContentPosition(mBannerHeight);
			PRIVATE.blurLayer(mBannerHeight);
		});

		W.addEventListener('load', function(){
			var getComments = D.getElementById('comments');

			if( getComments != null && getComments != undefined ){
				PRIVATE.diskusScript();
			}
		});

		W.addEventListener('resize', function(){
			dw = PRIVATE.getDocWidth();
			mBannerHeight = PRIVATE.getMainBannerHeight();

			PRIVATE.setBodyClass(dw);
			PRIVATE.setContentPosition(mBannerHeight);
			PRIVATE.blurLayer(mBannerHeight);

			console.log('## resize', dw);
		});
	};

	PRIVATE.diskusScript = function(){
		var dsqShortname = 'robsonjunior',
			dsq = D.createElement('script');

		dsq.type = 'text/javascript';
		dsq.async = true;
		dsq.src = '//' + dsqShortname + '.disqus.com/embed.js';

		(D.getElementsByTagName('head')[0] || D.getElementsByTagName('body')[0]).appendChild(dsq);
	};

	/**
	*
	* PUBLIC FUNCTIONS
	*
	**/
	PUBLIC.init = function(){
		PRIVATE.setBodyClass( PRIVATE.getDocWidth() );
		PRIVATE.listeners();
		PRIVATE.treatePostDate(postInfo.postInfo);
		PRIVATE.excerpt(postInfo.post, postInfo.postComments);
	};

	/**
	*
	* RETURN
	*
	**/
	return PUBLIC.init();

};

/**
*
* Main function, all functions init here.
*
**/
(function Main(){

	var jr = new RobsonJunior();

})();