# Maintainer: Michael Duell <akurei@luamail.net>
pkgname=enigmail-64-bin
_pkg_main_ver=1.2
pkgver=${_pkg_main_ver}
pkgrel=3
pkgdesc="The Mozilla Thunderbird GnuPG encryption plugin for 64-bit systems. Binary version."
arch=('x86_64')
url="http://www.mozilla-enigmail.org/"
license=('MPL')
_tb_min_ver="3.1"
depends=('thunderbird>=${_tb_min_ver}' 'xulrunner>=1.9.2')
makedepends=('unzip')
provides=('enigmail')
conflicts=('enigmail' 'enigmail-cvs')
install='enigmail-64-bin.install'
source=(http://www.mozilla-enigmail.org/download/release/${_pkg_main_ver}/enigmail-${pkgver}-tb.xpi)
noextract=(enigmail-${pkgver}-tb.xpi)
sha512sums=('2e8251944045dc0fef14958619a6f1bfbfeed5e1c08d5a62dd267ad60c297d1a3037a3fee097fb4afab4d2cf92efbaad4aeb2660305b07ffbfab3d47820fa83c')
_tb_version=$(pacman -Qi thunderbird|grep Version|cut -f 2 -d ":"|cut -f 2 -d " "|cut -f 1 -d -)

build() {
  cd "$srcdir/"
  unzip *.xpi
  _eid=$(grep "<em:id>" install.rdf | head -n 1 |cut -f 2 -d \>|cut -f 1 -d \<)
  mkdir -p "${pkgdir}/usr/lib/thunderbird-${_tb_version}/extensions/"
  unzip -q -d "${pkgdir}/usr/lib/thunderbird-${_tb_version}/extensions/${_eid}" *.xpi
}


# vim:set ts=2 sw=2 et:
