# Contributor: katanasov <pranayama111@gmail.com>
# Mainteiner: katanasov
pkgname=faur
pkgver=20150312
pkgrel=1
pkgdesc="Simple AUR helper implemented in Scheme"
arch=('any')
url="https://github.com/KostadinAtanasov/faur"
license=('GPL')
depends=('pacman' 'racket')
provides=('faur')
source=($pkgname-$pkgver.zip::https://github.com/KostadinAtanasov/faur/archive/v0.2.zip)
sha1sums=('bc6e50c04c55de90727c65ec810078389b3d4628')

package() {
	cd "$srcdir"
	test -d "$pkgdir/usr/bin" || mkdir -p "$pkgdir/usr/bin"
	find -name faur.scm -type f -exec cp '{}' "$pkgdir/usr/bin/faur" \;
	chmod 755 "$pkgdir/usr/bin/faur"
}
