# Maintainer: Mihai Militaru <mihai dot militaru at gmx dot com>

pkgname=maya2011-docs
pkgver=2011.88
pkgrel=2
pkgdesc="Autodesk Maya documentation"
arch=('x86_64')
url="http://www.autodesk.com/maya"
license=('proprietary')
depends=()
makedepends=('rpmextract')
source=(http://images.autodesk.com/adsk/files/autodesk_maya_2011_sp1_linux_64bit.tgz)
md5sums=('71b57f45363b3c7cba82f448ea8a8015')
install=maya2011-docs.install

build() {
  cd ${pkgdir}
  rpmextract.sh "$srcdir"/Maya2011_0-docs_en_US_64-2011-88.x86_64.rpm
  install -Dm644 "$srcdir/EULA/All Other Countries.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
