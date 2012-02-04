# Contributor: Coolaman <coolaman@free.fr>

pkgname=laptop-script
pkgver=1.5.2
pkgrel=2
pkgdesc="Simple bash script to manage acpi event and powersaving rules"
url="http://coolaman.free.fr"
arch=('any')
license=('GPL2')
backup=('etc/laptop-script.conf' 'usr/share/laptop-script/rules.sh')
depends=('bash>=4' 'cpufrequtils' 'acpi' 'xorg-utils')
optdepends=('xscreensaver' 'hal' 'upower')
conflicts=('laptop-mode-tools')
install=script_acpi.install
source=(http://coolaman.free.fr/downloads/$pkgname-$pkgver.tar.gz
	script_acpi.install)
	
md5sums=('6746c2226b6be39dff8f825f3fddb225' '41d5017cea8818a1457d35c6ae6581ae')

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  install -m 755 -D usr/bin/laptop-script $startdir/pkg/usr/bin/laptop-script &&
  install -m 755 -D usr/share/laptop-script/rules.sh $startdir/pkg/usr/share/laptop-script/rules.sh &&
  install -m 755 -D etc/laptop-script.conf $startdir/pkg/etc/laptop-script.conf &&
  install -m 755 -D etc/rc.d/laptop-script $startdir/pkg/etc/rc.d/laptop-script &&
  install -m 755 -D etc/pm/sleep.d/45laptop-script $startdir/pkg/etc/pm/sleep.d/45laptop-script &&
  install -m 644 -D usr/share/laptop-script/helpers/README $startdir/pkg/usr/share/laptop-script/helpers/README &&
  install -m 644 -D usr/share/laptop-script/helpers/COPYING $startdir/pkg/usr/share/laptop-script/helpers/COPYING &&
  install -m 644 -D usr/share/laptop-script/helpers/INSTALLATION $startdir/pkg/usr/share/laptop-script/helpers/INSTALLATION || return 1
  install -m 644 -D usr/share/laptop-script/helpers/genmon_plugin_battery.tar.gz $startdir/pkg/usr/share/laptop-script/helpers/genmon_plugin_battery.tar.gz || return 1
}
