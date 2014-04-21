# Maintainer: Qhor Vertoe <vertoe at qhor dot net>

pkgname=glm094
_gitname=glm
pkgver=0.9.4
pkgrel=1
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification. (Static Version 0.9.4)"
arch=('i686' 'x86_64')
url="http://glm.g-truc.net/0.9.4/index.html"
license=('MIT')
makedepends=('git' 'cmake' 'gcc')
provides=('glm=0.9.4')
conflicts=('glm' 'glmath-git' 'mingw-w64-glm')
source=('glm::git+https://github.com/g-truc/glm.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/${_gitname}"
  git checkout 0.9.4
  git pull
}

package() {
    mkdir -p $pkgdir/usr/include/glm
    cp -r $srcdir/glm/glm $pkgdir/usr/include
    rm -f $pkgdir/usr/include/glm/CMakeLists.txt
    find $pkgdir -type f -exec chmod 644 {} \;
    find $pkgdir -type d -exec chmod 755 {} \;
}
