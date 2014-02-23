# Maintainer: Justin Dray <justin@dray.be>

pkgname=forgotten-myths
pkgver=0.91
pkgrel=1
pkgdesc="Forgotten Myths is a free to play, online collectible trading card game (TCG or CCG)"
license=('custom')
url="http://forgottenmyths.com"
groups=('games')
arch=('i686' 'x86_64')
makedepends=('unzip')
_gamepkg='ForgottenMyths_linux.zip'
noextract=("$_gamepkg")
source=("http://forgottenmyths.com/game/$_gamepkg" 'forgotten-myths.desktop')
md5sums=('d4b43d1245f9ed428cf116c622375c82'
         '817e87e98bd31aeead78f6dbde6c8b33')

build() {
	cd "${srcdir}"
	unzip -qo "$_gamepkg" -d "${srcdir}/${pkgname}"
}

package() {
	cd "${srcdir}"
	install -Dm644 "${srcdir}/forgotten-myths.desktop" "${pkgdir}/usr/share/applications/forgotten-myths.desktop"
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"
	install -Dm755 "${srcdir}/${pkgname}/Forgotten Myths.x86" "${pkgdir}/opt/${pkgname}/Forgotten Myths.x86"
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/$pkgname/Forgotten Myths.x86" "${pkgdir}/usr/bin/forgotten-myths"

    # Desktop launcher with icon
#    install -D -m644 "${srcdir}/minecraft.png"     "${pkgdir}/usr/share/pixmaps/minecraft.png"
}

