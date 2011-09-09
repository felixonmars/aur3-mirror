pkgname=lib32-soil
pkgver=0708
pkgrel=1
pkgdesc="tiny C lib primarily for loading textures into OpenGL"
arch=('x86_64')
url="http://www.lonesock.net/soil.html"
license=('public')
depends=('soil' 'lib32-freeglut')
makedepends=('unzip' 'gcc-multilib')
source=("http://www.lonesock.net/files/soil.zip")
md5sums=('4736ac4f34fd9a41fa0197eac23bbc24')

build() {
  cd "${srcdir}/Simple OpenGL Image Library/projects/makefile"
  
  [ -d obj ] && rm -r obj
  mkdir obj
  
  sed -i 's|$(LOCAL)/lib|$(LOCAL)/lib32|g' makefile
  sed -i "s|CXXFLAGS = |CXXFLAGS = -m32 -fPIC |g" makefile
  sed -i "s|LOCAL = /usr/local|LOCAL = ${pkgdir}/usr|g" makefile
  
  make
}

package() {
  cd "${srcdir}/Simple OpenGL Image Library/projects/makefile"
  install -dm 755 "${pkgdir}/usr"/{lib32,include}
  make install
  rm "${pkgdir}/usr/include"
}

