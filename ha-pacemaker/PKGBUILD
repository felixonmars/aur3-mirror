# Maintainer: Eric Renfro <erenfro@gmail.com>

pkgname=ha-pacemaker
pkgver=1.1.8
pkgrel=20121217
pkgdesc="Pacemaker is an cluster resource manager"
arch=('i686' 'x86_64')
url="http://linux-ha.org/wiki/Pacemaker"
license=('GPL')
makedepends=('libqb' 'corosync')
depends=('ha-resourceagent' 'ha-heartbeat' 'libxslt' 'libqb' 'corosync')
source=("https://github.com/ClusterLabs/pacemaker/archive/3f6e0f0ec7584fe773fd6779f28377cd126b1648.tar.gz")

md5sums=('2680c8e3c52626a808cbee9a396e7438')
options=('!libtool' 'docs' 'strip')

build() {
	unset LDFLAGS
	_CLUSTER_USER=hacluster
	_CLUSTER_GROUP=haclient
	_PREFIX=/usr
	_PREFIXETC=/etc
	_PREFIXINIT=${_PREFIXETC}/rc.d
	_PREFIXVAR=/var
	_LCRSODIR=${_PREFIX}/lib/lcrso
	#cd "${srcdir}/pacemaker-Pacemaker-${pkgver}"
	cd "${srcdir}/pacemaker-3f6e0f0ec7584fe773fd6779f28377cd126b1648"
	./autogen.sh
	./configure \
		--enable-fatal-warnings=no \
		--prefix=${_PREFIX} \
		--localstatedir=${_PREFIXVAR} \
		--sysconfdir=${_PREFIXETC} \
		--with-initdir=${_PREFIXINIT} \
		--with-lcrso-dir=${_LCRSODIR} \
		--with-ais \
		--with-corosync \
		--with-heartbeat \
		--with-snmp
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1
	
	#fix phython
	#sed -i.bk 's:/usr/bin/python:/usr/bin/python2:g' ${pkgdir}/usr/sbin/crm
	#cp ${srcdir}/crm2 ${pkgdir}/usr/sbin/crm2
	#chmod 755 ${pkgdir}/usr/sbin/crm2
	#chown root:root ${pkgdir}/usr/sbin/crm2
}
