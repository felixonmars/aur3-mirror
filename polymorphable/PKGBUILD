
pkgname=polymorphable
pkgver=0.18.90
pkgrel=1
pkgdesc="Laurelia's Polymorphable Citizen (or just Polymorphable for short) is an action-rpg based on the Flare engine"
arch=('any')
url="https://github.com/makrohn/polymorphable"
license=('CC-BY-SA 3.0')
depends=('flare-engine')
# use current head of git master to make it run on flare 0.19
source=(https://github.com/makrohn/polymorphable/archive/7a44f97ca899925c4d23934cbfab5222811ce126.zip
		$pkgname
		${pkgname}.desktop)
md5sums=('fee50721e96f76e06670cc578c17794f'
		'8adf2b80fc0f40cb8bef1336d9d3020f'
		'941106e4a7bd8b792e8a071834037521')

package() {
	cd "$srcdir"/polymorphable-7a44f97ca899925c4d23934cbfab5222811ce126

	mkdir -p "${pkgdir}/usr/share/flare/${pkgname}/"
	cp -r mods/ "${pkgdir}/usr/share/flare/${pkgname}/"

	install -Dm755 "${startdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
  
  
