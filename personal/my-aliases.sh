alias show-deploy-log='ssh -t p1 "tail -f ~/dolphin-deploy.log"'
alias create-release='git checkout master && git pull --rebase && git checkout -b $release_branch && for i in $branches; do; git checkout $i; git rebase $release_branch; git rebase $i $release_branch; done;'
alias cleanup-release='git checkout master && git push origin :$release_branch && git branch -D $release_branch && for i in $branches; do; git br -D $i; git push origin :$i; done;'
alias cdh='cd /mnt/c/Users/Sankara/Workplace'
