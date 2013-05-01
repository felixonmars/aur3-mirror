# Contributor: Corrado Primier <ilbardo@gmail.com>

_pkgname=wammu
pkgname=wammu-git
pkgver=0.36.1343.g9b33971
pkgrel=1
pkgdesc="A wxPython-based GUI for Gammu (development version)"
arch=('i686' 'x86_64')
url="http://wammu.eu/"
license=('GPLv2')
depends=('gammu-git' 'notification-daemon' 'wxpython')
optdepends=('gnome-bluetooth: bluetooth support'
            'pybluez: bluetooth support')
conflicts=('wammu')
provides=('wammu')
source=('git://github.com/gammu/wammu.git')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe --always | sed -e 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root=${pkgdir}
} 
