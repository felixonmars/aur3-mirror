# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname=hitech-picc-18_bin
_pkgver=9.80
pkgver=$_pkgver.11162
pkgrel=2
pkgdesc="C compiler for PIC18 MCUs"
arch=(i686 x86_64)
url='http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en542861'
license=(custom)
[ $CARCH = x86_64 ] && depends=(lib32-glibc)
provides=(hitech-picc-18)
conflicts=(hitech-picc-18)
options=(!strip docs libtool emptydirs !zipman)
install=hitech-picc-18_bin.install
instdir=/opt/hitech/picc-18/$_pkgver
installer=picc-18-$pkgver-linux.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/PICC_18_9_80_linux_run.zip)
md5sums=(14cf496aad9b1ca1b581dce01fc46013)

package() {
  echo -e "Creating the Package\n  Please wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  $srcdir/$installer --noexec --nox11 --target $pkgdir$instdir &> /dev/null

  rm $pkgdir$instdir/{reactivate.template,shell-install}
  rm $pkgdir$instdir/bin/{activate,activate.dat}

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}