#	Hi! I'm Xianwen Chen.
#	I'm currently maintaining the PKGBUILD file for 'Sun Java Wireless Toolkit for CLDC'.
#	Comments are highly welcomed.
#	My email is 'xianwen.chen at gmail dot com'.

# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=sun-wtk
pkgver="2.5.2_01"
pkgrel=1
pkgdesc="A Sun's tool kit for developing 'applications that are based on J2ME's Connected Limited Device Configuration (CLDC) and Mobile Information Device Profile (MIDP), and designed to run on cell phones, mainstream personal digital assistants, and other small mobile devices.' (http://www.oracle.com/technetwork/java/index-jsp-137162.html). It includes ktoolbar and was formerly known as J2ME."
license=('custom')
url='http://www.oracle.com/technetwork/java/index-jsp-137162.html'
depends=('libxt' 'bash' 'gcc-libs' 'jdk')
[ "$CARCH" = "x86_64" ] && \
  depends=('bin32-jre' ${depends[@]}) || \
  depends=('java-environment' 'java-runtime' ${depends[@]})
makedepends=('zip' 'unzip')
arch=('i686' 'x86_64')
provides=('j2me')
install=sun-wtk.install
source=("http://devio.us/~chen/files/sun-wtk/sun_java_wireless_toolkit-${pkgver}-linuxi486.bin.sh"
  'sun-wtk.profile'
  'ktoolbar.desktop'
  'ktoolbar.png'
  'LICENSE')

md5sums=('6b70b6e6d426eac121db8a087991589f'
         'ad05a8ccc053a4a1658317ac4df89a32'
         'ca7f128a0dd314cf28e2c7980b8b5cb8'
         '7b4b9c9da994f208dbd4c5dcdbd78926'
         '2297fdc5771ae9d0e8e9fc11d28b4728')

build() {
  install -d "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/sun-wtk.profile" "${pkgdir}/etc/profile.d/sun-wtk.sh"

  install -d "${pkgdir}/opt/wtk"
  zip -F -q ${srcdir}/sun_java_wireless_toolkit-2.5.2_01-linuxi486.bin.sh --out ${srcdir}/sun_java_wireless_toolkit-2.5.2_01-linuxi486.bin.zip

  unzip -o -q "${srcdir}/sun_java_wireless_toolkit-${pkgver}-linuxi486.bin.zip" -d "${pkgdir}/opt/wtk"
  find "${pkgdir}/opt/wtk/" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/wtk/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/opt/wtk/bin/" -type f -exec chmod 755 {} \;
  cd "${pkgdir}/opt/wtk/bin"

  [ "$CARCH" = "x86_64" ] && \
    sed -i 's/javapathtowtk=//g;s#${javapathtowtk}#/opt/bin32-jre/jre/bin/#g' \
      emulator || \
    sed -i 's/javapathtowtk=//g;s#${javapathtowtk}#${JAVA_HOME}/bin/#g' \
      defaultdevice emulator ktoolbar mekeytool prefs utils wscompile

  install -D -m644 "${srcdir}/ktoolbar.desktop" "${pkgdir}/usr/share/applications/ktoolbar.desktop"
  install -D -m644 "${srcdir}/ktoolbar.png" "${pkgdir}/usr/share/pixmaps/ktoolbar.png"

  cd ${srcdir}
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
