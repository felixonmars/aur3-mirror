# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-lib-derelict-glfw
pkgver=2.6
pkgrel=1
pkgdesc="GLFW binding for the D Programming Language."
url="http://soulbreakers.com/usr/darkman/d/derelict/glfw/"
arch=('i686', 'x86_64')
license=('custom')
depends=('d-lib-derelict' 'glfw')
source=('http://stdrand.com/darkman/d/derelict/glfw/derelict-glfw.zip')
md5sums=('214194edf32f3051e527b417d5bfe2a5')

build() {
  cd ${srcdir}
  
  mkdir -p ${pkgdir}/usr/include/d/derelict
  
  cp -r DerelictGLFW/derelict/opengl ${pkgdir}/usr/include/d/derelict || return 1
  chmod 0666 ${pkgdir}/usr/include/d/derelict/opengl/glfw.d
}
