echo "Pushing code to scratch org..."
sfdx force:source:push -u ${CIRCLE_BRANCH}
echo "Run all tests in scratch org..."
testId=`sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername ${CIRCLE_BRANCH}`
# echo "Getting test results..."
testRunId=`echo ${testId} | grep ".-i.*" -o | cut -c 5-19`
sfdx force:apex:test:report -i ${testRunId} -u ${CIRCLE_BRANCH} -r tap -d test-report -c