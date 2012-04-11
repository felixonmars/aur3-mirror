# Maintainer: GERGE
pkgname=opera-snapshot # Set to opera if you want to install as your main/stable build
_bigrelease=12.00
_buildver=1359
_rclevel=1
pkgver=${_bigrelease}.${_buildver}
pkgrel=1
pkgdesc="Bleeding-edge Opera Web Browser builds"
url="http://my.opera.com/desktopteam/blog/"
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext')
optdepends=('flashplugin: Flash support'
	    'openjdk6: Java support'
	    'gstreamer0.10-plugins: HTML5 support')
install=opera-snapshot.install
options=(!strip !zipman)
license=('custom:opera')
arch=('i686' 'x86_64')
_arch=i386
[ "$CARCH" = "x86_64" ] && _arch=x86_64
source=(http://snapshot.opera.com/unix/cpu_${_bigrelease}-${_buildver}/opera-next-${_bigrelease}-${_buildver}.${_arch}.linux.tar.xz)
md5sums=('3147c3a9fe84fa5dfdf76352030f42eb') 
[ "$CARCH" = "x86_64" ] && md5sums=('1dc14d5ba7b8ac20de6bbd06c5151a4d')

# Comment the following line, if you do not want your User Agent to include Arch Linux.
_opdistro="Arch Linux"
 
package() {

	# 'Install' Opera into $pkgdir
	opera-next-${_bigrelease}-${_buildver}.${_arch}.linux/install --prefix /usr --name ${pkgname} --repackage "${pkgdir}/usr"
	install -D -m 644 "${pkgdir}/usr/share/${pkgname}/defaults/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	# Insert an Arch User Agent string if set
	if [ -n "${_opdistro}" ]
	then
		mkdir -p "${pkgdir}/usr/share/${pkgname}/custom/defaults"
		echo "[ISP]" > "${pkgdir}/usr/share/${pkgname}/custom/defaults/operaprefs.ini"
		echo "Id=${_opdistro}" >> "${pkgdir}/usr/share/${pkgname}/custom/defaults/operaprefs.ini"
		chmod 644 "${pkgdir}/usr/share/${pkgname}/custom/defaults/operaprefs.ini"
	fi
}
