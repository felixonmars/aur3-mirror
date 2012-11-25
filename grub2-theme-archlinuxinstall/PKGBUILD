#Maintainer: Andrew Webley <unsuspectinghero@gmail.com>
pkgname=grub2-theme-archlinuxinstall
pkgver="0.1"
pkgrel="1"
pkgdesc="The bootloader theme from the Archlinux install image ported to Grub2"
url="https://github.com/ArchFwin/grub2-theme-archlinuxinstall"
arch=('any')
license=('GPL3')
depends=('grub-common')
install=$pkgname.install
source=('https://github.com/downloads/ArchFwin/grub2-theme-archlinuxinstall/Archlinux.tar.xz')
sha512sums=('351c6da6df134030fc152c511b190281fe2f5e297cb58679dd7846d1465186b684c6bd60c4e132b203e626f386b1d744a3689cd2b8f6985b74005ad40be3e6bf ')
build(){
	cd "${srcdir}"
	tar -xavf Archlinux.tar.xz 
	mkdir -p "${pkgdir}/boot/grub/themes/${pkgname}"
	install -Dm741 Archlinux/* "${pkgdir}/boot/grub/themes/${pkgname}" 
}
