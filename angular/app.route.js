app.config(function ($stateProvider,$urlMatcherFactoryProvider,$urlRouterProvider,$locationProvider) {
	$urlRouterProvider.otherwise("/home");
	$locationProvider.html5Mode(false);
	$locationProvider.hashPrefix("");
	$urlMatcherFactoryProvider.caseInsensitive(true);

	$stateProvider
	
	.state("home", {
		url: "/home",
		templateUrl: "view/home.html",
		controller: "homecontroller"
	})

	.state("contact", {
		url: "/contact-us",
		templateUrl: "view/contact.html"
	})

});
	


