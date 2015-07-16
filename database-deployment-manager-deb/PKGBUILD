# Contributer: giacomogiorgianni@gmail.com

pkgname=database-deployment-manager-deb
name=ddm
pkgver=0.1
pkgrel=1
pkgdesc="DDM A tool for managind database deployments"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dbm-project/files/"
license=('LGPL')
depends=('libmysqlclient' 'mysql' 'qtwebkit')
install="$name.install"
#makedepends=('')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='x86_64'
    md5sums=('4e79b8eb5a7e7edfb735a867debc3d9a' 'ab0f3e3d248a4c4dcc02652776fbbd9d')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='-x86' 
    md5sums=('e1a3343b4b501e05e877379b9e2380b6' 'ab0f3e3d248a4c4dcc02652776fbbd9d')
fi
source=("http://netcologne.dl.sourceforge.net/project/dbm-project/release_01k/${name}-${pkgver}k-Linux-$ARCH.deb" "$name.install")
	
pkgbuild() {
	cd ${startdir}/src
	tar -zxf ${startdir}/src/data.tar.gz
	cp -rp ${startdir}/src/usr/ ${startdir}/pkg/
	cp -rp ${startdir}/src/opt/ ${startdir}/pkg/
}
