# Peter Hatina <phatina AT gmail.com>
pkgname=glmath-git
pkgver=20120126
pkgrel=1
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification."
arch=('i686' 'x86_64')
license=('GPL')
url="http://glm.g-truc.net"

_gitroot="git://ogl-math.git.sourceforge.net/gitroot/ogl-math/ogl-math"
_gitname="glm"

build() {
    cd $srcdir
    msg "Cloning GLM from git"
    
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin &>/dev/null
    else
        git clone $_gitroot $_gitname &>/dev/null
    fi
}

package() {
    mkdir -p $pkgdir/usr/include/glm
    cp -r $srcdir/glm/glm $pkgdir/usr/include
    rm -f $pkgdir/usr/include/glm/CMakeLists.txt
    find $pkgdir -type f -exec chmod 644 {} \;
    find $pkgdir -type d -exec chmod 755 {} \;
}
