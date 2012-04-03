# Maintener: Deather <deather.jeuxlinux@gmail.com>

pkgname=jtomtom
pkgver=1.1
pkgrel=1
pkgdesc="Application permettant de mettre les GPSQuickFix et POIs des radars de votre TomTom."
arch=('i686' 'x86_64')
url="http://jtomtom.sourceforge.net/"
license=('GPLv3' )
depends=('java-runtime')
source=("http://sourceforge.net/projects/jtomtom/files/jTomtom.jar" "${pkgname}")
md5sums=('e77c4d8da608270ca55052f053a663e4' '18158733a22cd93b6f0c9efbd3d84404')

_install_dir="${pkgdir}/usr/share/java/${pkgname}"
_bin_dir="${pkgdir}/usr/bin"

build(){

	mkdir -p "${_bin_dir}"
	mkdir -p "${_install_dir}"

	cp "jTomtom.jar" "${_install_dir}"
	cp "${pkgname}" "${_install_dir}"
}

package(){

	install -Dm755 "${_install_dir}/${pkgname}" "${_bin_dir}/${pkgname}"
}
