# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname="python2-cppheaderparser"
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="C and CPP headers parse in python"
arch=('any')
url="http://pypi.python.org/pypi/CppHeaderParser/"
license=('unknown')
groups=()
depends=('python2' 'python2-ply')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/C/CppHeaderParser/CppHeaderParser-$pkgver.tar.gz")
md5sums=('9484d35b806802ebde171f1023585fe5')

build() {
  cd "$srcdir/CppHeaderParser-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
