var AspiraMOD = function (data) {
	'use strict';

	var PUBLIC = this,
		PRIVATE = {},
		D = document,
		W = window;


	/**
	*
	* PIVATE METHODS
	*
	**/
	PRIVATE.hello = function () {
		return 'Hello Word';
	};


	/**
	*
	* PUBLIC METHODS
	*
	**/
	PUBLIC.hello = function () {
		return PRIVATE.hello();
	};


	/**
	*
	* RETURN
	*
	**/
	return PUBLIC;

};

var aspira = new AspiraUI({});