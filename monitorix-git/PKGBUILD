# Contributor: graysky <graysky AT archlinux dot us>

pkgname=monitorix-git
_pkgname=monitorix
pkgver=705b966
pkgrel=1
pkgdesc='A lightweight system monitoring tool that uses rrd databases. Git version.'
arch=('any')
url='http://www.monitorix.org'
license=('GPL')
depends=('perl' 'perl-cgi' 'perl-mailtools' 'perl-mime-lite' 'perl-libwww'
'perl-dbi' 'perl-xml-simple' 'perl-config-simple' 'perl-config-general'
'rrdtool' 'perl-http-server-simple')
optdepends=(
	'anything-sync-daemon: offload your databases to tmpfs to save i/o to your disk.'
	'hddtemp: enable support for hdd temp monitoring.'
	'lm_sensors: enable support for system temp monitoring.'
	'nvidia: enable support for nVidia card temp and usage monitoring.'
	'smartmontools: enable support for hdd bad sector monitoring.'
	'terminus-font: if graphs do not contain characters, you may need this font package.')
conflicts=$_pkgname
backup=(etc/$_pkgname/$_pkgname.conf etc/$_pkgname.conf)
install=readme.install
source=("git://github.com/mikaku/$_pkgname.git")
sha256sums=('SKIP')
_basedir="srv/http/monitorix"
_libdir="var/lib/$_pkgname"


pkgver() {
	cd $"_pkgname"
	git describe --always | sed 's|-|.|g'
}

prepare() {
	cd "$_pkgname"

	# use Arch default location for http servers and enable built-in httpd
	sed -i -e '/^base_dir/ s,var\/lib\/monitorix\/www,srv\/http\/monitorix,' \
		-i -e '/^<httpd_builtin>/{$!N; s/y/n/}' $_pkgname.conf
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" BASEDIR=/srv/http/monitorix \
		WWWDIR=/srv/http/monitorix install-systemd-all

	# Arch provides the license so do not duplicate it
	rm -f "$pkgdir/usr/share/doc/$_pkgname/COPYING"
	
	# remove unneed files
	rm -f "$pkgdir/usr/share/doc/$_pkgname/README.OpenBSD"
	rm -f "$pkgdir/usr/share/doc/$_pkgname/README.NetBSD"
	rm -f "$pkgdir/usr/share/doc/$_pkgname/README.FreeBSD"
}
