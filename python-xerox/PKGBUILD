# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgbase=python-xerox
pkgname=('python-xerox' 'python2-xerox')
pkgdesc="copy paste module for python"
pkgver=0.3.1
pkgrel=1
arch=('any')
url="http://pypi.python.org/pypi/xerox"
license=('custom:MIT')
makedepends=('git' 'python' 'python2')
replaces=()
source=('https://pypi.python.org/packages/source/x/xerox/xerox-0.3.1.tar.gz')
md5sums=('88de18980bd83e41a3c85dc925f5cc90')


prepare() {
  if [ -d "xerox-$pkgver-python2" ]; then
    rm -fR "xerox-$pkgver-python2"
  fi
  cp -r "xerox-$pkgver"{,"-python2"}
}

package_python-xerox() {
  depends=('python' 'xclip')
  pkgdesc="copy paste module for python 3"

  cd "xerox-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-xerox() {
  depends=('python2' 'xclip')
  pkgdesc="copy paste module for python 2"

  cd "xerox-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
