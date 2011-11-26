# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname=hitech-dspicc-bin
_pkgver=9.62
pkgver=$_pkgver.7866
pkgrel=1
pkgdesc="C Compiler for PIC24 MCUs and dsPIC DSCs"
arch=(i686 x86_64)
url='http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en542865'
license=(custom)
[ $CARCH = x86_64 ] && depends=(lib32-glibc)
provides=(hitech-dspicc)
conflicts=(hitech-dspicc)
options=(!strip docs libtool emptydirs !zipman)
install=hitech-dspicc-bin.install
instdir=/opt/hitech/dspicc/std/$_pkgver
installer=dspicc_std_9_62_linux.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/dspicc_std_9_62_linux.zip)
md5sums=(75d81329c2d0bbac39a1153b60175e71)

package() {
  echo -e "Creating Package\n  Please Wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  $srcdir/$installer --noexec --nox11 --target $pkgdir$instdir &> /dev/null

  rm $pkgdir$instdir/shell-install
  rm $pkgdir$instdir/bin/{activate,activate.dat}

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}