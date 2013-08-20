pkgname=visualvm
pkgver=1.3.6
pkgrel=2
pkgdesc="A Java VM monitoring and troubleshooting tool"
arch=('i686' 'x86_64')
url="https://visualvm.dev.java.net/"
license=('custom')
depends=('java-environment' 'bash')
if test "$CARCH" == x86_64; then
	depends+=(lib32-glibc)
fi
source=('https://java.net/projects/visualvm/downloads/download/release136/visualvm_136.zip' 'visualvm' 'icon-faenza.png' 'visualvm.desktop')
md5sums=('fa04577978caf1926345d1f800846cbd' '6d167083b77af02344638e811695ce63' '3fd120fc2dbedeb33c749ff88a531dd0' '7a2e65ed2005ea3fa7b10b5ea03fdd2c')
#options=(!strip)

package() {
	mkdir "${pkgdir}/opt"
	mv visualvm_136 "${pkgdir}/opt/visualvm"

	rm "${pkgdir}/opt/visualvm/bin/"*.exe
	rm "${pkgdir}/opt/visualvm/platform/lib/"nbexec{,64}.{dll,exe}
	rm "${pkgdir}/opt/visualvm/platform/modules/lib/"{x86,amd64}/jnidispatch-340.dll
	rm -rf "${pkgdir}/opt/visualvm/profiler/lib/deployed/"jdk1{5,6}/{hpux*,mac,solaris*,windows*,linux-arm*}

	install -Dm644 "${pkgdir}/opt/visualvm/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm755 "${srcdir}/visualvm" "${pkgdir}/usr/bin/visualvm"
	install -Dm644 "${srcdir}/icon-faenza.png" "${pkgdir}/opt/visualvm/bin/icon.png"
	install -Dm644 "${srcdir}/visualvm.desktop" "${pkgdir}/usr/share/applications/visualvm.desktop"
}
