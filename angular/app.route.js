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

	.state("needyform", {
		url: "/seeker-form",
		templateUrl: "view/seeker-form.html",
		controller: "needycontroller"
	})

	.state("donorform", {
		url: "/donor-form",
		templateUrl: "view/donor-form.html",
		controller: "donercontroller"
	})

	.state("donorsection", {
		url: "/donor-section",
		templateUrl: "view/donor-section.html",
		controller: "donercontroller"
	})

	.state("seekersection", {
		url: "/seeker-section",
		templateUrl: "view/needy-section.html",
		controller: "needycontroller"
	})

});
	


