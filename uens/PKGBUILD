# Maintainer: Alexander Neumann <alexander@bumpern.de>
pkgname=uens
pkgver=0.0.1
pkgrel=1
pkgdesc="Shell scripts to publish events to users."
arch=('any')
url='https://github.com/fd0/uens'
license=('BSD')
groups=()
depends=('bash')
backup=('etc/default/uens')
options=()
install=
source=(uens-listen uens-send LICENSE README.md)
sha1sums=(SKIP SKIP SKIP SKIP)

package() {
  cd "$srcdir"
  install -D -m 0755 uens-listen "$pkgdir/usr/bin/uens-listen"
  install -D -m 0755 uens-send "$pkgdir/usr/bin/uens-send"
  install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/uens"
  install -D -m 0644 README.md "$pkgdir/usr/share/doc/uens/README.md"
}
