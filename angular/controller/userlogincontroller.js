app.controller('userlogincontroller',['$scope', '$rootScope', '$http', '$location', '$anchorScroll' , function($scope, $rootScope, $http, $location, $anchorScroll) {

    $scope.login_user=function(usertype,mobilenumber){
        $http({
            method : "POST",
            url : 'api/api_login_user.php',
            data: {
                usertype:usertype,
                mobilenumber:mobilenumber,
                action:"chk_login_user"
            },
            headers : {'Content-Type': 'application/x-www-form-urlencoded'}
        })
        .then((data) => {
            if (data.errors) {
                alert('Error occured during Login :)');
            }else{
                $scope.message= data.data;

                if($scope.message.scalar=="All fields are required" || $scope.message.scalar=="No user found with this credentials." || $scope.message.scalar=="undefined" || $scope.message.scalar=="Error occured"){
                    alert($scope.message.scalar);
                }
                else{
                    $scope.data = $scope.message;
                    $scope.otpform=true;
                }
            }
        });
    }

    $scope.verify_user=function(otp,mobilenumber,usertype){
        $http({
            method : "POST",
            url : 'api/api_login_user.php',
            data: {
                otp:otp,
                mobilenumber:mobilenumber,
                usertype:usertype,
                action:"verify_user"
            },
            headers : {'Content-Type': 'application/x-www-form-urlencoded'}
        })
        .then((data) => {
            $scope.message="";
            if (data.errors) {
                alert("Error occured... please try again later :)");
            }else{
                $scope.message= data.data.scalar;

                if($scope.message=="Welcome User."){
                    alert($scope.message);
                    location.reload();
                }
                else{
                    alert($scope.message);
                }
            }
        });
    }

}]);
