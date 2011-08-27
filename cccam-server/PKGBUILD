# Contributor: Peque (udbytossen@gmail.com)
pkgname=cccam-server
pkgver=0.2
pkgrel=1
pkgdesc="CCcam server 2.2.1"
arch=('i686' 'x86_64')
depends=('tar' 'lib32-gcc-libs')
license="GPL"
url="http://rapidshare.com/files/448827749/CCcam2.2.1.tar.gz"
install="cccam.install"
source=('CCcam2.2.1.tar.gz' 'cccamd')
md5sums=('df35747acc7a000f8da19414fba0de45' 'b30bab123f378aaf75e9a37ef72a5630')

build() {
	mkdir -p ${startdir}/src/
	mkdir -p ${startdir}/pkg/etc/rc.d/
	mkdir -p ${startdir}/pkg/var/keys/
	mkdir -p ${startdir}/pkg/etc/
	mkdir -p ${startdir}/pkg/emu/cccam/

	# Unzip and copying the binary 
	cd ${startdir}/src/
	tar -xf ../CCcam2.2.1.tar.gz
	cp ${startdir}/src/CCcam2.2.1/CCcam.x86 ${startdir}/pkg/emu/cccam/CCcam.x86
	chmod 777 ${startdir}/pkg/emu/cccam/CCcam.x86
	
	# Moving the Configurationfile CCcam.cfg
	install -D -m655 CCcam2.2.1/CCcam.cfg ${startdir}/pkg/etc/CCcam.cfg
	
	# Copying the starting script 
	install -D -m755 ../cccamd ${startdir}/pkg/etc/rc.d/cccamd 
}
# EOF
	
