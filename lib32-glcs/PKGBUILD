pkgname=lib32-glcs
pkgver=0.6.2
pkgrel=2
pkgdesc="An ALSA & OpenGL capture & streaming tool for Linux (32 bit libs for 32 bit apps)"
arch=("x86_64")
url="https://github.com/lano1106/glcs"
source=(
  "git://github.com/lano1106/glcs.git#branch=$pkgver"
  "git://github.com/nullkey/elfhacks.git#branch=stable"
  "git://github.com/lano1106/glcs-packetstream.git"
  "git://github.com/lano1106/glcs-support.git")
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
license=("GPL3")
depends=("glcs" "lib32-libxxf86vm" "lib32-glibc" "lib32-libpng" "lib32-alsa-lib" "lib32-libgl")
makedepends=("cmake" "mesa" "gcc-multilib" "gcc-libs-multilib" "libtool-multilib")

prepare() {
	cd glcs
	git submodule init
	git config submodule.elfhacks.url $srcdir/elfhacks
	git config submodule.packetstream.url $srcdir/glcs-packetstream
	git config submodule.support.url $srcdir/glcs-support
	git submodule update
}

build() {
	cd $srcdir/glcs

	DESTDIR=$pkgdir/usr
	MLIBDIR="lib32"
	CFLAGS="$CFLAGS -m32"
	./build.sh $DESTDIR $MLIBDIR || return 1;
	
	for mod in ${mods[@]}; do
		msg "Installing $mod to pkgdir..."
		cd $srcdir/$mod/build
		make install || return 1
	done
}	

package() {
	cd $srcdir/glcs
	DESTDIR=$pkgdir/usr
	./package.sh $DESTDIR || return 1;
	rm -rf $DESTDIR/include
	rm -rf $DESTDIR/bin
	rm -rf $DESTDIR/share/glcs
	mv $DESTDIR/share/licenses/{glcs,lib32-glcs}
}

