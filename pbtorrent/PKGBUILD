# Contributor: Army <uli[dot]armbruster[at]gmail[dot].com>
pkgname=pbtorrent
pkgver=0.2
pkgrel=3
pkgdesc="a script to browse and/or search thepiratebay.org"
url="http://bash.madskas.net"
license=('GPL')
depends=('bash' 'wget')
source=(${pkgname})
arch=(any)

build() {
  install -D -m755 ${srcdir}/pbtorrent $pkgdir/usr/bin/pbtorrent
}

md5sums=('ff338418f22e8f3b6dedbcd6b0aac5d2')
