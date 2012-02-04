# Maintainer: Marcin Skory <armitage at gfreedom dot org>
pkgname=onscripter-en-svn
pkgver=623
pkgrel=1
pkgdesc="English version of the open source interpreter for the visual novel game scripting engine NScripter (SVN version)"
arch=('i686' 'x86_64')
url="http://onscripter.unclemion.com/"
license=('GPL')
depends=('gcc-libs' 'sdl_mixer' 'sdl_image' 'sdl_ttf' 'bzip2')
makedepends=('subversion')
provides=('onscripter-en')
conflicts=('onscripter-en')

_svntrunk=http://svn.unclemion.com/repo/onscripter/trunk/
_svnmod=onscripter-en

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
  install -D -m755 "${srcdir}/${_svnmod}-build/onscripter-en" "${pkgdir}/usr/bin/onscripter-en"
  install -dm755 "${pkgdir}/usr/share/doc/onscripter-en"
  cd "${srcdir}/${_svnmod}"
  install -m644 BUGS CHANGES INSTALL README "${pkgdir}/usr/share/doc/onscripter-en"
}
