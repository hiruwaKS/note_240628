rmdir /s /q main
rmdir /s /q public
rmdir /s /q gh-pages
mkdocs build
git clone -b main --single-branch https://github.com/hiruwaKS/note_240628.git main
git clone -b gh-pages --single-branch https://github.com/hiruwaKS/note_240628.git gh-pages
echo "Please modify the main folder"
set /P msg="Please modify and input the message: "
echo "%msg%"

git remote add origin https://github.com/hiruwaKS/note_240628.git
cd main
git add .
git commit -m "%msg%"
git push -u -f origin main:main
cd ..
cd gh-pages
git add .
git commit -m "%msg%"
git push -u -f origin gh-pages:gh-pages
cd .. 
pause
