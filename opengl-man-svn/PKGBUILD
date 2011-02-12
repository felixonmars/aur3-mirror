# Maintainer: RetroX <classixretrox@gmail.com>
pkgname=opengl-man-svn
pkgver=12632
pkgrel=1
pkgdesc="The OpenGL API documentation."
arch=('any')
url="http://www.opengl.org/sdk/docs/man/"
license=('OpenGL')
depends=()
makedepends=('subversion')
source=()
md5sums=()
_svntrunk="https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/docs/man/"
_svnmod="man"

build()
{
  svn co $_svntrunk $_svnmod
  mkdir -p $pkgdir/usr/share/doc/opengl
  cp -R $_svnmod -T $pkgdir/usr/share/doc/opengl
}
