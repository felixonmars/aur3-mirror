# Maintainer: Maxwell Pray a.k.a. Synthead

pkgname=openfire-kraken-gateway-plugin
pkgver=1.1.2
pkgrel=1
pkgdesc="Kraken is a continuation of the Openfire IM Gateway plugin, but in a way that works for any XMPP server. It provides a way for XMPP users to log into, and communicate through, their legacy IM accounts such as AIM, ICQ, MSN, Yahoo, and friends."
arch=('any')
url="http://community.igniterealtime.org/community/plugins/im_gateway_support"
license=('GPL')
depends=('openfire')
conflicts=('openfire-kraken-gateway-plugin-beta')
source=("http://downloads.sourceforge.net/project/kraken-gateway/kraken-gateway/$pkgver/kraken.jar")
md5sums=('09f71b8b0f7b5635ab6f802d6f7f430a')

package() {
  install -Dm 644 "$srcdir/kraken.jar" "$pkgdir/opt/openfire/plugins/kraken.jar"
}

