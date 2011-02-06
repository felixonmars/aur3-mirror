# Maintainer palbo <palbof@gmail.com>
pkgname=gscrobbler
pkgver=0.1.4
pkgrel=1
pkgdesc="Yet another iPod scrobbling app written with Linux in mind"
arch=('i686' 'x86_64')
url="http://m0n5t3r.info/work/gscrobbler"
license=('GPL')
depends=('python' 'python-configobj' 'pygtk' 'hal' 'dbus-python' 'python-notify' 'setuptools')
source=(http://m0n5t3r.info/stuff/gscrobbler/gScrobbler-$pkgver.tar.bz2)
md5sums=('8512e3a6a97e56b4dba14dd334a6def6')

build() {
  cd $srcdir/gScrobbler-$pkgver
  mkdir -p $pkgdir/usr/share/locale/ro/LC_MESSAGES
  python setup.py install --root=$startdir/pkg || return 1
}
