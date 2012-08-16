# Maintainer: lolilolicon <lolilolicon@gmail.com>

pkgname=dotcloud-cli
_pkgname=dotcloud.cli
pkgver=0.4.7
pkgrel=1
pkgdesc="dotCloud command-line interface client"
arch=(any)
url="http://www.dotcloud.com/"
license=(unknown)
depends=(python2 openssh git mercurial rsync)
makedepends=(python2-distribute)
source=(http://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('f859a837c80fe3d724024f6936d7f28d')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
