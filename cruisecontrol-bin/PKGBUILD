# Maintainer: Kim Silkebækken <kim.silkebaekken+archlinux@gmail.com>
# Contributor: Spider.007 <archPackage@spider007.net>

pkgname=cruisecontrol-bin
pkgver=2.8.4
pkgrel=1
pkgdesc="A continuous integration tool and an extensible framework for creating a custom continuous build process."
arch=(any)
url="http://sourceforge.net/projects/cruisecontrol/"
license=("BSD")
depends=("java-environment>=5")
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/cruisecontrol/CruiseControl/${pkgver}/cruisecontrol-bin-${pkgver}.zip"
        "cruisecontrol.init")
md5sums=('8446c68c4df726dcb53e96bd3acf077a'
         '4e38d34d62bfb6ae854e1f530846c683')

build() {
	# Create directories
	install -d ${pkgdir}/{opt,var/{log,run},etc/rc.d}

	# Install init script
	install -D -m755 ${srcdir}/cruisecontrol.init ${pkgdir}/etc/rc.d/cruisecontrol

	# Install source
	cp -R ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/opt/cruisecontrol

	# Create log and pid files
	touch ${pkgdir}/var/log/cruisecontrol.log \
	      ${pkgdir}/var/run/cruisecontrol.pid

	# Put PID file in /var/run
	sed -i 's|echo $!.*|echo $! > /var/run/cruisecontrol.pid|1' ${pkgdir}/opt/cruisecontrol/cruisecontrol.sh
}
