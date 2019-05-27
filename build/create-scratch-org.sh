# CIRCLE_BRANCH is an env variable that refers to the Git branch currently being built
echo "Creating a scratch org"
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s