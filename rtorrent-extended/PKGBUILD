# Maintainer:  Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>
# Contributor: Ashren <edgar [at] archlinux [dot] us>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=rtorrent-extended
_pkgname="rtorrent"
#_pkgname="${pkgname%-*}" currently not work with bauerbill
pkgver=0.8.6
pkgrel=7
pkgdesc="Ncurses BitTorrent client based on libTorrent with eXtended patches."
arch=("i686" "x86_64")
url="http://libtorrent.rakshasa.no"
license=("GPL")
depends=("curl>=7.14.3" "libtorrent-extended>=0.12.6-7" "xmlrpc-c>=1858")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${pkgname}.install"
#eXtended patches {{{
_magnet_uri=1
_ipv6=1
_ip_filter=1
_friend=1
_bad_peer_handling=1
_equal_operator=1
# 1 = canvas color patch / 2 = karabja mod patch
_interface=1
_show_idle_times=1
_trackerinfo=1
# 1 = tjwoosta vi keybindings / 2 = akston vi keybindings
_keybindings=1
#}}}
source=("${url}/downloads/${_pkgname}-${pkgver}.tar.gz"
        "ex_magnet_uri.patch"
        "ex_ipv6.patch"
        "ex_ip_filter.patch"
        "ex_friend.patch"
        "ex_bad_peer_handling.patch"
        "ex_equal_operator.patch"
        "ui_canvas_color.patch"
        "ui_karabaja_mod.patch"
        "ui_show_idle_times.patch"
        "ui_trackerinfo.patch"
        "kb_vi_akston.patch"
        "kb_vi_tjwoosta.patch"
        "fix_fatal_exception.patch")
md5sums=("b804c45c01c40312926bcea6b55bb084"
         "d1863ff23b0b17839e3f09b53f217bd8"
         "dfd7f1344734a6cdeab476213ba90701"
         "10a4f15d0c2cf122722b6b47a023da2b"
         "2d6ababca0dee540ae70d764cc4f1fc0"
         "e698da498f306435fb8f89824c47e0e8"
         "78cb7da5c0080f0ae67ef3632c3c9b69"
         "732394d3d2f6e642b4969728e40490ca"
         "535bbc3747fde174aef3600e304e725a"
         "611f429ec089e76cabb44161be5ab308"
         "1fc3b40153450f34f8f4c4e1a161b6b8"
         "b512babd89e65a94c949088da0745446"
         "828f38bb78d839765b153ad3e6e09182"
         "dacf00e1ddf2a27e7661167f193312f3")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #eXtended patches {{{
  #ex
  if [[ "${_magnet_uri}" = "1" || "${_ipv6}" = "1" ]]; then
    echo "ex_magnet_uri.patch"
    patch -uNp1 -i "${srcdir}/ex_magnet_uri.patch"
  fi
  if [[ "${_ipv6}" = "1" ]]; then
    echo "ex_ip6.patch"
    patch -uNp1 -i "${srcdir}/ex_ipv6.patch"
    _cfg_opts="--enable-ipv6"
  fi
  if [[ "${_ip_filter}" = "1" || "${_friend}" = "1" ]]; then
    echo "ex_ip_filter.patch"
    patch -uNp1 -i "${srcdir}/ex_ip_filter.patch"
  fi
  if [[ "${_friend}" = "1" ]]; then
    echo "ex_friend.patch"
    patch -uNp1 -i "${srcdir}/ex_friend.patch"
  fi
  if [[ "${_bad_peer_handling}" = "1" ]]; then
    echo "ex_bad_peer_handling.patch"
    patch -uNp1 -i "${srcdir}/ex_bad_peer_handling.patch"
  fi
  if [[ "${_equal_operator}" = "1" ]]; then
    echo "ex_equal_operator.patch"
    patch -uNp1 -i "${srcdir}/ex_equal_operator.patch"
  fi
  #ui
  if [[ "${_interface}" = "1" ]]; then
    echo "ui_canvas_color.patch"
    patch -uNp1 -i "${srcdir}/ui_canvas_color.patch"
  elif [[ "${_interface}" = "2" ]]; then
    echo "ui_karabaja_mod.patch"
    patch -uNp1 -i "${srcdir}/ui_karabaja_mod.patch"
  fi
  if [[ "${_show_idle_times}" = "1" ]]; then
    echo "ui_show_idle_times.patch"
    patch -uNp1 -i "${srcdir}/ui_show_idle_times.patch"
  fi
  if [[ "${_trackerinfo}" = "1" ]]; then
    echo "ui_trackerinfo.patch"
    patch -uNp1 -i "${srcdir}/ui_trackerinfo.patch"
  fi
  #kb
  if [[ "${_keybindings}" = "1" ]]; then
    echo "kb_vi_tjwoosta.patch"
    patch -uNp1 -i "${srcdir}/kb_vi_tjwoosta.patch"
  elif [[ "${_keybindings}" = "2" ]]; then
    echo "kb_vi_akston.patch"
    patch -uNp1 -i "${srcdir}/kb_vi_akston.patch"
  fi
  #}}}

  echo "fix_fatal_exception.patch"
  patch -uNp1 -i "${srcdir}/fix_fatal_exception.patch"

  sed -i 's/rTorrent \" VERSION/rTorrent-eXtended " VERSION/' \
    "src/ui/download_list.cc"

  ./autogen.sh
  CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing" \
    ./configure --prefix=/usr --disable-debug --with-xmlrpc-c "${_cfg_opts}"
  make
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
