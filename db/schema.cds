namespace scp.cloud;

type UserType : String enum {
  Volunteer;
  Admin;
  MSF;
}

entity Users {
  key userID    : UUID      @odata.Type : 'Edm.String'  @title : 'UserID';
      email     : String(50)@title      : 'Email';
      name      : String(50)@title      : 'Username';
      userType  : UserType  @title      : 'UserType';
      Charities : Composition of many UsersCharities
                    on Charities.user = $self;
}

entity UsersCharities {
  key user    : Association to Users;
  key charity : Association to Charities;
}

entity Charities {
  key charityID : UUID       @odata.Type : 'Edm.String'  @title : 'CharityID';
      name      : String(50) @title      : 'CharityName';
      address   : String(100)@title      : 'Address';
      users     : Composition of many UsersCharities
                    on users.charity = $self;
      Regions   : Composition of many CharitiesRegions
                    on Regions.charity = $self;
      Stocks    : Composition of many CharitiesStocks
                    on Stocks.charities = $self;
      Schedules : Association to many Schedules on Schedules.charity = $self;
}

entity CharitiesRegions {
  key charity : Association to Charities @title : 'Charity';
  key region  : Association to Regions   @title : 'Region';
}

entity Regions {
  key regionID  : UUID      @odata.Type : 'Edm.String'  @title : 'RegionID';
      name      : String(20)@title      : 'RegionName';
      Charities : Composition of many CharitiesRegions
                    on Charities.region = $self;
}

type Religion : String enum {
  Buddhism;
  Christianity;
  Catholicism;
  Islam;
  Taoism;
  Hinduism;
  Sikhism;
  Others;
  None;
}

type Race : String enum {
  Chinese;
  Malay;
  Indian;
  Others;
}

entity Beneficiaries {
  key beneficiaryID       : UUID                         @odata.Type : 'Edm.String'  @title : 'BeneficiaryID';
      regionID            : Association to one Regions   @title      : 'RegionID';
      address             : String(50)                   @title      : 'Adddress';
      postcode			      : Integer						           @title		   : 'Postcode';   
      householdSize       : Integer                      @title      : 'HouseholdSize';
      perCapitalIncome    : String(10)                   @title      : 'PerCapitalIncome';
      religion            : Religion                     @title      : 'Religion';
      race                : Race                         @title      : 'Race';
      numWorkingAdults    : Integer                      @title      : 'NumWorkingAdults';
      noOfChildren        : Integer                      @title      : 'NoOfChildren';
      dietaryRestrictions : String(100)                  @title      : 'DietaryRestrictions';
      extraCharities      : String(50)                   @title      : 'extraCharities';
      Stocks              : Composition of many BeneficiariesStocks
                              on Stocks.beneficiary = $self;
      org                 : Association to one Charities @title      : 'org';
      lastDelivery       : Date                     @title      : 'LastDelivery';
      name                 : String(50)                 @title      : 'Name'
}

entity BeneficiariesStocks {
  key beneficiary : Association to Beneficiaries @title : 'Beneficiary';
  key stock       : Association to Stocks        @title : 'Stock';
      stockCount  : Integer                      @title : 'StockCount';
}

type Category : String enum {
  Vegetable;
  Fruit;
  MeatAndPoultry;
  Seafood;
  Dairy;
  Beverage;
  BreadOrBakery;
  Canned;
  Frozen;
  Instant;
  DryGoods;
  Grain;
}

entity Stocks {
  key stockID       : UUID      @odata.Type : 'Edm.String'  @title : 'StockID';
      name          : String(50)@title      : 'StockName';
      category      : Category  @title      : 'Category';
      Beneficiaries : Composition of many BeneficiariesStocks
                        on Beneficiaries.stock = $self;
      Charities     : Composition of many CharitiesStocks
                        on Charities.stock = $self;
    //   Baskets: Composition of many FoodBasket 
    //         on Baskets.stock = $self;
}

entity Schedules {
  key scheduleID : UUID                     @odata.Type : 'Edm.String'  @title : 'ScheduleID';
      charity    : Association to Charities @title      : 'Charity';
      date       : Date                     @title      : 'Date';
      startTime  : String(50)               @title      : 'StartTime';
      Details    : Composition of many Tasks
                     on Details.parent = $self;
}

type DeliveryStatus : String enum {
  Completed;
  NotCompleted;
}

entity Tasks { // shall be accessed through Orders only
  key TaskID        : UUID                  @odata.Type : 'Edm.String'  @title : 'TaskID';
    parent        : Association to Schedules;
    volunteer     : Association to one Users;
    beneficiary   : Association to one Beneficiaries;
    Food          : Association to one Basket;
    deliverStatus : DeliveryStatus @title : 'DeliveryStatus';
}

// entity FoodList {
//   key parent        : Association to Tasks;
//   key stock         : Association to one Stocks;
//       stockQuantity : Integer @title : 'StockQuantity';
// }

entity Basket {
      key BasketID : UUID       @odata.Type : 'Edm.String'  @title : 'BasketID';
      name      : String(50) @title      : 'BasketName';
      stocks   : Composition of many FoodBasket
                    on stocks.basket = $self;
}

entity FoodBasket {
  key basket : Association to Basket @title : 'basket';
  key stock       : Association to CharitiesStocks {charities, stock}      @title : 'stock';
  quantity : Integer @title : 'ItemQuantity';
}

entity ToReview {
  Key beneficiaryID: Association to one Beneficiaries @title : 'beneficiaryID';
  status: String(100) @title      : 'status';
  other: String(100) @title : 'other';
}

entity CharitiesStocks {
  key charities : Association to Charities @title : 'Charities';
  key stock       : Association to Stocks {stockID, name}        @title : 'Stock';
  stockCount  : Integer                      @title : 'StockCount';
  foodbasket : Composition of many FoodBasket 
                on foodbasket.stock = $self        @title: 'foodbasket'; 
}

entity DataRequest {
  Key beneficiaryID: Association to one Beneficiaries @title : 'beneficiaryID';
  status: String(100) @title      : 'status';
  other: String(100) @title : 'other';
}