# Maintainer (Arch): Daniel Micay <danielmicay@gmail.com>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Gaming4JC <gaming4jc2@yahoo.com>

_pkgname=paxd
pkgname=paxd-libre
pkgver=1.3
pkgrel=2
pkgdesc='PaX exception daemon (a libre fork of paxd)'
arch=(i686 x86_64)
url='https://github.com/g4jc/paxd-libre/'
license=(MIT)
replaces=($_pkgname linux-pax-flags)
conflicts=($_pkgname linux-pax-flags)
provides=($_pkgname linux-pax-flags)
depends=(glibc)
source=(https://github.com/g4jc/paxd-libre/archive/$pkgver.tar.gz 10-enable-pax.conf
        fix_issues.patch)
md5sums=('0eb1c2271cd3e893d4ed1bdf4772d714'
         'a40677d2cd39ada4c2560927c67e0ea2'
         'b4c7f8929ddcf94e19155d27c11d0231')
backup=(etc/paxd-libre.conf)

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir/fix_issues.patch"
}

build() {
  cd $pkgname-$pkgver
  make CC=gcc
}

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir/usr/lib/systemd/system/sysinit.target.wants"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../10-enable-pax.conf "$pkgdir/usr/lib/sysctl.d/10-enable-pax.conf"
}
