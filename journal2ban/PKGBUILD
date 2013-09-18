# Maintainer: Bram Neijt <bneijt@gmail.com>
pkgname=journal2ban
pkgver=0.0.1
pkgrel=1
pkgdesc="Script to send hosts failing to login to an ipset for blocking"
arch=('any')
url="https://github.com/bneijt/journal2ban"
license=('GPL3')
depends=('ipset' 'python>=3.0.0')
optdepends=('systemd')
source=(https://github.com/bneijt/journal2ban/archive/v$pkgver.tar.gz)
md5sums=('d58d8ceb113d12575eda6f30ed365447')

package() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp journal2ban.py "$pkgdir/usr/bin"
    
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp journal2ban.service "$pkgdir/usr/lib/systemd/system"
}
