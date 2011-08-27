# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=ndn-beta
pkgver=2.31.0000
pkgrel=1
pkgdesc="A Linux port of Necromancer's Dos Navigator"
arch=('i686')
url="http://ndn.muxe.com/"
license=('custom')
makedepends=('unrar')
provides=('ndn')
conflicts=('ndn')
source=(http://ndn.muxe.com/download/file/11)
md5sums=('0c46bebb73e2ec7868935ff0e8092758')

build() {
  cd $startdir/src
  unrar x 11 -inul
  rm 11
  find . -type d -exec chmod 755 {} \;
  chmod +x ndn
  mkdir -p $startdir/pkg/opt/ndn
  cp -R * $startdir/pkg/opt/ndn
  install -Dm644 doc/licence.txt $startdir/pkg/usr/share/licenses/ndn/license.txt
  mkdir -p $startdir/pkg/usr/bin
  ln -s /opt/ndn/ndn $startdir/pkg/usr/bin/ndn
}
