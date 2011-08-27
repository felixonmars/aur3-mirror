# Contributor: Nassim Kacha <nassim.kacha@gmail.com> 
pkgname=monajat
pkgver=2.3.1
pkgrel=1
pkgdesc="A small application that popups Islamic prayers (azkar) every predetermind time"
arch=('i686' 'x86_64')
url="http://launchpad.net/monajat"
license=('GPL2')
depends=('sqlite3' 'python' 'pyxdg' 'dbus-python' 'pygtk' 'pycairo' 'python-notify')
source=(http://launchpad.net/monajat/trunk/beta/+download/$pkgname-$pkgver.tar.gz)
md5sums=('3da25d5b67560649a68045c8989e3671')

build() {
  mkdir $pkgdir/usr
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
} 