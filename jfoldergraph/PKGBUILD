# Contributer: giacomogiorgianni@gmail.com

pkgname=jfoldergraph
pkgver=0.1beta3
pkgrel=0
pkgdesc="Java Scans of your hard disk or internal memory and external media , and to have detailed information about folders and files larger"
arch=('i686' 'x86_64')
url="http://developer.berlios.de/projects/jfoldergraph/"
license=('GPL')
depends=('java-runtime')
makedepends=('java-environment')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('44f8dfbec12fbe591ed14d5ec5b7b2d6')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
    md5sums=('860619e966cfbbea9c5feae1390e35b9')
fi

source=http://ppa.launchpad.net/upubuntu-com/apps/ubuntu/pool/main/j/jfoldergraph/${pkgname}_${pkgver}~precise_${ARCH}.deb

build() {
	cd ${startdir}/src
	#ar -x ${startdir}/src/data_${pkgver}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	cp -r ${startdir}/src/usr/ ${startdir}/pkg/
}
