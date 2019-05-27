echo "Pushing code to scratch org..."
sfdx force:source:push -u ${CIRCLE_BRANCH}
echo "Run all tests in scratch org..."
sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername ${CIRCLE_BRANCH}
echo "Getting test results..."
sfdx force:apex:test:report -u ${CIRCLE_BRANCH} -r tap -d test-report -c