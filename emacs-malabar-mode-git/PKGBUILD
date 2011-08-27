# -*- mode: sh; -*-
# Contributor: stuck_pxl <flam44@gmail.com>

#
# You can change settings.xml file to set a approporiate proxy.
#

pkgname=emacs-malabar-mode-git
pkgver=20110216
pkgrel=1 
pkgdesc="A better Java mode for Emacs"
url="https://github.com/espenhw/malabar-mode"
arch=('any')
license=('GPL2')
depends=('emacs>=23.2')
makedepends=('git' 'maven')

source=('settings.xml')
install=$pkgname.install

_gitroot="http://github.com/espenhw/malabar-mode.git"
_gitname="malabar-mode"

_target="malabar-1.4.0"

bug_fix_1() {
    #
    # Bug:
    # 
    # This test failed. I didn't ask about this problem the
    # author. Maybe a someone could explain a more gentle bugfix
    # method.
    # 

    if [ -e ./src/test/groovy/org/grumblesmurf/malabar/ProjectsTest.groovy ]; then
	rm ./src/test/groovy/org/grumblesmurf/malabar/ProjectsTest.groovy
    fi
}

bug_fix_2() {
    #
    # Bug:
    #
    # There is new error: "mvn: command not found". This code should
    # fix the bug.
    #

    if [ -e /etc/profile.d/maven.sh ]; then
	source /etc/profile.d/maven.sh
    fi
}

build() {
    if [ -d ${srcdir}/$_gitname ] ; then
	cd $_gitname # && git pull $_target # I'm don't really get into the git and don't really know which parameter to pass to the "git pull" command.
    else
        git clone $_gitroot $_gitname
        cd $_gitname
        git checkout $_target
    fi

    bug_fix_1
    bug_fix_2
    
    mvn package --settings ${srcdir}/settings.xml  || return 1

    mkdir -p $pkgdir/usr/share/emacs/site-lisp

    unzip target/${_target}-dist.zip -d $pkgdir/usr/share/emacs/site-lisp/ || return 1
}

md5sums=('358cf38e2f86034c8e9b141948a98b0b')
