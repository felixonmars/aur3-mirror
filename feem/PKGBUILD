# Maintainer: Acho Arnold <arnoldewin@gmail.com>
#


pkgname=feem
pkgver=2.9.2
pkgrel=2
pkgdesc="Painless file transfer amongst many devices over a network"
arch=('x86_64' 'i686')
url="http://www.tryfeem.com/"
license=('custom')
source=("http://www.tryfeem.com/downloads/Feem_v2.9.2_Installer_For_Linux.zip")
md5sums=('26415a397d4f7484b62d0af0fbfeaec9')

build(){
		chmod +x ../configure
		cp  ../configure  $srcdir/Feem_v2.9.2_Installer_For_Linux/
		cd "$srcdir/Feem_v2.9.2_Installer_For_Linux/"
		./configure  ${pkgdir}/opt/
}

package() {
		cp ../launch_feem_custom.sh $srcdir/Feem_v2.9.2_Installer_For_Linux/launch_feem.sh
		cp ../Feem.desktop.custom  $srcdir/Feem_v2.9.2_Installer_For_Linux/Feem.desktop 
		cd "$srcdir/Feem_v2.9.2_Installer_For_Linux/"
		./install
		mkdir -p ${pkgdir}/usr/bin/
		ln -s ${pkgdir}/opt/feem/launch_feem.sh ${pkgdir}/usr/bin/feem
}