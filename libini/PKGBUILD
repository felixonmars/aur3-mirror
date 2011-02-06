# Contributor: Lukas Marsik <lukas dot marsik at gmail dot com>

pkgname=libini
pkgver=1.1.10
pkgrel=1
pkgdesc="An INI file parser that can read, edit and create large INI files." 
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libini/"
license=('GPL')
depends=('tcl')
install=
source=(http://downloads.sourceforge.net/project/libini/libini/libini-1.1.10/libini-1.1.10-2.tgz)
md5sums=('1c44ed709ce8a2a650a6d08b6400cb8e')

build() {

  # Configure
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=$pkgdir/usr || return 1

  # Make && install
  make || return 1
  make install || return 1

}
