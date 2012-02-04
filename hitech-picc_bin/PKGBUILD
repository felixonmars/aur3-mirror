# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname=hitech-picc_bin
_pkgver=9.83
pkgver=$_pkgver.10920
pkgrel=2
pkgdesc="C compiler for PIC10/12/16 MCUs"
arch=(i686 x86_64)
url='http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en542849'
license=(custom)
[ $CARCH = x86_64 ] && depends=(lib32-glibc)
provides=(hitech-picc)
conflicts=(hitech-picc)
options=(!strip docs libtool emptydirs !zipman)
install=hitech-picc_bin.install
instdir=/opt/hitech/picc/$_pkgver
installer=picc-$_pkgver-linux.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/picc-$_pkgver-linux.zip)
md5sums=(a7bbd474955d2ff9e9f26495abc61b95)

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
