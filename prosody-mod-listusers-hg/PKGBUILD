# Maintainer: koral <koral at mailoo dot org>
pkgname=prosody-mod-listusers-hg
pkgrel=1
pkgver=`date +%Y%m%d`
pkgdesc="List prosody users through prosodyctl"
arch=('any')
url="https://code.google.com/p/prosody-modules/"
license=('MIT')
makedepends=('mercurial')
depends=('prosody')
source=("prosody-modules::hg+https://code.google.com/p/prosody-modules/")
sha256sums=('SKIP')

package() {
  install -Dm 644 "${srcdir}/prosody-modules/mod_listusers/mod_listusers.lua" "${pkgdir}/usr/lib/prosody/modules/mod_listusers.lua"
}
