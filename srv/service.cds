using scp.cloud from '../db/schema';

service api {
    // entity UserDetails as select from cloud.User u join cloud.User2Charity uc on u.associatedCharity = uc.user { 
    //    u.userID, u.name, u.password, u.userType, uc.charity
    // };

    // view test as select from cloud.User u, cloud.User2Charity uc {
    //     u.userID, u.name, uc.charity
    // } where u.userID = uc.user;

    //entity UserChairity as projection on cloud.UserChairity;
    
    entity User as projection on cloud.Users;
    entity Charity as projection on cloud.Charities;
    entity UserCharity as projection on cloud.UsersCharities;
    //entity CharityRegion as projection on cloud.CharitiesRegions;
    entity Region as projection on cloud.Regions;
    entity Beneficiary as projection on cloud.Beneficiaries;
    entity BeneficiaryStock as projection on cloud.BeneficiariesStocks;
    entity Stock as projection on cloud.Stocks;


    entity Schedule as projection on cloud.Schedules;
    entity Task as projection on cloud.Tasks;
    // entity FoodList as projection on cloud.FoodList;
    entity Basket as projection on cloud.Basket;
    entity FoodBasket as projection on cloud.FoodBasket;
    entity ToReview as projection on cloud.ToReview;
    entity CharitiesStocks as projection on cloud.CharitiesStocks;
    entity DataRequest as projection on cloud.DataRequest;
}

//select * from user inner join userCharity on user.userid = usercharity.userid
