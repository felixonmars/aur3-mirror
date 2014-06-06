# Maintainer: Blemjhoo Tezoulbr <tezoulbr@gmail.com>

pkgname=backup-tools
pkgver=13a
pkgrel=1
pkgdesc='Simple system/user backup wrapper'
arch=('any')
url='https://github.com/tezoulbr/backup-tools'
license=('GPL')
depends=('bash')
optdepends=('libnotify: for user notifications'
            'rsync: for actual backuping'
            'areca: user-friendly backup program')
makedepends=('python-docutils')
backup=('etc/backup-tools.conf')
install='backup-tools.install'
source=("https://github.com/tezoulbr/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('8b01d9168fcff42259e18b96533416cabbe44630')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make man
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
