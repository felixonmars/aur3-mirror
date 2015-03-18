# Maintainer: qs9rx < that nick at enjoys döt it>

pkgname=quakeforge-git
pkgver=r9727.bdb221c
pkgrel=1
pkgdesc="A 3D first-person shooter game engine based on id Software's legendary Quake and QuakeWorld game engines. This package includes all its tools as well. Git version."
url="http://www.quakeforge.net/"
license=('GPL')
# probably has more dependencies?
depends=('libxxf86dga' 'libxxf86vm' 'curl' 'sdl' 'libpng')
makedepends=('autoconf' 'automake' 'libtool' 'bison' 'flex' 'make' 'gcc' 'libsamplerate' 'git')
optdepends=('jack' 'python' 'wildmidi')
arch=('i686' 'x86_64')
source=("git+git://git.code.sf.net/p/quake/quakeforge")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/quakeforge/
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"/quakeforge/
	./bootstrap && \
	./configure --prefix=${srcdir}/quakeforge/bin/ && \
	make && \
	make install
}

package() {
    cp -a "${srcdir}/quakeforge/bin" "${pkgdir}/usr"
}
