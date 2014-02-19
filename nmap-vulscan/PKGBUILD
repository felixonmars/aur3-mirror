# Maintainer: icoz <icoz.vt at gmail dot com>
pkgname=nmap-vulscan
pkgver=2.0
pkgrel=4
pkgdesc="Vulscan script for nmap"
arch=('any')
url="http://www.computec.ch/projekte/vulscan/"
license=('custom')
depends=('nmap')
install='nmap-vulscan.install'
source=("nmap_nse_vulscan-2.0.tar.gz::http://www.computec.ch/projekte/vulscan/download/nmap_nse_vulscan-2.0.tar.gz"
        "nmap-vulscan.install")

md5sums=('1a48a563112f7d4ed132994b785b521a'
		'64d666295938315bf8f2e020139fa054')

package() {
	# tar zxf nmap_nse_vulscan-2.0.tar.gz -C "$srcdir"/
	# install -d "$pkgdir"/usr/share/nmap/scripts/
	install -d "${pkgdir}"/usr/share/nmap/scripts/vulscan/
	install -D -m644 ${srcdir}/vulscan/* ${pkgdir}/usr/share/nmap/scripts/vulscan
	# #install all game files to /opt
	# cd "$srcdir"/fieldrunners/fieldrunners
	# install -d "$pkgdir"/opt/fieldrunners
	# find -type f -exec install -Dm644 {} "$pkgdir"/opt/fieldrunners/{} \;
	# chmod +x "$pkgdir"/opt/fieldrunners/Fieldrunners
	# cd "$srcdir"

	# #install game icon
	# install -D -m644 ${srcdir}/icon.png ${pkgdir}/opt/fieldrunners/

	# #install application shortcut
	# install -d ${pkgdir}/usr/share/applications
	# install -D -m644 ${srcdir}/fieldrunners.desktop ${pkgdir}/usr/share/applications/

	# #install launcher
	# install -d "$pkgdir"/usr/bin
	# ln -s /opt/fieldrunners/Fieldrunners "$pkgdir"/usr/bin/fieldrunners

	# #install patch
	# if [ "${_use_patch}" == "1" ]; then
	# 	install -D -m755 ${srcdir}/frfix-32.so.prebuilt ${pkgdir}/opt/fieldrunners/
	# 	install -D -m755 ${srcdir}/frfix-64.so.prebuilt ${pkgdir}/opt/fieldrunners/
	# 	install -D -m644 ${srcdir}/frfix.c ${pkgdir}/opt/fieldrunners/
	# 	install -D -m755 ${srcdir}/build.sh ${pkgdir}/opt/fieldrunners/
	# 	install -D -m755 ${srcdir}/launch.sh ${pkgdir}/opt/fieldrunners/
	# 	cd ${pkgdir}/opt/fieldrunners/
	# 	source build.sh
	# 	cd -
	# 	rm -rf ${pkgdir}/opt/fieldrunners/frfix-32.so.prebuilt
	# 	rm -rf ${pkgdir}/opt/fieldrunners/frfix-64.so.prebuilt
	# 	rm -rf ${pkgdir}/opt/fieldrunners/frfix.c
	# 	rm -rf ${pkgdir}/opt/fieldrunners/build.sh
	# fi
}
