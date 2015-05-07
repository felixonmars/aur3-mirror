# Maintainer: Adam Howard <aeh@aehdev.net>
pkgname=python-pyautogui
_pypiname=PyAutoGUI
pkgver=0.9.26
pkgrel=1
pkgdesc="A cross-platform module for GUI automation for human beings"
arch=(any)
url="https://pypi.python.org/pypi/$_pypiname/"
license=('BSD')
depends=('python' 'python-pillow' 'python-xlib')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/P/$_pypiname/$_pypiname-$pkgver.zip"
        "https://raw.githubusercontent.com/asweigart/pyautogui/master/LICENSE.txt")
sha256sums=('845b790fea75e209ed53645c55f442ea252ef5f42d65594e36315e68a205a059'
            '48f16390e9d5559e2aaacfe3a009666af686187bea7175a4503201da942331ac')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
