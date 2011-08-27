# Maintainer: coopstah13 <coopstah13@gmail.com>

pkgname=visual-regexp
pkgver=3.0
ubuntupkgrel=2
pkgrel=3
pkgdesc="A visual explorer for your regular expressions."
arch=('any')
url="http://laurent.riesterer.free.fr/regexp/"
license=('GPL2')
source=(http://mirrors.kernel.org/ubuntu/pool/universe/v/${pkgname}/${pkgname}_${pkgver}-${ubuntupkgrel}_all.deb visual-regexp.desktop)
md5sums=('718c04b6a3fb04d518a2e1d0af2e1ce2' 'e61c7bd5d8d289ab0e4b3a380ac454c5')
depends=('tk')

build() {
    cd $srcdir/
    ar x ${pkgname}_${pkgver}-${ubuntupkgrel}_all.deb
    tar zxf data.tar.gz
    sed -i 's/wish8.3/wish8.5/' usr/bin/visual-regexp
    rm -rf usr/share/menu
    mv usr $pkgdir
    install -m 644 -D ${startdir}/visual-regexp.desktop ${pkgdir}/usr/share/applications/visual-regexp.desktop

}
