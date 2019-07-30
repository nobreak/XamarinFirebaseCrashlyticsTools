
## dsym upload to crashlytics
The `uploadDSYMs.sh` script uploads after every build (based on build configration) the generated dsym file to crashlytics based on given `GoogleService-Info.plist`

Use this script in the Visual Studio custom command section of your project like this: 

`sh uploadDSYMs.sh [PATH TO GoogleService-Info.plist] [PATH TO DSYM FOLDER]`

Example:

`sh uploadDSYMs.sh ${ProjectConfigName}/GoogleService-Info.plist  ../bin/${ProjectConfigPlat}/${ProjectConfigName}/${ProjectName}.app.dSYM
`


`uploadDSYMs.sh` in the end is using the upload-symbols tool which comes from Fabric.Crashlytics.iOS framework

