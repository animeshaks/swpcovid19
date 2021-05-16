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
                    alert('Insertion Failed - occured during Insertion :)');
                }else{
                    $scope.message= data.data;

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

    $scope.search_donations=function(pincode,region){
        $scope.donationdetails="";
        $http.get("api/api_donations.php?action=fetch_donations_by_pincode&pincode="+pincode+"&region="+region)
        .then(function(donationdetails){

            // console.log(donationdetails.data.scalar);

            if (donationdetails.data.scalar=="No details found." || donationdetails.data.scalar=="All fields are required") {
                // alert(donationdetails.data.scalar);
                $scope.doneravailable=false;
                $scope.donernotavailable=true;
            } 
            else{
                $scope.donationdetails=donationdetails.data;
                $scope.filteredResult=$scope.donationdetails;
                $scope.doneravailable=true;
                $scope.donernotavailable=false;
            }
        });
    }

    $scope.stuffFilter = function(result) {
        var x = Object.values($scope.donationdetails);

        // var filterResult = [];

        // for (var i = 0; i < x.length; i++) {
        //     let element = x.filter(item => item.donation_stuff === result);
        //     filterResult.push(element);
        // }

        var filterResult = x.filter(item => item.donation_stuff === result);
        console.log(filterResult);

        if(filterResult.length === 0){
            alert("No Doner Found of your selected choice");
            $scope.filteredResult = filterResult;
        }else{
            $scope.filteredResult = filterResult;
        }
    }

    $scope.like_modal=function(donation_id){
        $('#likedonationmodel').modal('toggle'); 
        $scope.donate_id = donation_id;
    }

    $scope.dislike_modal=function(donation_id){
        $('#dislikedonationmodel').modal('toggle'); 
        $scope.donate_id = donation_id;
    }

    $scope.like_donation=function(donationid,requestId){
        $http({
            method : "POST",
            url : 'api/api_donations.php',
            data: {
                requestId:requestId,
                donationid:donationid,
                action:"like_donation"
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

                if($scope.message=="Donation liked successfully."){
                    alert($scope.message);
                    // location.reload();
                }
                else{
                    alert($scope.message);
                }
            }
        });
    }

    $scope.dislike_donation=function(donationid,requestId){
        $http({
            method : "POST",
            url : 'api/api_donations.php',
            data: {
                requestId:requestId,
                donationid:donationid,
                action:"dislike_donation"
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

                if($scope.message=="Donation disliked successfully."){
                    alert($scope.message);
                    // location.reload();
                }
                else{
                    alert($scope.message);
                }
            }
        });
    }

}]);
