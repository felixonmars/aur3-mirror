# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
pkgname=bin32-wingide
_pkgsourcename=${pkgname/bin32-/}
pkgver=3.1.8
pkgrel=1
pkgdesc="Wing IDE is the most advanced Python IDE available today. (full edition - 30 days trial)"
url="http://www.wingware.com"
license=("custom")
arch=("x86_64")
source=(http://wingware.com/pub/$_pkgsourcename/$pkgver/$_pkgsourcename-$pkgver-$pkgrel-i386-linux.tar.gz $_pkgsourcename.desktop $_pkgsourcename)
options=(!strip)
md5sums=('7e8184288e2e0a8a2ee046991c86aec3' '9b54e2824d79a5ce0823a525a9863790' '92ff66a2b6a7c98de603e50e4499e21b')

build() 
{
  cd $srcdir/$_pkgsourcename-$pkgver-$pkgrel-i386-linux
  install -d $pkgdir/opt/$_pkgsourcename $pkgdir/usr/bin \
             $pkgdir/usr/share/applications $pkgdir/usr/share/pixmaps
  tar -xC $pkgdir/opt/$_pkgsourcename -f binary-package-$pkgver-$pkgrel.tar
  sed -e "s/^DIR=.*$/DIR=\/opt\/$_pkgsourcename/g" -i $pkgdir/opt/$_pkgsourcename/wing
  install -m644 $srcdir/$_pkgsourcename.desktop $pkgdir/usr/share/applications/
  install -m755 $srcdir/$_pkgsourcename $pkgdir/usr/bin/$_pkgsourcename
  #ln -s /opt/$pkgname/wing $pkgdir/usr/bin/$_pkgsourcename
  ln -s /opt/$_pkgsourcename/resources/wing128.png $pkgdir/usr/share/pixmaps/$_pkgsourcename.png
}
# vim:syntax=sh
