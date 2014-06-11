# Maintainer: biloucat
# Contributor: flying-sheep
pkgname=python2-pyjnius-git
pkgver=1.0.3.r107.ga45ba17
pkgrel=1
pkgdesc="Python module to access Java class as Python class, using JNI."
arch=('i686' 'x86_64')
url="https://github.com/kivy/pyjnius"
license=('MIT')
depends=('java-environment' 'python2')
makedepends=('cython2' 'git')
conflicts=('python2-pyjnius')
provides=('python2-pyjnius')
source=("$pkgname"::'git://github.com/kivy/pyjnius')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
	python2 setup.py build_ext --inplace -f
	python2 setup.py build

}

package() {
  cd "$srcdir/$pkgname"
	python2 setup.py install --prefix="$pkgdir/usr"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
