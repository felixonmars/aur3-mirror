# Maintainer: Adi Rat <adi<<at>>adirat<<dot>>com>

pkgname=i8kutils-bzr
pkgver=r33
pkgrel=1
pkgdesc="Dell Inspiron/Latitude kernel driver and utilities"
arch=('i686' 'x86_64')
url="https://launchpad.net/i8kutils"
license=('GPL')
depends=('bash' 'acpi' 'tk')
conflicts=('i8kutils')
provides=('i8kutils')
makedepends=('bzr')
options=('strip')
backup=('etc/i8kutils/i8kmon.conf')
install=$pkgname.install
source=("$pkgname"::'bzr+https://launchpad.net/i8kutils/trunk'
        i8kmon.service
        i8k.hooks.initcpio
        i8k.install.initcpio)
sha1sums=('SKIP'
          '03cb0541e3b7da85259c134fb3791ad2df281b95'
          'b60a5731dd011d0e46bf06f7ea7be08e173ca888'
          '31678a27bc96819a0d98cfdc01a6a45b68344bd8')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $pkgname
  # conform to Arch Linux guidelines
  sed -i 's|/etc/i8kmon|/etc/i8kutils/i8kmon.conf|g' i8kmon.1
  sed -i 's|/etc/i8kmon.conf|/etc/i8kutils/i8kmon.conf|g' i8kmon
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/{bin,share/man/man1}
  install -D -m644 i8kctl.1 i8kmon.1 "$pkgdir/usr/share/man/man1"
  install -D -m755 i8kctl i8kfan i8kmon "$pkgdir/usr/bin"

  install -D -m644 i8kmon.conf "$pkgdir/etc/i8kutils/i8kmon.conf"
  install -D -m644 ../i8kmon.service "$pkgdir/usr/lib/systemd/system/i8kmon.service"

  install -D -m644 ../i8k.install.initcpio "$pkgdir/usr/lib/initcpio/install/i8k"
  install -D -m644 ../i8k.hooks.initcpio "$pkgdir/usr/lib/initcpio/hooks/i8k"
}
