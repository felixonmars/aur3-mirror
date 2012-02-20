# Maintainer: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabc30_bin
pkgver=3.30c
pkgrel=5
pkgdesc="C compiler for PIC24 MCUs and dsPIC DSCs"
arch=(i686 x86_64)
url='http://www.microchip.com/stellent/idcplg?IdcService=SS_GET_PAGE&nodeId=1406&dDocName=en010065'
license=(custom)
[ $CARCH = x86_64 ] && depends=(lib32-glibc)
makedepends=(patchelf)
provides=(mplabc30)
conflicts=(mplabc30)
options=(!strip docs libtool emptydirs !zipman)
install=microchip-mplabc30_bin.install
instdir=/opt/microchip/mplabc30/v$pkgver
installer=mplabc30-v$pkgver-linux-installer.run
source=(http://ww1.microchip.com/downloads/mplab/X/$installer
        http://schlunix.org/archlinux/core/os/i686/glibc-2.14.1-4-i686.pkg.tar.xz)
md5sums=(f50954d415a7bef3abf190d9c4f8f6e2
         771053502502cf88d97a1380b47191c7)

package() {
  echo -e "Creating the Package\n  Please wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\ny\n$pkgdir$instdir\ny\n" > inst_input
  $srcdir/$installer --edition lite --mode text < inst_input &> /dev/null
  rm inst_input

  rm $pkgdir$instdir/Uninstall*

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  mkdir -p $pkgdir$instdir/glibc2.14.1
  mv $srcdir/lib/* $pkgdir$instdir/glibc2.14.1
  find $pkgdir$instdir/bin -type f -executable -exec patchelf --set-rpath $instdir/glibc2.14.1 '{}' \;
}
