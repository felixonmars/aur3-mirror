# Contributor: Filippo Squillace <sqoox85@gmail.com>

pkgname=synchrorep
pkgver=1.5.4
pkgrel=1
pkgdesc="Synchrorep is a one click directory synchronization software. All modification will be reported to one to the other and vice versa."
arch=(any)
url="http://sourceforge.net/projects/synchrorep/"
license=('GPLv3')
depends=('sqlite3' 'zenity' 'nautilus' 'libnautilus-extension' 'gdk-pixbuf2')
provides=()
options=('strip')
source=(http://www.iceberg-linux.net/all_packages/${pkgname}-${pkgver}-sources.tar.gz
newMakefile)
md5sums=('c9eacf8bbd0eafb8a1876fa9658a566c'
         'c429878c05e0cbc27836c95a970b64a3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #cp ../../newMakefile Makefile
  make
  #make package
  #cp -fr $pkgname-package/usr $pkgdir
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
