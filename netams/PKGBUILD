# Contributor: goom <psylinuxoid@gmail.com>
pkgname="netams"
pkgver=3.4.3
pkgrel=1
pkgdesc="Network Traffic Accounting and Monitoring Software"
arch=(i686 x86_64)
license="GPL3"
url="http://www.netams.com/"
depends=(mysql)
depends=(libmysqlclient)
depends=(libmm)
depends=(libpcap)
depends=(libstdc++)
depends=(iptables)
#install=$pkgname.install
source=(http://www.netams.com/files/$pkgname-$pkgver.tar.gz for_arch_linux.1.0.patch mf.patch rc.patch)
md5sums=('bb9427cdeacf61bf780fc9a03935ca26'
         'f6626c222121c381077411560774625c'
         '360777380e8aa16f3ecc6b7f3ed9c71b'
         '1322d584caa2790d48740dd22d4c0027')
build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -Np0 -i ${startdir}/for_arch_linux.1.0.patch
	patch -Np0 -i ${startdir}/mf.patch
	sed "s/usr\/bin\/install/bin\/install/" -i configure.sh
	make || return 1
	make DESTDIR=${startdir}/pkg install
	cd $startdir/pkg/etc/rc.d/
	patch -Np0 -i $startdir/rc.patch
	mv ./netams-linux-startup.sh ./netams
}
