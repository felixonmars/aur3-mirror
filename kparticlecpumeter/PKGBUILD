# Contributor: Florian Loitsch <archlinux@florian.loitsch.com>

pkgname=kparticlecpumeter
pkgver=0.1
pkgrel=1
pkgdesc="Kicker applet that displays the CPU activity by spraying animated particles ine the small applet window."
url="http://www.haenselmann.de/indexhb_en.html"
license=('GPL')
depends=('kdebase')
arch=('i686')
source=("http://www.haenselmann.de/particle_cpu_meter/KParticleCPUMeter.tgz")
md5sums=('bbdc2283cda7e01e14b0d5ca622279a7')

build() {
	cd KParticleCPUMeter
	./configure --prefix=/opt/kde
	make || return 1
	make DESTDIR=$startdir/pkg install
}
