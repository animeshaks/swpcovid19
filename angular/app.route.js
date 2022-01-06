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

	.state("login", {
		url: "/user-login",
		templateUrl: "view/login.html",
		controller: "userlogincontroller"
	})

	.state("contact", {
		url: "/contact-us",
		templateUrl: "view/contact.html"
	})

	.state("joinus", {
		url: "/join-us",
		templateUrl: "view/volunteer.html"
	})

	.state("fillform", {
		url: "/fill-a-form",
		templateUrl: "view/fill_form.html"
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
	


