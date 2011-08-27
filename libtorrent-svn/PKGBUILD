# Maintainer:  Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>
# Contributor: Jonny Gerold <jonny@fsk141.com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent-svn
_pkgname="${pkgname%-*}"
pkgver=1189
pkgrel=1
pkgdesc="BitTorrent library written in C++"
url="http://libtorrent.rakshasa.no"
license=("GPL")
arch=("i686" "x86_64")
depends=("libsigc++" "openssl")
makedepends=("cppunit" "subversion")
options=("!libtool")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=()
md5sums=()

_svnmod="${_pkgname}"
_svntrunk="svn://rakshasa.no/libtorrent/trunk/${_svnmod}"

build() {
  cd "${srcdir}"

  #svn {{{
  msg "Connecting to SVN server..."
  if [ -d "${_svnmod}" ]; then
    (cd "${_svnmod}" && svn update -r "${pkgver}")
    msg "The local repository was updated."
  else
    svn co "${_svntrunk}" "${_svnmod}" -r "${pkgver}"
  fi
  msg "SVN checkout done or server timeout."
  cd "${srcdir}"
  if [ -d "${_svnmod}-build" ]; then
    rm -rf "${_svnmod}-build"
  fi
  cp -rf "${_svnmod}" "${_svnmod}-build"
  cd "${_svnmod}-build"
  #}}}

  ./autogen.sh
  CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing" \
  ./configure --prefix=/usr --disable-debug
  make
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
