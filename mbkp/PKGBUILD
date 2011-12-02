# Maintainer: Elifarley Cruz <first-name at gmail.com>

pkgname=mbkp
pkgver=0.1.1
pkgrel=1
pkgdesc="modular backup tool using Duplicity as backend"
arch=(any)
url="http://bitbucket.org/elifarley/mbkp/"
license=(GPL)
depends=(duplicity 'bash>=3.1' coreutils sed)
makedepends=(curl perl)
source=("http://bitbucket.org/elifarley/$pkgname/get/$pkgver.tar.bz2")
md5sums=('8558128cd32a167b05090b30e5323e27')

set -e

package() {
  cd "$srcdir/elifarley-$pkgname-$pkgver"
  ./installer/install.sh "$pkgdir"/usr
}

# vim:st=2:sw=2:et:

