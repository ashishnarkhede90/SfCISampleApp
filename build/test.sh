echo "Pushing code to scratch org..."
sfdx force:source:push -u ${CIRCLE_BRANCH}
echo "run all tests in scratch org..."
sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername ${CIRCLE_BRANCH}