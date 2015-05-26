# Maintainer: arctize <patrick.wicki@hotmail.ch>
pkgname=teamspeak3-soundpack-cod4
pkgver=1
pkgrel=1
pkgdesc="Call Of Duty 4 soundpack for Teamspeak3."
arch=('any')
url="http://addons.teamspeak.com/directory/addon/sound-packs/Call-Of-Duty-4-Sound-Pack.html"
license=('Unknown')
depends=('teamspeak3')
source="http://addons.teamspeak.com/directory/addon/download/Call-Of-Duty-4-Sound-Pack.html"
md5sums=('5b69e424b85ad5b3ced6acb7839d4cb6')
sha1sums=('e059b40b2f66d5d90a0f9bc1e2816f313525016c')
replaces=('teamspeak3-soundpack-cod4')

package(){
	cd "$srcdir/sound"
	mkdir -p "$pkgdir/opt/teamspeak3/sound"
	cp -R "$(ls)" "$pkgdir/opt/teamspeak3/sound/"
}

