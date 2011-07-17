# Contributor: mathieui <mathieui[at]mathieui.net>
pkgname=gnupoly
pkgrel=1
pkgver=0.9.7
pkgdesc="A free clone of the popular monopoly game"
arch=('any')
url="http://tit.studio.free.fr/"
license=('GPL')
depends=('cairo' 'pygtk' 'python-pygame' 'glade')
source=("http://tit.studio.free.fr/Sources%20GNUPoly%20$pkgver.tar.gz")
md5sums=('1b0463f9a1913f1309995543d549426c')


build() {
    cd "$srcdir/Sources GNUPoly $pkgver"
    mkdir -p $pkgdir/usr/share/gnupoly $pkgdir/usr/bin/
    cp -Rvf * $pkgdir/usr/share/gnupoly
    echo -en '#!/usr/bin/env sh'"\ncd /usr/share/gnupoly && exec python2 gnupoly.py" > $pkgdir/usr/bin/gnupoly
    chmod 555 $pkgdir/usr/bin/gnupoly
}


