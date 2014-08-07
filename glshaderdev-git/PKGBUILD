# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>

_gitname=GLShaderDev
pkgname=glshaderdev-git
pkgver=0.9.1.r17.g051074d
pkgrel=1
pkgdesc="Qt IDE for modern OpenGL shaders"
arch=('i686' 'x86_64')
url="https://github.com/Ryp/GLShaderDev"
license=('GPL3')
depends=('qscintilla' 'qt4>=4.8.0' 'glew')
makedepends=('git cmake')
conflicts=('glshaderdev')
provides=('glshaderdev')
source=('git+https://github.com/Ryp/GLShaderDev.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    mkdir -p build
    pushd build
    cmake "$srcdir/$_gitname"                   \
        -DCMAKE_BUILD_TYPE=Release              \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make
}

package() {
    pushd build
    make install
}
