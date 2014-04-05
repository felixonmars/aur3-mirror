if [ -z `ls -a ~ | grep "^.rsm$"` ] ; then
    mkdir ~/.rsm
    cp /usr/share/rsm/* ~/.rsm/
    cp /usr/share/licenses/rsm/rsm.lic ~/.rsm/rsm.lic
fi

export RSMHOME=~/.rsm
export RSMCFGHOME=~/.rsm
export RSMLICHOME=~/.rsm
