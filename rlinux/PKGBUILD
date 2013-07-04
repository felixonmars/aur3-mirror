# Maintainer: Patryk Kowalczyk <patryk at kowalcyzk dot ws>

pkgname=rlinux
_pkgname=rli
pkgver=4.5
pkgrel=2
pkgdesc="A free fully functional file recovery utility for the Ext2/Ext3/Ext4 FS file system used in the Linux OS and several Unixes."
arch=('i686' 'x86_64')
license=('unknow')
depends=( 'bzip2' 'qt4' 'libffi' 'expat' 'libxcb' 'pcre' 'libxau' 'libxdmcp' 'libpng')
source=("http://www.r-tt.com/downloads/rli_en_4_${CARCH}.rpm")
url="http://www.r-tt.com/free_linux_recovery/Download.shtml"



build() {
	cd ${srcdir}
	bsdtar xf ${_pkgname}_en_4_${CARCH}.rpm
}
package(){
	cd ${srcdir}/usr/local/R-Linux
	sed -i 's/\/local\/R-Linux//g' bin/rlinux
	install -d ${pkgdir}/usr/bin/
	install -Dm755 ${srcdir}/usr/local/R-Linux/bin/* ${pkgdir}/usr/bin/
	install -d ${pkgdir}/usr/share/help/en_US/
	install -Dm644 ${srcdir}/usr/local/R-Linux/share/help/en_US/* ${pkgdir}/usr/share/help/en_US/
	install -Dm644 ${srcdir}/usr/local/R-Linux/share/rtt-rlinux.desktop ${pkgdir}/usr/share/rtt-rlinux.desktop
	install -d ${pkgdir}/usr/lib/
	install -Dm644 ${srcdir}/usr/local/R-Linux/lib/rlin_linux_r.so ${pkgdir}/usr/lib/rlin_linux_r.so
	cd ${pkgdir}/usr/lib/
	ln -s rlin_linux_r.so librlin_linux_r.so
	}
md5sums=('571c046bd72409a236f2e581439c9c8f')
