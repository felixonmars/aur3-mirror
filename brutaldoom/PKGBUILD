# Maintainer: HotShot247 <hotshot2472010@gmail.com>
pkgname=brutaldoom
pkgver=19
pkgrel=1
pkgdesc="Prepare to see the most disturbing, sadistic and morbid manifestation of violence that you ever seen in your life. This is the definitive gameplay enhancement mod for the GZDoom and Zandronum engines."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom/downloads/brutal-doom-version-19"
license=('GPL3')
depends=('doomseeker' 'zandronum')
optdepends=()
makedepends=('git')

source=("http://media1.gamefront.com/moddb/2013/10/31/brutal19.zip?b17f4b620c6cf1393ffa644d1ceea1519471f50243241c9c351f544aefaeb617054856f45e07ae230795c14b30a53906a278cc670925e173f63ab5fc3bbd23893c795e9f73fd2337f410edc4aa8dbdd66afc8d568dfa1bd8dfe8f4dc630d345e8fa59a6fd3ae97ade297c0ea87eae3fa983b" "http://mooos.org/mooOS-utils/doommetalvol4.tar.gz")
md5sums=('3980412ac21c48114c18f8fb7e2b795f'
		 '67975e13059aceb7fa5d93d3d91de99b')

_gitroot="git://github.com/idk/brutaldoom.git"
_gitname="brutaldoom"

install=$pkgname.install

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	if [ -d $_gitname-build ] ; then
		cd $_gitname-build && git pull origin
		msg "The local files are updated."
	else
		msg "Starting make..."
		git clone "$_gitroot" "$srcdir/$_gitname-build"
	fi
}

package() {
	cd ${srcdir}
	mkdir -p "$pkgdir/usr/share/games/$pkgname"

	msg2 "Installing brutal${pkgver}.pk3 and doommetalvol4.wad..."
	install -Dm644 "$srcdir/brutal${pkgver}.pk3" "$pkgdir/usr/share/games/$pkgname/brutal${pkgver}.pk3"
	install -Dm644 "$srcdir/doommetalvol4.wad" "$pkgdir/usr/share/games/$pkgname/doommetalvol4.wad"

	msg2 "Installing configuration files..."
	cd "$srcdir/$_gitname-build"
	install -Dm644 "$srcdir/$_gitname-build/zandronum.ini" "$pkgdir/usr/share/games/$pkgname/zandronum.ini"
	install -Dm644 "$srcdir/$_gitname-build/brutalv018a changelog.txt" "$pkgdir/usr/share/games/$pkgname/brutal19_changelog.txt"

	rm -rf "$srcdir/$_gitname-build"
}
