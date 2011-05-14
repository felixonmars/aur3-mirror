# Maintainer: Absolosba <absolosba at gmail dot com>
pkgname=doukutsu-wine
pkgver=1.03
pkgrel=1
pkgdesc="The Windows version of Cave Story"
arch=('i686' 'x86_64')
url="http://www.cavestory.org/"
license=('freeware')
depends=('wine')
source=("http://shii.org/pixel/cavestory.zip"
	"doukutsu-wine.desktop"
	"doukutsu-wine-config.desktop"
	"doukutsu.png"
	"doukutsu-wine")
md5sums=('c1dc82ff36837e70c36f5a5b38aa7e70'
         '8362f2b7c48a4dc7d05bf701d52fe508'
         '936e72c2f3a37e13c10e6e813f565795'
         'd73dee54b24f2ceb21a50e2c8f71da10'
         '1c730418f28caec516262f3106a092ab')
build(){
	cd "${srcdir}/cavestory" || return 11
	install -dm755 ${pkgdir}/usr/share/{${pkgname},applications} || return 1
	cp -r {data,Doukutsu.exe,DoConfig.exe} "${pkgdir}/usr/share/${pkgname}/" || return 1
	install -Dm644 ${srcdir}/*.desktop "${pkgdir}/usr/share/applications/" || return 1
	install -Dm644 "${srcdir}/doukutsu.png" "${pkgdir}/usr/share/pixmaps/doukutsu-wine.png" || return 1
	install -Dm755 "${srcdir}/doukutsu-wine" "${pkgdir}/usr/bin/doukutsu-wine" || return 1
}