# Salesforce Flix Project


## Installing the App using a Developer Edition Org or a Trailhead Playground via the Salesforce CLI

Follow this set of instructions if you want to deploy the app to a more permanent environment than a Scratch org.
This includes non source-tracked orgs such as a [free Developer Edition Org](https://developer.salesforce.com/signup) or a [Trailhead Playground](https://trailhead.salesforce.com/).

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

1. If you are setting up a Developer Edition: go to **Setup**, under **Platform Cache**, and click the "Request Trial Capacity" button. [Request a Platform Cache Trial](https://help.salesforce.com/articleView?id=data_platform_cache_trial.htm&type=5)

1. Run this command in a terminal to deploy the app.

    ```
    sfdx force:source:deploy -p force-app
    ```

1. Assign the `AccountContractDealers` permission set to the default user

    ```
    sfdx force:user:permset:assign -n AccountContractDealers
    ```
    or assign it to a specific user.

    ```
    sfdx force:user:permset:assign -n AccountContractDealers -o youruser@yourorg.com
    ```

1. Assign the `AccountContractSupervisors` permission set to the default user

    ```
    sfdx force:user:permset:assign -n AccountContractSupervisors
    ```
    
    or assign it to a specific user.

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

1. In App Launcher, select the **Apex Recipes** app.
    - If the app does not load, please double check that the **Apex Recipes** permission set active on your user.