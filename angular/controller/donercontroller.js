app.controller('donercontroller',['$scope', '$rootScope', '$http', '$location', '$anchorScroll' , function($scope, $rootScope, $http, $location, $anchorScroll) {

    $scope.get_location_data = () => {
        const url = "https://api.postalpincode.in/pincode/";
        let pincode = $scope.pincode;
        
        $http.get("https://api.postalpincode.in/pincode/"+pincode).then(
            (response) => {

                let status = response.data[0].Status;
                // console.log(status);

                if(status === "Success"){
                    let area = response.data[0].PostOffice[0].Name;
                    let district = response.data[0].PostOffice[0].District;
                    let region = response.data[0].PostOffice[0].Region;
                    let state = response.data[0].PostOffice[0].State;

                    $scope.area = area;
                    $scope.district = district;
                    $scope.region = region;
                    $scope.state = state;
                }else{
                    alert("Please Enter Valid Pin code");
                }
            },
            (error) => {
              console.log(error);
          }
          );
    };

    $scope.create_donation=function(user_name,user_mobile,landmark,pincode,area,district,region,state,donation_stuff,donation_type,chargable_amount,remark){
        $http({
            method : "POST",
            url : 'api/api_donations.php',
            data: {
                user_name:user_name,
                user_mobile:user_mobile,
                landmark:landmark,
                pincode:pincode,
                area:area,
                district:district,
                region:region, 
                state:state,
                donation_stuff:donation_stuff,
                donation_type:donation_type,
                chargable_amount:chargable_amount,
                remark:remark,
                action:"add_new_donation"
            },
            headers : {'Content-Type': 'application/x-www-form-urlencoded'}
        })
        .then((data) => {
            $scope.message="";
            if (data.errors) {
                    // swal('Insertion Failed', 'Error occured during Insertion :)', 'error');
                }else{
                    $scope.message= data.data.scalar;

                    console.log($scope.message)

                    if($scope.message=="All fields are required" || $scope.message=="undefined" || $scope.message=="Error occured"){
                        alert($scope.message);
                    }
                    else{
                        $scope.donationid = $scope.message;
                        $scope.otpform=true;
                    }
                }
            });
    }


    $scope.verify_user=function(otp,donationid){
        $http({
            method : "POST",
            url : 'api/api_donations.php',
            data: {
                otp:otp,
                donationid:donationid,
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

                console.log($scope.message)

                if($scope.message=="Donation added successfully."){
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