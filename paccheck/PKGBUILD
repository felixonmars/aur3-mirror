# Maintainer: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
# Original creator: IgnorantGuru http://igurublog.wordpress.com
pkgname=paccheck
pkgver=1.7
pkgrel=1
pkgdesc="pacman checking tool using multiple mirrors to help detect possibly compromised ones"
arch=(any)
depends=('wget' 'curl' 'gnupg')
backup=('etc/paccheck/mirrorlist')
license=('GPL3')
changelog=ChangeLog
url="https://github.com/berbae"
source=("https://github.com/berbae/paccheck/raw/master/$pkgname-$pkgver.sh" "mirrorlist")
sha256sums=('a744e1d112200e945e9a2e6bb195588ca4d804d553eba0d661ac39138db2497c'
            '86de83ee1c22576bdad415c2be2eb379600d8cdbb145e45afe4cef8cfba2965f')

package() {
	install -D "$srcdir/$pkgname-$pkgver.sh" "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/etc/paccheck"
	install -Dm666 "$srcdir/mirrorlist" "$pkgdir/etc/paccheck/"
}

