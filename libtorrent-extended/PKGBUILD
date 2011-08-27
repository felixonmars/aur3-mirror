# Maintainer.: Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent-extended
_pkgname="libtorrent"
#_pkgname="${pkgname%-*}" # currently not work with bauerbill
pkgver=0.12.6
pkgrel=7
pkgdesc="BitTorrent library written in C++ with eXtended patches."
arch=("i686" "x86_64")
url="http://libtorrent.rakshasa.no"
license=("GPL")
depends=("libsigc++" "openssl")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=("!libtool")
#eXtended patches {{{
_magnet_uri=1
_ipv6=1
_friend=1
_bad_peer_handling=1
_show_idle_times=1
#}}}
source=("${url}/downloads/${_pkgname}-${pkgver}.tar.gz"
        "ex_magnet_uri.patch"
        "ex_ipv6.patch"
        "ex_friend.patch"
        "ex_bad_peer_handling.patch"
        "ui_show_idle_times.patch"
        "fix_gcc_4.6.0.patch")
md5sums=('037499ed708aaf72988cee60e5a8d96b'
         'e14c2ca84bb38895702793fff316e2ea'
         '930c4422882823b3e9ed43998b61a187'
         'ae3a8d3d75dbaafc166e1c052b42a92d'
         '3db101335191d0dec33284953b44dc3d'
         'a004776b18bff7968c56eadc7f3de7d2'
         '5fb33c09086bfd6b731e04beaba6d615')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #eXtended patches {{{
  if [[ "${_magnet_uri}" = "1" || "${_ipv6}" = "1" ]]; then
    echo "ex_magnet_uri.patch"
    patch -uNp1 -i "${srcdir}/ex_magnet_uri.patch"
  fi
  if [[ "${_ipv6}" = "1" ]]; then
    echo "ex_ipv6.patch"
    patch -uNp1 -i "${srcdir}/ex_ipv6.patch"
    _cfg_opts="--enable-ipv6"
  fi
  if [[ "${_friend}" = "1" ]]; then
    echo "ex_friend.patch"
    patch -uNp1 -i "${srcdir}/ex_friend.patch"
  fi
  if [[ "${_bad_peer_handling}" = "1" ]]; then
    echo "ex_bad_peer_handling.patch"
    patch -uNp1 -i "${srcdir}/ex_bad_peer_handling.patch"
  fi
  if [[ "${_show_idle_times}" = "1" ]]; then
    echo "ui_show_idle_times.patch"
    patch -uNp1 -i "${srcdir}/ui_show_idle_times.patch"
  fi
  #}}}

  echo "fix_gcc_4.6.0.patch"
  patch -uNp1 -i "${srcdir}/fix_gcc_4.6.0.patch"

  ./autogen.sh
  CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing" \
    ./configure --prefix=/usr --disable-debug "${_cfg_opts}"
  make
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
