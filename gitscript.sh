git add .
echo -n "What are the changes for ?"
read;
git commit -m "${REPLY}"
git pull
git push