# Submitter: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Micael Dias
pkgname=ogre-procedural-hg
pkgver=539.906dd8087f12
pkgrel=1
pkgdesc="Procedural geometry for Ogre3D"
arch=(i686 x86_64)
url="http://code.google.com/p/ogre-procedural/"
license=('MIT')
depends=('ogre')
makedepends=('mercurial')
provides=('ogre-procedural')
conflicts=('ogre-procedural')

_hgrepo="ogre-procedural"
source=("${_hgrepo}::hg+https://ogre-procedural.googlecode.com/hg"
	"fix-boost-linking.patch")
md5sums=('SKIP'
         'bc9eba8fc7a13e1e60980a3501c8d7e3')

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$_hgrepo"
  patch -p1 < ../fix-boost-linking.patch
  
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  mkdir "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  cmake "$srcdir/$_hgrepo" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOgreProcedural_BUILD_SAMPLES=FALSE \
        -DOgreProcedural_BUILD_DOCS=FALSE
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="$pkgdir/" install
}