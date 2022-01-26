# CREATING INDIVIDUAL STOCKS FOR A BENEFICIARY
POST https://smucf-dev-ebs-g1t3-srv.cfapps.us10.hana.ondemand.com/api/BeneficiaryStock

{
"stockCount":5000,
"beneficiary_beneficiaryID": "bene001",
"stock_stockID": "rice"
}

# DEEP INSERT, CREATE BENEFICIARY WITH STOCK
On postman: 

{
    "address": "23 Jalan Lokam",
    "postcode": 537869,
    "householdSize": 3,
    "perCapitalIncome": "800",
    "religion": "Buddhism",
    "race": "Chinese",
    "numWorkingAdults": 1,
    "noOfChildren": 0,
    "dietaryRestrictions": "Diabetes",
    "regionID_regionID": null,
    "Stocks": [
        {
            "stock_stockID": "beverage",
            "stockCount": 16
        },
        {
            "stock_stockID": "biscuit",
            "stockCount": 460
        },
                {
            "stock_stockID": "bread",
            "stockCount": 24
        },
                {
            "stock_stockID": "canned",
            "stockCount": 8
        },
        {
            "stock_stockID": "egg",
            "stockCount": 30
        },
                {
            "stock_stockID": "rice",
            "stockCount": 5000
        }
    ]
}

# Deployment instructions
    cds deploy --to hana
    mbt build
    cf deploy mta_archives/EBS-G1T3_1.0.0.mtar 
    
# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
