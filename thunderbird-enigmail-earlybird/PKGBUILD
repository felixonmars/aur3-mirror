# Maintainer: Hardolaf <hardolaf@gmail.com>
# Adapated from thunderbird-enigmail-nightly from
#   skydrome <skydrome@i2pmail.org>

pkgname=thunderbird-enigmail-earlybird
_pkgname=enigmail-nightly
pkgver=1.7a1
pkgrel=7
_tb_ver=33.0a2
pkgdesc='OpenPGP security extension for Thunderbird - Earlybird build'
url='http://www.mozilla-enigmail.org/download/nightly.php'
arch=('i686' 'x86_64')
license=('MPL')
depends=("thunderbird-earlybird>=${_tb_ver}" 'gnupg')
makedepends=('unzip')
provides=('enigmail-nightly')
options=(!strip)

source=("https://www.enigmail.net/download/nightly/${_pkgname}-all.xpi")
md5sums=('SKIP')

_extension_id='{847b3a00-7ab1-11d4-8f02-006008948af5}'

package() {
      cd "$srcdir"
      mkdir -p "${pkgdir}/opt/thunderbird-earlybird/extensions"
      unzip "${_pkgname}-all.xpi" -d "${pkgdir}/opt/thunderbird-earlybird/extensions/${_extension_id}"
      rm -rf "${pkgdir}/opt/thunderbird-earlybird/extensions/${_extension_id}/platform/"{Darwin,WINNT}*
}
