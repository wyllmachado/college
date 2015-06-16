/**
*
* @name: AspiraJS Master Fucking Generator
* @version: v0.0.1
* @author: @robsongajunior
*
**/

'use strict';

var path   = require('path'),
    yeoman = require('yeoman-generator');

var AspiraGenerator = yeoman.generators.Base.extend({
	init: function () {
		this.pkg = yeoman.file.readJSON(path.join(__dirname, '../package.json'));

		console.log('\nWelcome to the AspiraJS Generator v' + this.pkg.version + '\n');

		this.on('end', function () {
			console.log('\n ## Powered by AspiraJS ## \n');
		});
    },

    askFor: function () {
    	var done = this.async(),
	    	prompts = [
	    		{
		    		type: 'input',
		            name: 'appname',
		            message: 'What\'s the project name?',
		            default: this.appname,
		            validate: function (value) {
		                // Trim input value and check if it's not mepty
		                if (!value.replace(/^\s+/g, '').replace(/\s+$/g, '')) {
		                    return 'You need to provide a project name';
		                }

		                return true;
		            }
		    	},
		    	{
		    		type: 'list',
		            name: 'typeProject',
		            message: 'Type project to generate:',
		            choices: [
		            	{
		                    value: 'ui',
		                    name: 'ui'
		                },
		                {
		                    value: 'mod',
		                    name: 'mod'
		                }
		            ],
		            default: 0
		    	},
		    	{
		    		type: 'list',
		            name: 'preprocessor',
		            message: 'Preprocessor to use:',
		            choices: [
		            	{
		                    value: 'styl',
		                    name: 'styl'
		                },
		                {
		                    value: 'less',
		                    name: 'less'
		                }
		            ],
		            default: 0
		    	}
	    	];

     	this.prompt(prompts, function (props) {
     		this.appname 		= props.appname.toLowerCase();
     		this.preprocessor 	= props.preprocessor.toLowerCase();
     		this.typeProject 	= props.typeProject.toLowerCase();

            done();
        }.bind(this));
    },

    makeMainDirectory: function () {
    	this.mkdir('src');
    	this.mkdir('src/js');

    	if (this.typeProject === 'ui') {
	    	this.mkdir('src/css');

    		switch (this.preprocessor) {
	    		case'styl':
	    			this.mkdir('src/styl');
	    			break;
	    		case 'scss':
	    			this.mkdir('src/scss');
	    			break;
	    		case 'less':
	    			this.mkdir('src/less');
	    			break;
	    	}
    	}
    },

    makeMainFile: function () {
    	this.copy('gitignore', '.gitignore');
    	this.copy('editorconfig', '.editorconfig');
    	this.copy('jshintrc', '.jshintrc');
    	this.copy('Gruntfile.js', 'Gruntfile.js');

    	this.copy('package.json', 'package.json');

    	if (this.typeProject === 'mod') {
    		this.copy('index-mod.html', 'index.html');
    		this.copy('js/mod/aspira-mod-default.js', 'src/js/aspira-mod-default.js');
    	}

    	if (this.typeProject === 'ui') {
    		this.copy('index-ui.html', 'index.html');
    		this.copy('js/ui/aspira-ui-default.js', 'src/js/aspira-ui-default.js');

    		switch (this.preprocessor) {
	    		case'styl':
	    			this.copy('css/styl/index.styl', 'src/styl/index.styl');
	    			break;
	    		case 'scss':
	    			this.copy('css/scss/index.scss', 'src/scss/index.scss');
	    			break;
	    		case 'less':
	    			this.copy('css/less/index.less', 'src/less/index.less');
	    			break;
	    	}
    	}
    },

    installingLodash: function () {
    	this.npmInstall();

    	if (this.typeProject === 'ui') {
	    	this.npmInstall(['grunt-contrib-stylus'], {'saveDev': true });

			this.npmInstall(['grunt-contrib-sass'], {'saveDev': true });
			this.npmInstall(['grunt-scss-lint'], {'saveDev': true });

			this.npmInstall(['grunt-contrib-less'], {'saveDev': true });
	    	this.npmInstall(['grunt-lesslint'], {'saveDev': true });
    	}
    }
});

module.exports = AspiraGenerator;