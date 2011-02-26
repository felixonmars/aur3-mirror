# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=pymt
pkgver=0.5.1
pkgrel=2
pkgdesc="An open source library for developing multi-touch applications"
arch=(i686 x86_64)
url="http://pymt.eu/"
license=('GPL')
depends=('python-opengl' 'python-pygame' 'python-imaging'
         'gstreamer0.10-python' 'cython' 'mtdev')
conflicts=('pymt-git')
source=("https://github.com/tito/$pkgname/tarball/$pkgver")
md5sums=('58f410fc4410e0ca46fce49697626ba0')

build() {
  cd "$srcdir/tito-$pkgname-90ded4b"

  export PYTHON="python2"

  # Python2 fix
  sed -e "s_\(env python\).*_\12_" \
      -e "s_\(bin/python\).*_\12_" \
      -i `grep -Erl "(env python|bin/python)" .`

  # Build Fix
  sed -i "111 s_\$_ 'css',_" setup.py

  # Cython fix
  sed -i "s|\(self._indices = \)'|\1<bytes>'|" pymt/c_ext/c_graphics.pyx

  python2 setup.py build
}

package() {
  cd "$srcdir/tito-$pkgname-90ded4b"

  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
