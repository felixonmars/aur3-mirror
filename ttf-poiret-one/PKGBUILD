# Contributor: Tom Vincent <http://tlvince.com/contact>

_font=PoiretOne-Regular.ttf
pkgname=ttf-poiret-one
pkgver=0.1
pkgrel=1
pkgdesc='Poiret One Regular font in True Type Format'
arch=('any')
license=('custom:OFL')
url='https://www.google.com/webfonts/specimen/Poiret+One'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$_font" "OFL.txt")
md5sums=('3b585e0e2f91bef9ab6ea74f7e302f20'
         '002c266f79f3ba2f01aab8172e30c6d7')
install=$pkgname.install

package() {
	install -Dm644 "$_font" "$pkgdir/usr/share/fonts/TTF/$_font"
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
