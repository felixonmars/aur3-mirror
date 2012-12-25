# Maintainer: Pavle Simovic <xpio at tesla.rcub.bg.ac dot rs>

pkgname=footbrawl
pkgver=1.0
pkgrel=3
pkgdesc="Footbrawl Quest is a turn based football game featuring the Knights vs the Undead."
url="http://forums.tigsource.com/index.php?topic=29644.0"
arch=('i686' 'x86_64')
license=('unknown')
depends=('java-runtime')
makedepends=('gendesk')
changelog=ChangeLog
source=($pkgname-$pkgver.zip::https://dl.dropbox.com/s/958sry0iz2qesse/$pkgname-$pkgver.zip?dl=1
	$pkgname.sh)
md5sums=('e859eff35fbc6432c9fa5046a5b5b806'
         '63574a5161e2ddca300460b13fd7862d')
_name='Footbrawl Quest'

build() {
  # Generate desktop file
  cd "$srcdir"
  gendesk -n
}

package() {
  cd "$srcdir/$pkgname"
  # Copy desktop file and icon
  install -D -m 644 ../footbrawl.desktop $pkgdir/usr/share/applications/footbrawl.desktop
  install -D -m 644 res/images/appIcon32x32.png $pkgdir/usr/share/pixmaps/footbrawl.png
  # Cleanup, then move jar and resources to /usr/share
  rm -rf lib/natives-{macosx,windows}
  if test "$CARCH" == x86_64; then
    rm -rf lib/natives-linux/lib*{x,l}.so
  else # Important for stripping
    rm -rf lib/natives-linux/lib*64.so
  fi
  install -d $pkgdir/usr/share/$pkgname
  mv *.jar lib res $pkgdir/usr/share/$pkgname
  # Copy run script
  install -D $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  # Copy licenses
  install -d $pkgdir/usr/share/licenses/$pkgname
  mv *.txt $pkgdir/usr/share/licenses/$pkgname
}
