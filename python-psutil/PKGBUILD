# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Wido <widomaker2k7@gmail.com> (python3)
# Contributor: Hieu Hoang <arch@zahe.me> (python2.7)

pkgname=python-psutil
pkgver=0.4.1
pkgrel=1
pkgdesc="A process utilities module for Python 3"
arch=('any')
url="https://code.google.com/p/psutil/"
license=('custom:New BSD')
depends=('python')
source=("https://psutil.googlecode.com/files/psutil-$pkgver.tar.gz")
sha256sums=('f051d2f965bcf63067c45449ab128b26e01587f0bc68e4141c355d28a55c71ee')

package() {
  cd "$srcdir/psutil-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
