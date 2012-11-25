# Maintainer: Eric Renfro <erenfro@gmail.com>

pkgname=ha-heartbeat
pkgver=3.0.5
pkgrel=2
pkgdesc="Daemon that provides cluster infrastructure services to its clients"
arch=('i686' 'x86_64')
url="http://linux-ha.org/wiki/Heartbeat"
license=('GPL')
makedepends=('docbook-xsl')
depends=('ha-glue' 'gnutls')
source=("http://hg.linux-ha.org/heartbeat-STABLE_3_0/archive/STABLE-${pkgver}.tar.bz2")
md5sums=('f8686abde8722c42265c6d84fbe3d3bf')
options=('!libtool' 'strip' '!emptydirs')
build() {
	_CLUSTER_USER=hacluster
	_CLUSTER_GROUP=haclient
	_PREFIX=/usr
	_PREFIXETC=/etc
	_PREFIXINIT=${_PREFIXETC}/rc.d
	_PREFIXVAR=/var
	cd "${srcdir}/Heartbeat-3-0-STABLE-${pkgver}"
	./bootstrap
	./configure \
		--prefix=$_PREFIX \
		--localstatedir=${_PREFIXVAR} \
		--sysconfdir=${_PREFIXETC} \
		--with-initdir=${_PREFIXINIT} \
		--enable-static=no \
		--enable-fatal-warnings=no
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1

	for py in `grep -r -l "\#\!\/usr\/bin\/python" ${pkgdir}`;do
		sed -i.bk 's:/usr/bin/python$:/usr/bin/python2:g' ${py}
	done 
	for py in `grep -r -l "\#\!\/usr\/bin\/env python" ${pkgdir}`;do
		sed -i.bk 's:/usr/bin/env python$:/usr/bin/env python2:g' ${py}
	done
	#end python path correction

}
