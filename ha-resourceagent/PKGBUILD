pkgname=ha-resourceagent
pkgver=3.9.5
pkgrel=1
pkgdesc='A standardized interface for a cluster resource'
arch=('i686' 'x86_64')
url='http://linux-ha.org/wiki/Resource_Agents'
license=('GPL')
depends=('ha-glue')
makedepends=('automake-1.12')
source=("https://github.com/ClusterLabs/resource-agents/archive/v${pkgver}.tar.gz")
md5sums=('c7a2b2bd1e5a87142d1757439406d57c')
build() {
	_CLUSTER_USER=hacluster
	_CLUSTER_GROUP=haclient
	_PREFIX=/usr
	_PREFIXETC=/etc
	_PREFIXINIT=${_PREFIXETC}/rc.d
	_PREFIXVAR=/var
	cd "${srcdir}/resource-agents-${pkgver}"

	# Does not build with latest automake
	export ACLOCAL='/usr/bin/aclocal-1.12'
	export AUTOMAKE='/usr/bin/automake-1.12'

	./autogen.sh
	./configure \
		--prefix=$_PREFIX \
		--localstatedir=${_PREFIXVAR} \
		--sysconfdir=${_PREFIXETC} \
		--with-initdir=${_PREFIXINIT}
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1

	#cp ${pkgdir}/usr/lib/ocf/lib/heartbeat/ocf-shellfuncs ${pkgdir}/usr/lib/ocf/resource.d/heartbeat/.ocf-shellfuncs
	#python path correction
	for py in `grep -r -l "\#\!\/usr\/bin\/python" ${pkgdir}`;do
		sed -i 's:/usr/bin/python$:/usr/bin/python2:g' ${py}
	done
	for py in `grep -r -l "\#\!\/usr\/bin\/env python" ${pkgdir}`;do
		sed -i 's:/usr/bin/env python$:/usr/bin/env python2:g' ${py}
	done
	#end python path correction

}

