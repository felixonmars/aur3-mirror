# Maintainer: protosphere <protosphere@protosphere.me>
pkgname=pmdplay-git
_gitname=mdxplayer
pkgver=20120104
pkgrel=1
pkgdesc="Plays audio files created for PC-98 OPN family sound chips."
arch=('i686', 'x86_64')
url="https://github.com/BouKiCHi/mdxplayer"
license=('GPL')
depends=('sdl')
makedepends=('git')
source=('git://github.com/BouKiChi/mdxplayer.git'
        'make-fpermissive.patch')
md5sums=('SKIP'
         '26451c6beaec966434dc722e334078aa')

pkgver() {
	cd "$_gitname"
	date -d @$(git log -1 --format=%ct -- jni/pmdmini) +%Y%m%d
}

build() {
	cd "$_gitname"
	git apply ../make-fpermissive.patch

	cd "jni/pmdmini"
	make
}

package() {
	cd "$_gitname/jni/pmdmini"
	install -Dm 755 pmdplay "$pkgdir/usr/bin/pmdplay"
}
