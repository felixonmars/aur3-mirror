# Maintainer: Sakari Matikka < sm4tik yahoo com >

pkgname=grafx2-svn
pkgver=1690
pkgrel=1
pkgdesc="A pixelart-oriented painting program"
arch=('i686' 'x86_64')
url="http://code.google.com/p/grafx2/"
license=('GPL2')
depends=('sdl_image' 'sdl_ttf' 'lua')
makedepends=('subversion')
provides=('grafx2')
conflicts=('grafx2')

_svntrunk="http://grafx2.googlecode.com/svn/trunk"
_svnmod="grafx2"

build() {
  cd "${srcdir}"

  msg "Checking out SVN.."

  if [ -d "${_svnmod}/.svn" ] ; then
    ( cd "${_svnmod}" && svn up -r "${pkgver}" )
    msg "Local files are updated"
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"

  [ -d "${_svnmod}-build" ] && rm -rf "${_svnmod}-build"
  cp -r "${_svnmod}" "${_svnmod}-build"
  cd "${_svnmod}-build/src"
  
  # make with version number displayed in stats screen
  msg "Starting make.."
  make version
  
}

package() {

  cd "${srcdir}/${_svnmod}-build/src"
  
  make prefix=/usr \
    pixmapdir=/usr/share/pixmaps \
    DESTDIR="${pkgdir}" \
    install

  # install manual, license and readme
  install -Dm644 "../misc/unix/grafx2.1" \
    "${pkgdir}/usr/share/man/man1/grafx2.1"
  install -Dm644 "../doc/gpl-2.0.txt" \
    "${pkgdir}/usr/share/licenses/grafx2/LICENSE"
  install -Dm644 "../doc/README.txt" \
    "${pkgdir}/usr/share/doc/grafx2/readme.txt"

}

# vim:set ts=2 sw=2 et:
