# Salesforce Flix Project


## Installing the App using a Developer Edition Org, a Sandbox or a Trailhead Playground via the Salesforce CLI

Make sure to start from a brand-new environment to avoid conflicts with previous work you may have done.

1. Clone this repository:

    ```
    git clone https://github.com/gscateli/flix-project.git
    cd flix-project
    ```

1. Authorize with your Trailhead Playground or Developer Edition org and provide it with an alias (**mydevorg** in the command below):

    ```
    sfdx auth:web:login -s -a mydevorg
    ```

1. Run this command in a terminal to deploy the app.

    ```
    sfdx force:source:deploy -p force-app
    ```

1. Assign the `AccountContractDealers` permission set to the default user

    ```
    sfdx force:user:permset:assign -n AccountContractDealers
    ```
    Optionally assign it to a specific user. (make sure your user has 'Flow Access' checked on user details)

    ```
    sfdx force:user:permset:assign -n AccountContractDealers -o youruser@yourorg.com
    ```

1. Assign the `AccountContractSupervisors` permission set to the default user

    ```
    sfdx force:user:permset:assign -n AccountContractSupervisors
    ```
    
    Optionally assign it to a specific user. (make sure your user has 'Flow Access' checked on user details)

    ```
    sfdx force:user:permset:assign -n AccountContractSupervisors -o youruser@yourorg.com
    ```

1. Import Sample Data

    ```
    sfdx force:data:import:tree -p ./data/data-plan.json
    ```

1. If your org isn't already open, open it now:

    ```
    sfdx force:org:open -u mydevorg
    ```
