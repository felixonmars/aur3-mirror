# Contributor: Daniele Marinello <m2346zc5-aur@yahoo.it>

pkgname=mobloquer
pkgver=0.6
pkgrel=6
pkgdesc="A graphical front end for moblock"
arch=('i686' 'x86_64')
url="http://mobloquer.foutrelis.com/"
license=('GPL')
depends=('qt' 'blockcontrol')
source=(http://downloads.sourceforge.net/mobloquer/$pkgname-$pkgver.tar.gz)
md5sums=('6363ee4c42da1d85367fdd65d4bf42ca')

build() {
 
  cd $startdir/src/$pkgname-$pkgver
  
  qmake
  make || return 1

  install -d ${pkgdir}/usr/share/applications ${pkgdir}/usr/bin ${pkgdir}/usr/share/pixmaps
  install -m 644 -p $startdir/src/$pkgname-$pkgver/images/mobloquer.png $startdir/pkg/usr/share/pixmaps/
  install -m 644 -p $startdir/src/$pkgname-$pkgver/other/Mobloquer.desktop $startdir/pkg/usr/share/applications/
  install -m 755 -p $startdir/src/$pkgname-$pkgver/mobloquer $startdir/pkg/usr/bin/mobloquer
}

