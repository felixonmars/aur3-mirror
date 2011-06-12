# Maintainer: Julien Pecqueur <jpec at julienpecqueur dot com>
#
# pkgrel 0.1.1 : creation of the pkg
# pkgrel 0.1.2 : update to Qfacture v0.1.2
# pkgrel 0.1.3 : update to Qfacture v0.1.3
# pkgrel 0.1.4 : update to Qfacture v0.1.4
# pkgrel 0.1.5 : update to Qfacture v0.1.5

pkgname=qfacture
pkgver=20101105
pkgrel=0.1.5
pkgdesc="Le logiciel libre de facturation pour les auto-entrepreneurs!"
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

    msg "GIT checkout Qfacture v${pkgrel}..."
    git reset --hard v0.1.5
    msg "Build..."
    qmake Qfacture.pro
    make clean
    make

    msg "Install..."
    install -D -m644 dist/${pkgname}.desktop $startdir/pkg/usr/share/applications/${pkgname}.desktop || return 1
    install -D -m755 bin/Qfacture $startdir/pkg/usr/local/bin/${pkgname} || return 1
    install -D -m644 dist/${pkgname}.png ${startdir}/pkg/usr/share/pixmaps/${pkgname}.png || return 1

    msg "Be sure that /usr/local/bin is in your PATH !!!"
}
