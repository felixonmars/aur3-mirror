# Maintainer: Maxwell Pray a.k.a. Synthead

pkgname=openfire-kraken-gateway-plugin-beta
pkgver=1.1.3_beta3
pkgrel=1
pkgdesc="Kraken is a continuation of the Openfire IM Gateway plugin, but in a way that works for any XMPP server. It provides a way for XMPP users to log into, and communicate through, their legacy IM accounts such as AIM, ICQ, MSN, Yahoo, and friends."
arch=('any')
url="http://community.igniterealtime.org/community/plugins/im_gateway_support"
license=('GPL')
depends=('openfire')
conflicts=('openfire-kraken-gateway-plugin')
provides=('openfire-kraken-gateway-plugin')
source=("http://downloads.sourceforge.net/project/kraken-gateway/kraken-gateway/1.1.3%20beta%203/kraken.jar")
md5sums=('0a8a1fe9b4cd7eaa63b2cab8cfd8ce3e')

package() {
  install -Dm 644 "$srcdir/kraken.jar" "$pkgdir/opt/openfire/plugins/kraken.jar"
}

