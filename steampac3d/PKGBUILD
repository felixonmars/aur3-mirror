# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=steampac3d
pkgver=1.0.1
pkgrel=1
pkgdesc="A 3D  Steampunk pacman version"
arch=('i686' 'x86_64')
url="http://nosinmipixel.blogspot.com.es/search/label/Steampac%203d"
license=('GPL2')
depends=('python' 'sdl' 'sdl_image' 'openal' 'ffmpeg')
_pkgname='SteamPac'
_pkgver='1_0_1'
arch=('x86_64' 'i686')
if [ "$CARCH" = "i686" ]; then
	source=(http://downloads.sourceforge.net/project/steampac/linux/${_pkgname}_${_pkgver}_linux32.tar.gz steampac3d.sh)
	md5sums=('4364df53a38d8217b895ad90383b8fc2'  
	'82ce3b2e37f26ae54de3e489bb94df3d')
	_arch=32
elif [ "$CARCH" = "x86_64" ]; then
	source=(http://downloads.sourceforge.net/project/steampac/linux/${_pkgname}_${_pkgver}_linux64.tar.gz steampac3d.sh)
	md5sums=('9ae7151e0924456f73bb979c26d6bd9a'
         '82ce3b2e37f26ae54de3e489bb94df3d')
	_arch=64
fi
package() {
	cd "${srcdir}/${_pkgname}_${_pkgver}_linux${_arch}"
	mkdir -p ${pkgdir}/usr/bin
	install -m 755 "${srcdir}/${pkgname}.sh"  $pkgdir/usr/bin/${pkgname}
	mkdir -p ${pkgdir}/usr/share/${pkgname}
	cp * -r ${pkgdir}/usr/share/${pkgname}
	chmod -R 655  ${pkgdir}/usr/share/${pkgname}
}

