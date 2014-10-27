# Maintainer: Eduardo Parra Mazuecos <soker.portalubuntu at gmail dot com>

_appname_=netbeans
pkgname=${_appname_}-javase-es
pkgver=8.0.1
_pkgbuild_=201409082112
pkgrel=1
pkgdesc="Oracle's Java (SE) IDE in Spanish"
arch=("any")
url="http://netbeans.org"
license=("CDDL")
depends=("java-environment" "libxtst" "giflib" "atk")
conflicts=("${_appname_}")
install=${pkgname}.install
options=(!strip)
source=(http://bits.${_appname_}.org/${_appname_}/${pkgver}/community/zip/${_appname_}-${pkgver}-${_pkgbuild_}-javase.zip ${_appname_}.desktop)

prepare() {
	cd "${srcdir}"

	# Config
	sed -i "s|#netbeans_jdkhome=\"/path/to/jdk\"|netbeans_jdkhome=\"/usr/lib/jvm/default\"|g" ${_appname_}/etc/${_appname_}.conf
}

package() {
	cd "${srcdir}"

	# Removals
	rm ${_appname_}/bin/${_appname_}.exe

	# Directories
	install -d "${pkgdir}"/usr/share/${_appname_} "${pkgdir}"/usr/bin

	# Files
	cp -r ${_appname_}/* "${pkgdir}"/usr/share/${_appname_}/
	ln -s /usr/share/${_appname_}/bin/${_appname_} "${pkgdir}"/usr/bin/${_appname_}

	# Desktop
	install -D -m644 "${startdir}"/${_appname_}.desktop "${pkgdir}"/usr/share/applications/${_appname_}.desktop
}

sha1sums=('7b8efa74485d702621c4398ff5d2fb01d8610a58'
          '6d0c6259d693a345f2f7fd48153ccebe6836c084')
