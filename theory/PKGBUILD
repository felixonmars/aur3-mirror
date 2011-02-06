# Contributor: Kevin Sullivan <ksullivan@archlinux.us>

pkgname=theory
pkgver=0.1.11
pkgrel=1
pkgdesc="A web-based MPD client."
arch=('i686' 'x86_64')
url="http://theory.steelbreeze.org/"
license=('GPL')
depends=('python2')
makedepends=('setuptools')
source=("http://theory.steelbreeze.org/$pkgname-$pkgver.tar.bz2" 
        'run-theory')
md5sums=('8a6b0cdf0d5863d9a9c1d39bd53b6c8f'
         '1e18e39e38f68f46a016c99129fe2a10')

build() {
  # Move files into /opt/
  mkdir -p -m775 $pkgdir/opt/$pkgname/
  cp    -r       $srcdir/$pkgname-$pkgver/* $pkgdir/opt/$pkgname/

  # Install files using built-in packager.
  cd $pkgdir/opt/$pkgname/

  # ...but, first we have to make it use Python 2.x
  sed -i 's/^python/python2/' ./install.sh

     ./install.sh
  rm ./install.sh

  # Change permissions for any-user execution and put in shortcut.
  chmod  755  $pkgdir/opt/$pkgname/run-theory.sh
  mkdir -p    $pkgdir/usr/bin/
  cp          $startdir/run-theory $pkgdir/usr/bin/
  chmod  755  $pkgdir/usr/bin/run-theory

  # Make scripts use /opt/ directory.
  # NOTE: sed commands are pretty ugly, but work.
  cd $pkgdir/opt/$pkgname/env/bin/
  sed -i 's/^\#\!.*$/\#\!\/opt\/theory\/env\/bin\/python/'            ./paster
  sed -i 's/^VIRTUAL_ENV=\".*\"$/VIRTUAL_ENV=\"\/opt\/theory\/env\"/' ./activate
}

# vim:set ts=2 sw=2 et:
