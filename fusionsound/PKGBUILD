# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Damien Alexandre <cougar@jabber.nuxo.net>

pkgname=fusionsound
pkgver=1.6.2
pkgrel=1
pkgdesc="A very powerful audio sub system in the manner of DirectFB and a technical demonstration of Fusion."
arch=('i686' 'x86_64')
url="http://www.directfb.org/index.php?path=Platform%2FFusionSound"
license="LGPL2"
depends=('directfb')
source=(http://www.directfb.org/downloads/Core/FusionSound/FusionSound-$pkgver.tar.gz)
md5sums=('bc6ed0cb77c0b8954f91706fe8aa95bc')

build() {
  cd $startdir/src/FusionSound-$pkgver
  
  ./configure --prefix=/usr --without-examples --without-timidity
  make || return 1
  make prefix=$startdir/pkg/usr install
}
