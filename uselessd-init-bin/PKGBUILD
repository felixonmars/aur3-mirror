# Maintainer: Zatherz <zatherz[at]linux[dot]com>
pkgname=uselessd-init-bin
pkgver=1.0
pkgrel=1
pkgdesc="Link /usr/lib/systemd/uselessd to /usr/bin/init"
url="http://github.com/Zatherz/qwebapp/"
arch=('any')
license=('GPLv2')
depends=('uselessd')
makedepends=('')
source=("init")
md5sums=("477fa5f341cd48eba8908d84858236e9")

package() {
	install -D init "$pkgdir/usr/bin/init"

}
