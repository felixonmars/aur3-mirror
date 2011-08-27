# created 19:43:19 - 19/10/09
# Maintainer: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=kontrolpack
_realname=KontrolPack
pkgver=2.0.7
pkgrel=1
pkgdesc="Cross-platform network manager allowing remote shell commands execution, files transfer, network overview, etc..."
arch=('i686' 'x86_64')
url="http://www.kontrolpack.com/"
license=('GPL')
depends=('qt')
makedepends=()
source=(http://downloads.sourceforge.net/kontrolpack/KontrolPack-${pkgver}.tar.gz my.patch)
md5sums=('29927054ce499e0f792cc666e1cc186b'
         'cdbc737a73415523ab018739c2af230d')

build() {

        cd $srcdir/$_realname-${pkgver}
        patch -p2  < ../my.patch || return 1
        qmake || return 1
        make || return 1
  

        install -Dm755 kontrolpack $pkgdir/usr/bin/kontrolpack || return 1
        install -Dm644 kontrolpack.desktop $pkgdir/usr/share/applications/kontrolpack.desktop || return 1
        install -Dm644 kontrolpack.png $pkgdir/usr/share/pixmaps/kontrolpack.png || return 1

}
