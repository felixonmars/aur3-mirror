# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Maintainer: Loren Copeland <thisisquitealongname at gmail dot com>
pkgname=mda-lv2-svn
_pkg="${pkgname%-svn}"
pkgver=4220
pkgrel=1
pkgdesc="A port of the MDA VST effect plugins to LV2 by David Robillard"
arch=("i686" "x86_64")
url="http://drobilla.net/"
license=("GPL2")
groups=("lv2-plugins")
depends=("lv2")
makedepends=("subversion" "python")
optdepends=("lv2-mdaepiano: LV2 port of the MDA Epiano instrument plugin")

_svntrunk="http://svn.drobilla.net/lad/trunk/plugins/mda.lv2/"
_svnmod="$_pkg"

build() {
  cd "$srcdir"

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -a "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  #
  # BUILD
  #

  python ./waf configure --prefix="/usr"
  python ./waf build
}

package() {
  local _svndir="${srcdir}/${_svnmod}-build"
  . <(sed -n "s|^\(MDALA_VERSION\)\s*=\s*'\([.0-9]*\)'$|_\1=\2|p" "${_svndir}/wscript")
  provides=("${_pkg}=${_MDALA_VERSION}")
  conflicts=("${_pkg}")

  cd "$_svndir"
  python ./waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
