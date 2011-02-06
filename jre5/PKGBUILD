# $Id: PKGBUILD 9527 2010-01-26 21:43:38Z ibiru $
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=jre5
pkgver=5.0u22
pkgrel=1
pkgdesc="Sun's java runtime environment"
arch=('i686' 'x86_64')
  [ "$CARCH" = "i686" ]   && _arch=i586
  [ "$CARCH" = "x86_64" ] && _arch=amd64
url="http://java.sun.com"
depends=('glibc' 'libxtst')
install="jre.install"
source=(http://download.java.net/dlj/binaries/jdk-$pkgver-dlj-linux-$_arch.bin
        https://jdk-distros.dev.java.net/source/browse/*checkout*/jdk-distros/trunk/utils/construct.sh
        jre.profile)
[ "$CARCH" = "i686" ]   && md5sums=('38ebeb49b85668b56305409db2e2eb6a'
         			    '94065b612df0046d9ae758943f9f6a75'
	          		    '50b4f5ac4129097461d246645d73a622')
[ "$CARCH" = "x86_64" ] && md5sums=('d70398b2d6c1bd764330b7a3276c1e41'
			            '94065b612df0046d9ae758943f9f6a75'
	          		    '50b4f5ac4129097461d246645d73a622')
license=('custom')

build() {
  cd $srcdir

  mkdir unbundle-jdk
  cd unbundle-jdk

  sh ../jdk-$pkgver-dlj-linux-$_arch.bin --accept-license

  cd ..

  sh construct.sh unbundle-jdk linux-jdk linux-jre

  mkdir -p $pkgdir/opt/java5
  mv linux-jdk/jre $pkgdir/opt/java5

  install -D -m755 $srcdir/jre.profile $pkgdir/etc/profile.d/${pkgname}.sh

  mkdir -p $pkgdir/usr/lib/mozilla/plugins

  mkdir -p $pkgdir/usr/share/licenses/jre5
  cp $pkgdir/opt/java5/jre/COPYRIGHT $pkgdir/usr/share/licenses/jre5
  cp $pkgdir/opt/java5/jre/LICENSE $pkgdir/usr/share/licenses/jre5
  cp $pkgdir/opt/java5/jre/THIRDPARTYLICENSEREADME.txt $pkgdir/usr/share/licenses/jre5
}
