# Maintainer: Thomas Lercher <thomas.lercher@gmail.com>
pkgname=prosody-mod-s2s-never-encrypt-blacklist
pkgver=20130307
pkgrel=1
pkgdesc="Filter out servers which gets choppy and buggy when it comes to starttls."
arch=('any')
url="http://code.google.com/p/prosody-modules/wiki/mod_s2s_never_encrypt_blacklist"
license=('MIT')
depends=('prosody')
source=("https://prosody-modules.googlecode.com/hg-history/c08b424583c36e21a24c1eca31c8e6c496676a83/mod_s2s_never_encrypt_blacklist/mod_s2s_never_encrypt_blacklist.lua")
sha1sums=('1cc0e26bb328e1443fe47fa3bb1086773619baaa')
package() {
  install -Dm 644 "mod_s2s_never_encrypt_blacklist.lua" "${pkgdir}/usr/lib/prosody/modules/mod_s2s_never_encrypt_blacklist.lua"
}
