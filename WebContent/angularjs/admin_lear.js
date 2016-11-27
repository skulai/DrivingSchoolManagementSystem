//loading the 'login' angularJS module
//angular.module('learomFilter').controller('followBtnCtrl', function($scope) {
var fba = angular.module('learStatApp', []);
//defining the login controller
fba.controller('learStatCtrl', function($scope, $http) {


	$scope.actlear = function() {
		//alert("SSS"+arguments[0]);
		document.getElementById(arguments[0]).style.display = "block";
		document.getElementById('button_'+arguments[0]).style.display = "none";
		
		$http({
			method : "POST",
			url : 'activatelearners',
			data : {
				"learId" : arguments[0].toString()
			}
		}).success(function(data) {
			
			//checking the response data for statusCode
			if (data.statusCode == 200) {
				
			}
			else{
				
			}
				//Making a get call to the '/redirectToHomepage' API
				//window.location.assign("/"); 
		}).error(function(error) {
			$scope.unexpected_error = false;
			$scope.username_email_exists = true;
		});
		
	};



});

