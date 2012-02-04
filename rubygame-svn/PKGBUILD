# Packager: Bjorn Lindeijer (b.lindeijer@gmail.com)
pkgname=rubygame-svn
pkgver=244
pkgrel=2
pkgdesc="A game-development extension and library for the ruby language."
url="http://rubygame.seul.org/"
license="GPL"
depends=('ruby' 'sdl_gfx' 'sdl_image' 'sdl_ttf')
makedepends=()
conflicts=('rubygame')
replaces=('rubygame')
backup=()
install=
source=()
md5sums=()

_svntrunk="https://rubygame.svn.sourceforge.net/svnroot/rubygame"
_svnmod="rubygame"

build() {
  cd $startdir/src/
  svn co -r $pkgver $_svntrunk $_svnmod
  cd $_svnmod/trunk

  _sitelibdir="${startdir}/pkg/usr/lib/ruby/site_ruby/1.8/"
  _sitearchdir="${_sitelibdir}/${CARCH}-linux"

  mkdir -p $_sitearchdir

  RUBYGAME_CONFIG="--sitelibdir ${_sitelibdir} --sitearchdir ${_sitearchdir} --image" \
    rake install
  rake rdoc
}
