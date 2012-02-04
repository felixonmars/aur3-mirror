# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Contributor: jimbo <jimbo@e-jimbo.de>
pkgname=bmp-itouch
pkgver=1.0.1
pkgrel=1
pkgdesc="bmp-plugin for multimedia keyboards"
arch=('i686')
url="http://bmp-itouch.sourceforge.net/"
groups=
provides=
depends=('bmp' 'gtk2' 'glib2')
makedepends=()
conflicts=()
replaces=()
backup=()
license=('GPL2')
source=(http://heanet.dl.sourceforge.net/project/bmp-itouch/bmp-itouch%20%28Stable%20Version%29/1.0.1%20%28Stable%20Version%29/$pkgname-$pkgver.tar.gz)
md5sums=('a131cbf10ab1e50dfd8cc4a6acef13e1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make prefix=$startdir/pkg/usr install
}

