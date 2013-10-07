# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: C0DEA350

pkgname=enigmail-bin
_pkg_main_ver=1.6
pkgver=${_pkg_main_ver}
pkgrel=1
pkgdesc="The Mozilla Thunderbird GnuPG encryption plugin for both 32 and 64 bit systems. Binary version."
arch=('i686' 'x86_64')
url="http://www.mozilla-enigmail.org/"
license=('MPL')
depends=("thunderbird")
makedepends=('unzip')
provides=('enigmail')
conflicts=('enigmail' 'enigmail-cvs')
replaces=('enigmail-64-bin')
options=(!strip)
install='enigmail-bin.install'
source=(http://www.mozilla-enigmail.org/download/release/${_pkg_main_ver}/enigmail-${pkgver}-sm+tb.xpi)
noextract=(enigmail-${pkgver}-sm+tb.xpi)

package() {
  cd "$srcdir/"
  unzip -qo *.xpi
  _eid=$(grep "<em:id>" install.rdf | head -n 1 |cut -f 2 -d \>|cut -f 1 -d \<)
  mkdir -p "${pkgdir}/usr/lib/thunderbird/extensions/"
  unzip -qo -d "${pkgdir}/usr/lib/thunderbird/extensions/${_eid}" *.xpi
}

sha512sums=('8da596ff7011059cd2bdedcfac6c8f28416e1ffa5b73a7c4a425e7432f37c93b360eb7234261fcc137f4c0886bfc8d8f0af10fea560c7d7dae797991b9b7babd')
