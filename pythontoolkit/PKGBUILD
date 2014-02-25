# Maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>

pkgname=pythontoolkit
pkgver=13.01
pkgrel=1
pkgdesc="PythonToolkit (PTK) is an interactive environment for python"
url="http://pythontoolkit.sourceforge.net/"
license=('MIT')
depends=('python>=2.7' 'wxpython>=2.8')
optdepends=('python2-numpy'
            'python2-matplotlib: python 2D plotting library')
arch=('i686' 'x86_64')
source=("http://sourceforge.net/projects/pythontoolkit/files/Python%20Toolkit/ptk%20v${pkgver}/PythonToolkit-${pkgver}.zip")
options=(!emptydirs)
md5sums=('4870717b89b2c9a1f6d4fcbd1ea4dd3c')

package() {
  cd "$srcdir/PythonToolkit-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
