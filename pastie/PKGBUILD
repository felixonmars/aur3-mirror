# Maintainer: Dusan Maliarik <dusan.maliarik[at]gmail[dot]com>

pkgname=pastie
_name=pastie
pkgver=0.1
pkgrel=1
pkgdesc="Create pastes from command line."
arch=('i686' 'x86_64')
url="http://raim.codingfarm.de/blog/2010/04/06/pastie-org-shell-script/"
license=('GPL')
depends=('curl' 'bash')
makedepends=()
groups=()
source=(http://pastie.org/pastes/904797/download)
md5sums=('84a72488101d1f5e5bf721ea50f06e91')

build() {
  cd "$srcdir"
  mv download pastie
  chmod +x pastie
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/pastie $pkgdir/usr/bin
}
