# Maintainer: devlin zed <me@devlinzed.com>
pkgname=python-hy
pkgver=0.10.1
pkgrel=1
pkgdesc="Hy is a Python <--> Lisp layer. It helps make things work nicer, and lets Python and the Hy lisp variant play nice together."
arch=(any)
url="http://hylang.org"
license=('MIT')
groups=()
depends=('python' 'python-astor-git' 'python-rply-git')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/source/h/hy/hy-0.10.1.tar.gz')
md5sums=('4f8e3ffb0da28526529b019bdba9e650')

package() {
  cd "$srcdir/hy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
