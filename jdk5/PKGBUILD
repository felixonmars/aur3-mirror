# Maintainer: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Previous Maintainer: Jason Chu <jason@archlinux.org>
pkgname=jdk5
pkgver=5.0u22
pkgrel=1
pkgdesc="Sun's Java Development Kit"
arch=('i686' 'x86_64')
  [ "${CARCH}" = "i686" ]   && ARCH=i586
  [ "${CARCH}" = "x86_64" ] && ARCH=amd64
url="http://java.sun.com"
depends=('glibc' 'jre5')
install="jdk.install"
source=(http://download.java.net/dlj/binaries/jdk-${pkgver}-dlj-linux-${ARCH}.bin
        https://jdk-distros.dev.java.net/source/browse/*checkout*/jdk-distros/trunk/utils/construct.sh
	jdk.profile)
[ "$CARCH" = "i686" ]   && md5sums=('38ebeb49b85668b56305409db2e2eb6a'
			            '94065b612df0046d9ae758943f9f6a75'
				    '7aaac9ec3e440b92361c6561ac00424a')
[ "$CARCH" = "x86_64" ] && md5sums=('d70398b2d6c1bd764330b7a3276c1e41'
			            '94065b612df0046d9ae758943f9f6a75'
	          		    '7aaac9ec3e440b92361c6561ac00424a')
license=('custom')

build() {
  cd $srcdir

  mkdir unbundle-jdk
  cd unbundle-jdk
  
  sh ../jdk-${pkgver}-dlj-linux-${ARCH}.bin --accept-license

  cd ..

  sh construct.sh unbundle-jdk linux-jdk linux-jre

  #copy icon
  install -Dm644 $srcdir/linux-jdk/jre/lib/desktop/icons/hicolor/48x48/apps/sun-java.png $pkgdir/usr/share/pixmaps/java5.png

  rm -rf linux-jdk/jre

  mkdir -p $pkgdir/opt
  mv linux-jdk $pkgdir/opt/java5

  install -D -m755 $srcdir/jdk.profile $pkgdir/etc/profile.d/${pkgname}.sh

  mkdir -p $pkgdir/usr/share/licenses/jdk5
  cp $pkgdir/opt/java5/COPYRIGHT $pkgdir/usr/share/licenses/jdk5
  cp $pkgdir/opt/java5/LICENSE $pkgdir/usr/share/licenses/jdk5
  cp $pkgdir/opt/java5/THIRDPARTYLICENSEREADME.txt $pkgdir/usr/share/licenses/jdk5

  #desktop entries
  install -Dm644 $startdir/java-control-panel.desktop ${pkgdir}/usr/share/applications/java5-control-panel.desktop
  install -Dm644 $startdir/java-monitoring-and-management-console.desktop  ${pkgdir}/usr/share/applications/java5-monitoring-and-management-console.desktop
  install -Dm644 $startdir/java-policy-settings.desktop ${pkgdir}/usr/share/applications/java5-policy-settings.desktop
  install -Dm644 $startdir/java-visualvm.desktop ${pkgdir}/usr/share/applications/java5-visualvm.desktop
  install -Dm644 $startdir/java-web-start.desktop ${pkgdir}/usr/share/applications/java5-web-start.desktop
}
#  jdk-5.0u22-dlj-linux-amd64.bin
