# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=shaderlabs-svn
pkgver=242
pkgrel=1
pkgdesc="An IDE for GLSL shader development"
arch=('i686' 'x86_64')
url="http://www.dcc.ufrj.br/~shaderlabs/Shaderlabs"
license=('GPL')
depends=('qt4' 'glu')
makedepends=('subversion')
provides=('shaderlabs')
conflicts=('shaderlabs')
source=('shaderlabs::svn+http://shader-lab.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/shaderlabs"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/shaderlabs"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/shaderlabs"
  make install

  install -D -m 755 "$srcdir/ShaderLabs/bin/ShaderLab-"* "$pkgdir/usr/bin/ShaderLab"
  cp -r "$srcdir/ShaderLabs/lib" "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
