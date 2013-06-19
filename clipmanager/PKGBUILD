# Maintainer: Scott Werner <scott.werner.vt@gmail.com>

pkgname=clipmanager
pkgver=0.3
pkgrel=0
pkgdesc="Manage the system's clipboard history."
url="https://bitbucket.org/mercnet/clipmanager"
arch=('any')
license=('BSD')
depends=('python2'
		 'python2-distribute'
		 'python2-pyside'
		 'python2-keybinder2')
optdepends=('xdotool: paste to active window')
install=$pkgname.install
source=("https://bitbucket.org/mercnet/clipmanager/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('d181dd0fcdb1e6996a2952de0c47c451')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: