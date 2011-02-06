# Contributor : Calimero <calimeroteknik@free.fr>
pkgname=lz11-v2
pkgver=1.2
pkgrel=1
pkgdesc="Lexmark Z11 and Compaq IJ300 printer driver"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lz11/"
license=('GPL')
depends=('foomatic-db')
source=(http://downloads.sourceforge.net/project/lz11/lz11/1.2/lz11-V2-$pkgver.tar.gz)
md5sums=('f2cd2f5baa22d48dc12e531a055dff3c')

build() {
  cd "$srcdir"/lz11-V2-$pkgver
 # driver
  make || return 1
  install -D -c -m 755 cZ11-V2 $pkgdir/usr/bin/cZ11-V2
 # bash wrappers
  install -c -m 755 cZ11 $pkgdir/usr/bin/cZ11
  install -c -m 755 lz11.{adjust,foomatic} $pkgdir/usr/bin/
 # utils
  install -c -m 755 lz11.{kill,stop,stopjobs,testpage} $pkgdir/usr/bin/
 # task files
  mkdir -p $pkgdir/usr/share/foomatic/db/source/opt
  cp $srcdir/lz11-V2-$pkgver/foomatic/opt/* $pkgdir/usr/share/foomatic/db/source/opt/
 # ppd files
  mkdir -p $pkgdir/usr/share/cups/model/lz11-ppd/
  cp {Lexmark-Z11-lz11-V2.ppd,Compaq-IJ300-lz11-V2.ppd} $pkgdir/usr/share/cups/model/lz11-ppd/
}
