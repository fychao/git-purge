cd $1
 git config credential.helper cache
 git pull
 git rev-parse HEAD~10 > .git/info/grafts
 git filter-branch -- --all
 rm -Rf .git/refs/original
 git reflog expire --expire=now --all
 git gc --prune=now
 git gc --aggressive --prune=now
 git repack -Ad
 git prune
 git push -f
