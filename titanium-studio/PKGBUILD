# Maintainer: Shanto <shanto@hotmail.com>

pkgname=titanium-studio
_pkgname=Titanium\ Studio
pkgver=1.0.8
pkgrel=1
pkgdesc="A free and open source application development platform, Titanium lets you create native mobile, tablet and desktop application experiences using existing web skills like Javascript, HTML, CSS, Python, Ruby, and PHP."
url="http://www.appcelerator.com/products/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('java-environment>=6' 'gtk2>=2.20' 'libwebkit' 'libpng12' 'libjpeg6')
makedepends=('findutils')
options=(!strip)

source=(
	"http://titanium-studio.s3.amazonaws.com/$pkgver/titanium.linux.gtk.x86_64.zip"
	"${pkgname}.desktop"
)

md5sums=(
	'c27a89ba1c019771bb98006625db43eb'
	'71ea5cc8c1eefdf2c394655add2bef42'
)

if [ "$CARCH" = "i686" ]; then
	source[0]="http://titanium-studio.s3.amazonaws.com/$pkgver/titanium.linux.gtk.x86.zip"
	md5sums[0]='c17f54b61a009f6d28f3cd2de4abdc54'
fi

package() {
	mkdir -p $pkgdir/usr/{bin,share/{applications,pixmaps,icons/hicolor/{16x16,32x32}/apps}}

	_pkgroot="usr/share/${pkgname}"
	cp -r "${srcdir}/${_pkgname}" "$pkgdir/${_pkgroot}"
	cd "$pkgdir/${_pkgroot}"

	sed -i 's|/usr/bin/readlink|readlink|' studio3
	ln -sfT "/${_pkgroot}/studio3" "../../bin/${pkgname}"
	find . -name '*.py' -exec sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' {} \;

	install -m644 "${srcdir}/${pkgname}.desktop" "../applications/"
	ln -sfT "/${_pkgroot}/icon.xpm" "../pixmaps/${pkgname}.xpm"
	cd $pkgdir/${_pkgroot}
	find ./ -path '*titanium*/window16*.png' -printf "/${_pkgroot}/%P" -quit | xargs -i ln -sf "{}" "../icons/hicolor/16x16/apps/${pkgname}.png"
	find ./ -path '*titanium*/window32*.png' -printf "/${_pkgroot}/%P" -quit | xargs -i ln -sf "{}" "../icons/hicolor/32x32/apps/${pkgname}.png"
}
