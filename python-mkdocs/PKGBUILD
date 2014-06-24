# Maintainer: Richard Stromer <noxan@byteweaver.org>

pkgname=python-mkdocs
_pkgname=mkdocs
pkgver=0.9
pkgrel=1
pkgdesc='Project documentation with Markdown'
url="http://www.mkdocs.org"
license=('BSD')
arch=('any')
depends=('python2' 'python2-markdown' 'python2-jinja' 'python2-yaml' 'python2-watchdog-git')
optdepends=()
makedepends=('python2-setuptools')
provides=('python-mkdocs')
conflicts=()

source=("http://pypi.python.org/packages/source/m/mkdocs/mkdocs-$pkgver.tar.gz")
md5sums=('1b785dd2866b86c2e5fe7c2d6142a22a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  #install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
