echo "Pushing code to scratch org..."
sfdx force:source:push -u ${CIRCLE_BRANCH}
echo "Run all tests in scratch org..."
echo "Getting test results..."
testId=`sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername ${CIRCLE_BRANCH}`
testRunId=`echo ${testId} | grep ".-i.*" -o | cut -c 5-19`
echo "Getting test report for " ${testRunId}
sfdx force:apex:test:report -i ${testRunId} -u ${CIRCLE_BRANCH} -r tap -d test-report -c