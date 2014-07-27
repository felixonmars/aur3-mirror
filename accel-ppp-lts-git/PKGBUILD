# Maintainer: Alexandr Boiko <brdcom@ya.ru>
pkgname=accel-ppp-lts-git
pkgver=20140726
pkgrel=18
pkgdesc="High performance PPTP/L2TP/PPPoE/IPoE server"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('openssl>=0.9.8' 'pcre' 'libnl')
makedepends=('git' 'cmake>=2.6' 'libnl1' 'net-snmp>=5.x' 'lua51' 'linux-lts-headers')
conflicts=('accel-ppp' 'accel-ppp-git')
install='accel-ppp.install'
options=('docs')
backup=('etc/accel-ppp.conf' 'etc/accel-ppp.lua' 'etc/snmp/accel-ppp.conf')
source=(accel-ppp-default
	accel-ppp.lua
	accel-ppp.tmpfiles
	accel-pppd.service
	ipoe.conf)
md5sums=('bb3e20c8808000f4efe52230c13a13f3'
         '23e32b0d758be2adf0f7b6987857afc2'
         '5be7d42b434b74d7e692b19a9e3c4297'
         'e5dec17bd405052fc647a805db5dd449'
         'ecf99787915602dcedef531d5f8c42c9')

_gitroot=git://accel-ppp.git.sourceforge.net/gitroot/accel-ppp/accel-ppp
_gitname=accel-ppp

build() {
	cd $srcdir
	msg "Connecting to GIT server...."
	
	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
		cd $srcdir
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -fr "$srcdir/$_gitname-build"
	mkdir "$_gitname-build"
	cd "$_gitname-build"
	sed -i 's|RUNTIME DESTINATION sbin|RUNTIME DESTINATION bin|' \
	"../$_gitname/accel-pppd/CMakeLists.txt"
		
	cmake \
		-DCMAKE_SYSTEM_NAME=Linux \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Debug \
		-DLOG_FILE=TRUE \
		-DLOG_PGSQL=FALSE \
		-DCPACK_TYPE=Archlinux \
		-DSHAPER=TRUE \
		-DRADIUS=TRUE \
		-DNETSNMP=TRUE \
		-DLUA=TRUE \
		-DLUA_INCLUDE_DIR="/usr/include/lua5.1" \
		-DBUILD_IPOE_DRIVER=TRUE \
		-DKDIR="/usr/lib/modules/`uname -r`/build" \
		"../$_gitname/"
	make || return 1
}
package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install || return 1

	install -d -m0755 "$pkgdir/etc/snmp"
	touch "$pkgdir/etc/snmp/$_gitname.conf"
	install -Dm0644 "$srcdir/${_gitname}.lua" "$pkgdir/etc/${_gitname}.lua"
	install -Dm0644 "$srcdir/$_gitname-default" "$pkgdir/etc/conf.d/accel-pppd"
	install -Dm0644 "$srcdir/$_gitname/README" "$pkgdir/usr/share/doc/${_gitname}/README"
	install -Dm0644 "$srcdir/accel-pppd.service" "$pkgdir/usr/lib/systemd/system/accel-pppd.service"
	install -Dm0644 "$srcdir/${_gitname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_gitname}.conf"
	install -Dm0644 "$srcdir/ipoe.conf" "$pkgdir/usr/lib/modules-load.d/ipoe.conf"
	install -Dm0644 "$srcdir/$_gitname/accel-pppd/${_gitname}.conf" "$pkgdir/etc/${_gitname}.conf"
	install -Dm0644 "$srcdir/$_gitname/accel-pppd/extra/net-snmp/ACCEL-PPP-MIB.txt" "$pkgdir/usr/share/snmp/mibs/ACCEL-PPP-MIB.txt"
	install -Dm0644 "$srcdir/$_gitname-build/drivers/ipoe/driver/ipoe.ko" "$pkgdir/usr/lib/modules/`uname -r`/extramodules/ipoe.ko"
}
