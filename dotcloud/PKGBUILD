# Maintainer: lolilolicon <lolilolicon@gmail.com>

pkgname=dotcloud
pkgver=0.9.2
pkgrel=2
pkgdesc="dotCloud command-line interface client"
arch=(any)
url="http://www.dotcloud.com/"
license=(unknown)
depends=(python2-colorama python2-requests-0.10.0 python2 openssh git mercurial rsync)
makedepends=(python2-distribute)
source=(http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bfd6b4c5d1c344759c51e5e7dcc2d71d');

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
