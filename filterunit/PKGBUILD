# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=filterunit
pkgver=0.3.1
pkgrel=1
pkgdesc="Allows unit tests to be devised for command line programs"
arch=('i686' 'x86_64')
url="http://www.merten-home.de/FreeSoftware/filterunit/"
license=('GPL2')
depends=('perl')
source=(http://www.merten-home.de/FreeSoftware/filterunit/filterunit)
md5sums=('feb64ff645f9ba4814f236ab4df5d04a') 

build() {
  cd $srcdir/
  
  install -d $pkgdir/usr/bin
  install -m755 filterunit $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
