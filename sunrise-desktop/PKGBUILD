# Contributor: phoenixreads @ gmail.com

pkgname=sunrise-desktop
pkgver=0.42j
pkgrel=1
pkgdesc="Sunrise converts websites and newsfeeds for offline reading on your Palm handheld. (uses plucker)"
url="http://sourceforge.net/projects/sunrisexp/"
license=("GPL")
arch=('i686')
depends=("plucker" "jre" "libxtst" "gtk2")
source=("http://downloads.sourceforge.net/sunrisexp/sunrise-${pkgver}-linux.tar.gz")
md5sums=('275089f6444c74ef8cc7d197055a7dda')

build() {
  #no build just install
  mkdir -p $pkgdir/opt/sunrise-desktop
  cp -r $srcdir/sunrise-$pkgver/* $pkgdir/opt/sunrise-desktop

  # make starting script executable
  chmod +x $pkgdir/opt/sunrise-desktop/sunrise-desktop.sh

  # create a start-up script
  mkdir -p $pkgdir/usr/bin
  echo "#!/bin/bash" >> $pkgdir/usr/bin/sunrise-desktop
  echo "cd /opt/sunrise-desktop" >> $pkgdir/usr/bin/sunrise-desktop
  echo "sh ./sunrise-desktop.sh" >> $pkgdir/usr/bin/sunrise-desktop
  chmod +x $pkgdir/usr/bin/sunrise-desktop
}
