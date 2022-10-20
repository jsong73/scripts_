echo "What is the new branch name?"
read NEW
BRANCH=$(git name-rev --name-only HEAD)

git add .
git commit -m $1
git push origin $BRANCH
git checkout -b $NEW
