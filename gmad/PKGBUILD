pkgname=gmad
pkgver=1.1
pkgrel=1
pkgdesc="Garry's Mod Addon Creator and Extractor"
arch=(i686 x86_64)
url="https://github.com/garrynewman/gmad"
license=("public domain")
depends=()
makedepends=(premake unzip dos2unix)
source=("gmad.zip::https://github.com/garrynewman/gmad/archive/a121a70e298ab6e07fa77a5e4f72018c7480f758.zip"
"bootil.zip::https://github.com/garrynewman/bootil/archive/f49ad73fd6258b3ad6db7db73eddb89854298374.zip")
md5sums=('c502795209887bad828587d84f41ee28'
         '2de217bb6eca9554eb26f93a849b6e33')

prepare() {
	cd "$srcdir"
	find . -type f -exec dos2unix {} \;
	mv bootil-* bootil
}

build() {
	cd "$srcdir/bootil/projects"
	premake4 gmake
	cd linux/gmake
	make config=release
	cd ../../../../gmad-*
	premake4 --outdir="bin/" --bootil_lib="../bootil/lib/linux/gmake/" \
		--bootil_inc="../bootil/include/" gmake
	make
}

package() {
	cd "$srcdir/gmad-"*"/bin"
	install -Dm755 gmad_linux "$pkgdir/usr/bin/gmad"
}

# vim:set ts=2 sw=2 et:
