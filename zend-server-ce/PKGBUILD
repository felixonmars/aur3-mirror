# Maintainer: F0ruD <fzerorubigd at gmail dot com>
# Contributor: Bob Fanger < bfanger(at)gmail >
pkgname=zend-server-ce
pkgver=5.0.2
pkgrel=1
pkgdesc="Zend Server Community Edition (CE) is a high-performance, reliable PHP Application Server that is absolutely free to use in development or in production."
arch=('i686' 'x86_64')
url="http://www.zend.com/en/community/zend-server-ce"
license=('unknown')
provides=('zend-server')
depends=() 
makedepends=('diffutils') 
#first one is dummy, see bellow
md5sums=(88b0ed4a835d14a9e634501a44e4d1aa 
	 17d21e17436c057adf4261b1089a61b1)
case "$CARCH" in
    i686|i[3-5]86) _arch='i386';md5sum[0]='f42a02aeec66113194c0011a5f9db1a8';;
    x86_64|amd64) _arch='x86_64';md5sum[0]='88b0ed4a835d14a9e634501a44e4d1aa';;
    *) error "Unknown or invalid CARCH=$CARCH"; exit 1
esac


source=(http://downloads.zend.com/zendserver/${pkgver}/ZendServer-CE-php-5.3.2-${pkgver}-linux-glibc23-${_arch}.tar.gz
	install.patch)
install=$pkgname.install

conflicts=()
build() {
	
	cp install.patch ${srcdir}/ZendServer-${pkgver}-php5.3.2-linux-glibc23-${_arch} 
  	cd ${srcdir}
	cd ZendServer-${pkgver}-php5.3.2-linux-glibc23-${_arch} 
	patch -Np1 -i ./install.patch

	# extract files
	./7z x -o${pkgdir}/opt -y zend.7z 
	if [ $? -ne 0 ];then 
		echo "Failed to extract files.. "
		return 1
	fi
	mkdir ${pkgdir}/etc
	touch ${pkgdir}/etc/zce.rc 
	mkdir ${pkgdir}/etc/rc.d
	cp ${pkgdir}/opt/zend/bin/zendctl.sh ${pkgdir}/etc/rc.d/zendserverce
	chmod 755 ${pkgdir}/opt # set default rights on /opt
	chmod 755 ${pkgdir}/etc # set default rights on /etc
	# Add installer to the package
	installer_file=${pkgdir}/opt/zend/install.sh
	cp install.sh ${installer_file}
}
