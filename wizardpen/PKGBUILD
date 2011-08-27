
# Contributor: Zerathidune <zerathidune@gmail.com>
pkgname=wizardpen
pkgver=0.7.0alpha2
pkgrel=2
pkgdesc="Xorg driver for Genius tablets"
arch=('i686' 'x86_64')
url="http://code.google.com/p/linuxgenius"
license=('GPL')
conflicts=(wizardpen-driver)
replaces=(wizardpen-driver)
source=(http://linuxgenius.googlecode.com/files/$pkgname-0.7.0-alpha2.tar.gz
	99-geniuspen.fdi
	patch0)
md5sums=('4059f83512dabc350c0f6ad9b266c6fb'
         '5b6b4566c41821eb6d24f7a233b39cb2'
         'f10fb0185eb58870a62c8fe7bca47fc1')

build() {
  patch -p0 -i ./patch0  
  cd "$srcdir/$pkgname-0.7.0-alpha2"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
  
  cd calibrate
  rm wizardpen-calibrate
  make || return 1
  install -d $pkgdir/usr/bin
  install -m 755 wizardpen-calibrate $pkgdir/usr/bin/

  cd $srcdir
  install -d $pkgdir/usr/share/hal/fdi/policy/10osvendor
  install -m 644 99-geniuspen.fdi $pkgdir/usr/share/hal/fdi/policy/10osvendor/
}


