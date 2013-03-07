# Maintainer: F0ruD <fzerorubigd at gmail dot com>
# Contributor: Bob Fanger < bfanger(at)gmail >
pkgname=zsce-core
pkgver=6.0
pkgrel=2
_phpver=5.3.8
pkgdesc="Zend Server Community Edition (CE) is a high-performance, reliable PHP Application Server that is absolutely free to use in development or in production."
arch=('i686' 'x86_64')
url="http://www.zend.com/en/community/zend-server-ce"
license=('unknown')
provides=('zend-server-ce')
depends=() 
makedepends=('diffutils') 
optdepends=('mysql: for complete the apache-php and mysql set'
	    'zsce-phpmyadmin: install phpmyadmin on zend server- the original one need php' )
#first one is dummy, see bellow
md5sums=('0eb2987b64030a69080979d2bef135f2')


source=(http://www.zend.com/download/653?start=true)
install=$pkgname.install

conflicts=()

_address="ZendServer-${pkgver}_Tarball_M42-php5.3.7RC4-linux-glibc23-${_arch}"
build() {
	cp install.patch ${srcdir}/${_address}
  	cd ${srcdir}
	cd ${_address}
	patch -Np1 -i ./install.patch

	# extract files
	./7z x -o${pkgdir}/opt -y zend.7z 
	if [ $? -ne 0 ];then 
		echo "Failed to extract files.. "
		return 1
	fi
	cp ${srcdir}/zsce-core.html ${pkgdir}/opt/zend/
	mkdir ${pkgdir}/etc
	touch ${pkgdir}/etc/zce.rc 
	mkdir ${pkgdir}/etc/rc.d
	cp ${pkgdir}/opt/zend/bin/zendctl.sh ${pkgdir}/etc/rc.d/zendserverce
	chmod 755 ${pkgdir}/opt # set default rights on /opt
	chmod 755 ${pkgdir}/etc # set default rights on /etc
	# Add installer to the package
	installer_file=${pkgdir}/opt/zend/install.sh
	cp install.sh ${installer_file}
	sed -i 's/\/usr\/local/\/opt/g' ${pkgdir}/opt/zend/apache2/conf/httpd.conf
	sed -i 's/\/usr\/local/\/opt/g' ${pkgdir}/opt/zend/apache2/bin/apxs
}

