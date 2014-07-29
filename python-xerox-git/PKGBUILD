# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgbase=python-xerox-git
pkgname=('python-xerox-git' 'python2-xerox-git')
  pkgdesc="copy paste module for python"
pkgver=v0.2.1.r33.gd8aa2cb
pkgrel=1
arch=('any')
url="http://pypi.python.org/pypi/xerox"
license=('custom:MIT')
makedepends=('git' 'python' 'python2')
replaces=()
source=('git+https://github.com/kennethreitz/xerox.git')
md5sums=('SKIP')


pkgver() {
  cd xerox
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  if [ -d xerox-python2 ]; then
    rm -fR xerox-python2
  fi
  git clone xerox xerox-python2
}

package_python-xerox-git() {
  depends=('python' 'xclip')
  pkgdesc="copy paste module for python 3"
  provides=('python-xerox')
  conflicts=('python-xerox')

  cd xerox
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-xerox-git() {
  depends=('python2' 'xclip')
  pkgdesc="copy paste module for python 2"
  provides=('python2-xerox')
  conflicts=('python2-xerox')

  cd xerox-python2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
