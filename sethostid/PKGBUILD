# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=sethostid
pkgver=1
pkgrel=1
pkgdesc="Set the hostid"
arch=('i686' 'x86_64' 'armel')
url="https://gist.github.com/Manouchehri/dffa79ebc87727361e87"
license=('GPL2')
depends=('bash')  # Not really needed
source=("$pkgname::git://gist.github.com/dffa79ebc87727361e87.git")
sha512sums=('SKIP')

package() {
  install -Dm 0755 "$srcdir/$pkgname/sethostid.sh" "$pkgdir/usr/bin/$pkgname"
}
