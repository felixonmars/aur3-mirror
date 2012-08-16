# Maintainer: Nicolas Barbey <nicolas dot a dot barbey at gmail dot com>
pkgname=ufo2000-svn
pkgver=1176
pkgrel=1
pkgdesc="turn based tactical squad simulation multiplayer game, heavily inspired by the famous UFO: Enemy Unknown"
arch=(any)
url="http://ufo2000.sourceforge.net/"
license=('GPL')
groups=()
depends=('allegro4' 'expat' 'freetype2' 'gcc-libs' 'hawknl' 'libpng' 'lua' 'sqlite3')
optdepends=('ruby: additional scripts')
makedepends=('subversion')
provides=()
conflicts=('ufo2000')
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_svntrunk=https://ufo2000.svn.sourceforge.net/svnroot/ufo2000
_svnmod=ufo2000

source=("${_svnmod}.sh"
        "${_svnmod}.png"
        "${_svnmod}.desktop")
md5sums=('ed379fb1c3d9ba61d7591186e6c056d3'
         'c39fa2f286591497a25e11811ddf8585'
         '8afe462aee326c008223831b838e68e1')


build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_svnmod/trunk"

  make
  make server
}

package(){
  cd "${srcdir}/$_svnmod/trunk"

  # Install game files
  install -dm777 "${pkgdir}/opt/${_svnmod}"
  cp -rf arts datfile extensions fonts init-scripts newmusic \
    newunits script TFTD translations XCOM "${pkgdir}/opt/${_svnmod}"
  install -m644 *.{dat,ini,lua,xml} "${pkgdir}/opt/${_svnmod}"
  install -m666 *.conf "${pkgdir}/opt/${_svnmod}"

  # Install binary files
  install -m755 ${_svnmod}{,-srv} "${pkgdir}/opt/${_svnmod}/"

  # Install docs
  mkdir -p "${pkgdir}/usr/share/doc/${_svnmod}"
  cp -rf docs "${pkgdir}/usr/share/doc/${_svnmod}"
  install -m644 AUTHORS ChangeLog HACKING INSTALL readme*.{txt,html} \
    "${pkgdir}/usr/share/doc/${_svnmod}"

  # Install launcher, icon and .desktop file
  install -Dm755 "../../../${_svnmod}.sh" "${pkgdir}/usr/bin/${_svnmod}"
  install -Dm644 "../../../${_svnmod}.png" "${pkgdir}/usr/share/pixmaps/${_svnmod}.png"
  install -Dm644 "../../../${_svnmod}.desktop" "${pkgdir}/usr/share/applications/${_svnmod}.desktop"
}

# vim:set ts=2 sw=2 et:
