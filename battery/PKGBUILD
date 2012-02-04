# Contributor: Ali Gündüz <gndz.ali@gmail.com>
pkgname=battery
pkgver=1.0
pkgrel=1
pkgdesc="Prints last full and remaining battery capacities in plaintext"
arch=(i686 x86_64)
url="http://aligunduz.org/"
license=('Public Domain')
depends=('acpi')
source=()
md5sums=()

build() {
  cd "$srcdir"

  touch $pkgname
  echo "#!/bin/bash" > $pkgname
  echo "#prints battery capacity" >> $pkgname
  echo "cat /proc/acpi/battery/BAT*/info |grep full" >> $pkgname
  echo "cat /proc/acpi/battery/BAT*/state |grep remaining" >> $pkgname

  chmod +x $pkgname

  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
