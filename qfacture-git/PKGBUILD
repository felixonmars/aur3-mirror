# Maintainer: Julien Pecqueur <jpec at julienpecqueur dot com>
#
# pkgrel 1 : creation of the pkg

pkgname=qfacture-git
pkgver=20101107
pkgrel=1
pkgdesc="Le logiciel libre de facturation pour les auto-entrepreneurs! (version GIT)"
arch=('i686' 'x86_64')
url="http://www.julienpecqueur.com/wordpress/projets/qfacture/"
license=('GPL')
depends=('qt')
makedepends=('git')
provides=('qfacture')

_gitroot="git://github.com/jpec/Qfacture.git"
_gitname="qfacture"

build() {
    cd "${srcdir}"
    msg "GIT clone Qfacture..."
    if [ -d ${_gitname} ] ; then
	cd ${_gitname} && git reset --hard && git pull origin
	msg "The local files are updated."
    else
	git clone ${_gitroot} ${_gitname}
	cd ${_gitname}
    fi
    msg "GIT checkout done or server timeout."

    git reset --hard

    msg "Build..."
    qmake Qfacture.pro
    make clean
    make

    msg "Install..."
    install -D -m644 dist/qfacture.desktop $startdir/pkg/usr/share/applications/qfacture.desktop || return 1
    install -D -m755 bin/Qfacture $startdir/pkg/usr/local/bin/qfacture || return 1
    install -D -m644 dist/qfacture.png ${startdir}/pkg/usr/share/pixmaps/qfacture.png || return 1

    msg "Be sure that /usr/local/bin is in your PATH !!!"
}
