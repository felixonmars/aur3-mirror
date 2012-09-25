# Package created by: Dominik Mayer <dominik.mayer@gmail.com>
# Maintainer: Thomas Kinnen <thomas.kinnen@gmail.com> 
pkgname=lidsleep
pkgver=1.0
pkgrel=2
pkgdesc="Suspends the laptop to RAM after the lid is closed."
arch=('any')
url="https://wiki.archlinux.org/index.php/Suspending_to_Disk_with_hibernate-script#After_closing_lid"
license=('unknown')
depends=('pm-utils' 'acpid')
source=(lid)
md5sums=('158b2052fc6405bea540317e54b92f0e')    
install='lidsleep.install'

build() {
  mkdir "$pkgdir/etc"
  mkdir "$pkgdir/etc/acpi"
  mkdir "$pkgdir/etc/acpi/events"
  cp lid $pkgdir/etc/acpi/events
}
