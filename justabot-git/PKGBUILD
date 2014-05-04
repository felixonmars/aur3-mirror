# Maintainer: Kcchouette <kcchouette[at]gmail[dot]com>

pkgname=justabot-git
_pkgname=justabot
pkgver=20140503.ad2c702
pkgrel=2
pkgdesc="A bot for XMPP written for Python 3.x"
arch=(any)
url="http://www.librecase.eu/media/justabot/"
license=('custom:CECILL')
depends=('python>3.0.0', 'python-sleekxmpp' 'bash')
makedepends=('git')
optdepends=('python-dnspython: SRV support')
source=('git://gitorious.org/justabot/justabot.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd.%h' --date=short | tr -d - | sed 's/-/./'
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
