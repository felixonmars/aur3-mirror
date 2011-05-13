# Maintainer: Marcin Skory <armitage at gfreedom dot org>
pkgname=ponscripter-svn
pkgver=387
pkgrel=3
pkgdesc="NScripter-style novel-game interpreter with an emphasis on supporting games in Western languages (SVN version)"
arch=('i686' 'x86_64')
url="http://onscripter.unclemion.com/"
license=('GPL')
depends=('gcc-libs' 'sdl_mixer' 'sdl_image' 'bzip2' 'freetype2')
makedepends=('subversion')
provides=('ponscripter')
conflicts=('ponscripter')

_svntrunk=http://svn.unclemion.com/repo/ponscripter/trunk/
_svnmod=ponscripter

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  ./configure --prefix=/usr --no-werror
  make
}

package() {
  install -D -m755 "${srcdir}/${_svnmod}-build/src/ponscr" "${pkgdir}/usr/bin/ponscripter"
  install -dm755 "${pkgdir}/usr/share/doc/ponscripter"
  cd "${srcdir}/${_svnmod}"
  install -m644 BUGS CHANGES INSTALL README "${pkgdir}/usr/share/doc/ponscripter"
}
