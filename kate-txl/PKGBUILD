# Maintainer: Giuseppe Calà <jiveaxe@gmail.com>
# Contributer: giacomogiorgianni@gmail.com 

pkgname=kate-txl
pkgver=1
pkgrel=1
pkgdesc="Plugin TXL for Kate editor"
arch=('any')
url="http://www.txl.ca/"
license=('GPL')
categories=()
depends=('kdebase-katepart')
makedepends=()
options=(!emptydirs)
source=("http://www.txl.ca/examples/Editors/KATE/KATE-Txl.tar.gz")
md5sums=('4c5890a3d1c98d77ba661a24772762fe')

build() {
install -dm 755 $pkgdir/usr/share/apps/katepart/syntax
cp $srcdir/KATE-Txl/txl.xml $pkgdir/usr/share/apps/katepart/syntax
}
