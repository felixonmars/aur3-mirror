# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname=hitech-picc32-bin
_pkgver=9.61
pkgver=$_pkgver.7112
pkgrel=1
pkgdesc="C compiler for PIC32 MCUs"
arch=(i686 x86_64)
url='http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en542866'
license=(custom)
[ $CARCH = x86_64 ] && depends=(lib32-glibc)
provides=(hitech-picc32)
conflicts=(hitech-picc32)
options=(!strip docs libtool emptydirs !zipman)
install=hitech-picc32-bin.install
instdir=/opt/hitech/picc32/pro/$_pkgver
installer=picc32-pro_$pkgver-linux.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/picc32_pro_9_61_linux_run.zip)
md5sums=(711de8c0e8070d01cf3a08484bc0c951)

package() {
  echo -e "Creating Package\n  Please Wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  $srcdir/$installer --noexec --nox11 --target $pkgdir$instdir &> /dev/null

  rm $pkgdir$instdir/{reactivate.template,shell-install}
  rm $pkgdir$instdir/bin/{activate,activate.dat}

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
