# Contributor: Yoschi <brain_hack.gmx.de>
# Contributor: suppaman2 <suppaman2@googlemail.com>
#
# The registration key should be placed in ~/.clonk/$game-version
#
pkgname=cefe
pkgver=112
pkgrel=1
pkgdesc="A not official native Clonk Editor."
arch=('i686')
url="http://cefe.nosebud.de/"
license=('MIT')
groups=('games')
depends=('qt')
optdepends=('clonk_rage')
md5sums=()

source=(http://cefe.nosebud.de/binary/cefe-linux-r$pkgver-r.tar.gz)

build() {
  tar -xzf cefe-linux-r$pkgver-r.tar.gz

  mkdir -p $startdir/pkg/usr/share/cefe
  cd $startdir/pkg/usr/share/cefe/
  mv $startdir/src/cefe-linux-r$pkgver-r/* ./
  
  install -Dm644 $startdir/clonk-rage-cefe $startdir/pkg/usr/bin/clonk-rage-cefe
  install -Dm644 $startdir/clonk-rage-editor.desktop $startdir/pkg/usr/share/applications/clonk-rage-editor.desktop 
}
