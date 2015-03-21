# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-https-everywhere-dev
pkgver=5.0development.4
pkgrel=1
pkgdesc='Encrypt the Web! Automatically use HTTPS security on many sites.'
url=https://www.eff.org/https-everywhere
arch=('any')
license=('custom:GPLv3+')
depends=('firefox')
makedepends=('unzip')
conflicts=('firefox-extension-https-everywhere')
source=("https://www.eff.org/files/https-everywhere-$pkgver.xpi"
        "LICENSE.https-everywhere::https://raw.githubusercontent.com/EFForg/https-everywhere/$pkgver/LICENSE.txt")
noextract=("https-everywhere-$pkgver.xpi")
sha256sums=('961df018440ed1e953c9a37e9a9d5da8be6f9658a1385f476270c37c4c26f89e'
            '655ca63dcf8481faaa3abff12ee4aae539e44617a1808fe70c6f1b75a1f35355')

prepare() {
  # Workaround bsdtar bug
  unzip -qo https-everywhere-$pkgver.xpi
}

package() {
  local GLOBIGNORE=*.xpi:LICENSE.https-everywhere
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/https-everywhere@eff.org

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
  install -D LICENSE.https-everywhere "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
