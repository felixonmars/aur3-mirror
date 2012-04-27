# Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw32-glm
pkgver=0.9.3.1
pkgrel=2
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification. (mingw32 symlinks)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://glm.g-truc.net"
depends=('glm')
replaces=('mingw32-glmath')
conflicts=('mingw32-glmath')
provides=('mingw32-glmath')

_targetarch=i486-mingw32

package() {
	mkdir -p $pkgdir/usr/$_targetarch/include
	ln -s ../../../usr/include/glm $pkgdir/usr/$_targetarch/include
}
