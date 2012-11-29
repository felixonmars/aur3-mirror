# Maintainer DerFlob <derflob at derflob dot de>

pkgname=multiwinia-demo
_pkgname=multiwinia
pkgver=1.3.1
pkgrel=2
pkgdesc="Battle to save Darwinias innocent inhabitants, the Darwinians, from an evil viral infection (includes full game client when activated with key)"
arch=('i686' 'x86_64')
url="http://www.introversion.co.uk/multiwinia/"
license=('custom')
depends=('mesa' 'openal' 'sdl' 'libvorbis' 'libpng12')
conflicts=('multiwinia')
source=("http://www.introversion.co.uk/multiwinia/downloads/Multiwinia-1.3.1-linux/${_pkgname}_${pkgver}-1_i386.deb" 'multiwinia.desktop')
md5sums=('471e72e48dbcf8370497ebd3ddf61e39' '8132259414180ad994c27cd2770ffc67')

_carch=i386
if [ "${CARCH}" = "x86_64" ]; then
    source=("http://www.introversion.co.uk/multiwinia/downloads/Multiwinia-1.3.1-linux/${_pkgname}_${pkgver}-1_amd64.deb" 'multiwinia.desktop')
    md5sums=('643475ef497abb3d3c49af2c43ff6d2f' '8132259414180ad994c27cd2770ffc67')
	_carch=amd64
fi

package() {
	#install game files to /opt/multiwinia
	install -d "${pkgdir}/opt/"
	tar -xzv --strip-components=4 -f "${srcdir}/data.tar.gz" -C "${pkgdir}"/opt/ './usr/local/games/'

	install -d "${pkgdir}/usr/share/pixmaps/"
	install -D -m644 "${pkgdir}/opt/multiwinia/multiwinia.png" "${pkgdir}/usr/share/pixmaps/"

	install -d "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/multiwinia.desktop" "${pkgdir}/usr/share/applications/"

	install -d "${pkgdir}/usr/bin/"
	if [ "${CARCH}" = "x86_64" ]; then
		ln -s /opt/multiwinia/multiwinia.bin.x86_64 "${pkgdir}/usr/bin/multiwinia"
		rm -rf "${pkgdir}/opt/multiwinia/lib64"
	else
		ln -s /opt/multiwinia/multiwinia.bin.x86 "${pkgdir}/usr/bin/multiwinia"
		rm -rf "${pkgdir}/opt/multiwinia/lib"
	fi
}


