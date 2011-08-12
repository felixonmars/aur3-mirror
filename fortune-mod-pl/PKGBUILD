# Contributor: Piotr Porada <pordzio@gmail.com>
pkgname=fortune-mod-pl
pkgver=2.0_2002.09.12
pkgrel=3
pkgdesc="Polish fortune cookies"
arch=('i686' 'x86_64')
url="http://pld-linux.org"
license=('GPL')
depends=('fortune-mod')
makedepends=('cvs')
source=()
md5sums=()

_cvsroot=":pserver:cvs@cvs.pld-linux.org:/cvsroot/"

build() {
    cd ${srcdir}

    if [ -d fortunes-pl ]; then
        cd fortunes-pl
        rm -r *.dat
        cvs -z3 update -dA || return 1
    else
        cvs -z3 -d$_cvsroot co fortunes-pl || return 1
        cd fortunes-pl
    fi

    rm -r SPEC README skrypt.awk linuxpl.README ChangeLog

    ######## REMOVING UNWANTED FORTUNES (feel free to comment line below) #####
    rm dowcipy-niskopoziomowe dowcipy-szowinistyczne imiona
    ###########################################################################

    for i in `ls -dp * | grep -v /`; do
        cp $i /tmp/
        strfile -s $i
    done || return 1

    install -d "${pkgdir}/usr/share/fortune/pl/" || return 1
    for i in `ls -dp * | grep -v /`; do
        install ${srcdir}/fortunes-pl/$i ${pkgdir}/usr/share/fortune/pl/$i
    done || return 1
}
