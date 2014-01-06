# Maintainer: Thomas Lercher <thomas.lercher@gmail.com>
pkgname=prosody-mod-idlecompat
pkgver=20140105
pkgrel=1
pkgdesc="Addd support for XEP-0319: Last User Interaction in Presence"
arch=('any')
url="http://code.google.com/p/prosody-modules/wiki/mod_idlecompat"
license=('MIT')
depends=('prosody')
source=("https://prosody-modules.googlecode.com/hg-history/4e14ad802d58d141234b6c5cf83b076cf2f8eed8/mod_idlecompat/mod_idlecompat.lua")
sha1sums=('51d32daa78d818c74e7d8da01d40ccf6e7c4d955')
package() {
  install -Dm 644 "mod_idlecompat.lua" "${pkgdir}/usr/lib/prosody/modules/mod_idlecompat.lua"
}
