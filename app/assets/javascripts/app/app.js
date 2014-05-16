'use strict';
angular.module('popcornApp', [
	'ngRoute',
	'ngCookies',
	'popcornApp.controllers',
	'popcornApp.services',
	'popcornApp.directives',
	'popcornApp.resources'
])
.config(function($routeProvider, $locationProvider) {
	$routeProvider
		.when('/movie/:movie_id', 
		{
			controller: "MovieController",
			templateUrl: "/templates/movie.html"	
		})
		.when('/login',
		{
			controller: "LoginController",
			templateUrl: "/templates/login.html"
		})
		.when('/',
		{
			controller: 'MoviesController',
			templateUrl: '/templates/movies.html'
		})
		.otherwise({redirectTo: '/'});
	$locationProvider.html5Mode(true);
});