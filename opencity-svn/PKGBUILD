# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: zoulnix <http://goo.gl/HQaP>

pkgname=opencity-svn
pkgver=r467
pkgrel=1
pkgdesc="A full 3D city simulator game project (SVN-version)"
arch=('i686' 'x86_64')
url="http://opencity.info/"
license=('GPL')
depends=('mesa' 'sdl_image' 'sdl_net' 'sdl_mixer')
makedepends=('subversion')
conflicts=('opencity')
replaces=('opencity')
source=("$pkgname::svn://svn.code.sf.net/p/opencity/code/trunk")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname/opencity"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname/opencity"
  make DESTDIR="${pkgdir}/" install

  # Removing unnecessary stuff
  find "${pkgdir}" -depth -type d -name ".svn" -exec rm -rf {} \;
}
