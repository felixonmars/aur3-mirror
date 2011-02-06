# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gmakeself
pkgver=0.1
pkgrel=1
pkgdesc="A simple zenity-based interface for makeself."
arch=('i686' 'x86_64')
url="http://ghost1227.com/"
license=('GPL')
depends=('zenity' 'makeself')
source=(http://ghost1227.com/files/software/${pkgname}-${pkgver}.tar.gz)
md5sums=('0cbe486fd55eb26c20c92039b8af594a')

build() {
    /bin/true
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    install -Dm755 gmakeself \
        ${pkgdir}/usr/bin/gmakeself
    install -Dm644 gmakeself.desktop \
        ${pkgdir}/usr/share/applications/gmakeself.desktop
    install -Dm644 gmakeself.png \
        ${pkgdir}/usr/share/pixmaps/gmakeself.png
}
