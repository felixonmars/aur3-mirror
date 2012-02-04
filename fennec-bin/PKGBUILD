pkgname=fennec-bin
pkgver=6.0
pkgrel=1
pkgdesc="Webbrowser for mobile devices based on firefox"
arch=('i686')
license=('GPL' 'LGPL' 'MPL')
url="http://www.mozilla.org/projects/fennec/"
makedepends=()
conflicts=()
replaces=()
depends=()
source=("http://ftp.mozilla.org/pub/mozilla.org/mobile/releases/${pkgver}/linux/en-US/fennec-${pkgver}.en-US.linux-i686.tar.bz2")
md5sums=('f1569f4a1b12c1a109b23b6e1abd423c')

build() {
  cd $startdir/pkg/
  mkdir -p usr/share/
  mkdir -p usr/bin/
  cp -R  $startdir/src/fennec/ usr/share/
#  chmod 644 -R ./
#  chown root:root -R ./
  cd usr/bin/
  ln -s /usr/share/fennec/fennec fennec
  ln -s fennec firefox-mobile

#  install -D -m644 AUTHORS $startdir/pkg/usr/share/licenses/$pkgname/AUTHORS
#  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

