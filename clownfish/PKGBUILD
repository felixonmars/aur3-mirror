# Maintainer: Kasper Menten <kasper.menten@gmx.com>

pkgname=clownfish
pkgdesc="Free realtime language translator for skype"
url="http://clownfish-translator.com/"
pkgver=0.20
pkgrel=1
license=('CUSTOM')
depends=('skype' 'gtk2' 'gdk-pixbuf2' 'fontconfig' 'libxrender' 'libx11'
         'glib2' 'freetype2' 'glibc' 'zlib' 'libpng12' 'gcc-libs')
makedepends=('unzip')
source=(license
        clownfish.desktop)
md5sums=('07a09ef1a84ca347df40715fdd720d43'
         'c744dfdd0ed21a5eb1a7da06727cfb46')

case $CARCH in
	x86_64)
		source+=(http://clownfish-translator.com/getit/clownfish_${pkgver}_amd64.zip)
		md5sums+=('33bfd346d7f52b9b1534303104de8610')
		arch=x86_64
	;;
	i686)
		source+=(http://clownfish-translator.com/getit/clownfish_${pkgver}_i386.zip)
		md5sums+=('461ccf7f53d29b8fb565fb4dd9f12261')
		arch=i686
	;;
esac

build(){
    cd "${srcdir}"
    unzip -o "clownfish*.zip" -d "${pkgname}-${pkgver}" || true
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -Rl "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -d "${pkgdir}/usr/share/${pkgname}"
    ln -s "/opt/${pkgname}/Clownfish.ico" "${pkgdir}/usr/share/${pkgname}"

    install -d "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/Clownfish" "${pkgdir}/usr/bin/${pkgname}"
}
