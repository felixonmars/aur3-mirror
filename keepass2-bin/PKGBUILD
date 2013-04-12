# Maintainer: Ryan McGuire <ryan@enigmacurry.com>

pkgname=keepass2-bin
pkgver=2.22
pkgrel=2
pkgdesc="KeePass 2.x - the free, open source, light-weight and easy-to-use password manager (binary version.)"
arch=('i686' 'x86_64')
url="http://keepass.info"
license=('GPL')
provides=('keepass2-bin')
depends=(mono)
makedepends=(unzip)
source=(http://downloads.sourceforge.net/project/keepass/KeePass%202.x/$pkgver/KeePass-$pkgver.zip)
md5sums=('cf781cb9b02b5a530ab4889dd522804c')

build() {
  rm $srcdir/KeePass-$pkgver.zip
}

package() {
  install -d -m755 $pkgdir/usr/share/keepass2-bin
  cp -a $srcdir/* $pkgdir/usr/share/keepass2-bin
  install -d -m755 $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  echo -e "#!/usr/bin/bash\nmono /usr/share/keepass2-bin/KeePass.exe" > $pkgdir/usr/bin/keepass2
  chmod a+x $pkgdir/usr/bin/keepass2
}
