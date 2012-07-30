# Maintainer: Esa Määttä <iki.fi: esa.maatta>

pkgname=goanysync
pkgver=1.02
pkgrel=1
epoch=
pkgdesc="Symlinks and syncs user specified dirs to RAM (tmpfs) thus reducing HDD/SDD calls and speeding-up the system."
arch=('x86_64' 'i686')
url="https://github.com/wor/$pkgname"
license=('GPL')
groups=()
depends=('rsync' 'systemd-tools')
makedepends=('gzip' 'txt2man' 'go')
checkdepends=()
optdepends=('cron: allow hourly (default) syncs between SSD and tmpfs.')
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=("etc/${pkgname}.conf")
options=()
install=${pkgname}.install
changelog=
source=(https://github.com/downloads/wor/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 sts=2 et:
sha1sums=('c5ee4179a728ebd2ff2c1efa845ad7c2d0996dfd')
