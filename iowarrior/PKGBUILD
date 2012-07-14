pkgname=iowarrior
pkgver=1.5
pkgrel=4
pkgdesc="Linux module and userspace library for the IO-Warrior"
arch=('i686' 'x86_64')
url="http://www.codemercs.com"
license=('GPL')
source=("http://www.codemercs.com/uploads/tx_sbdownloader/LinuxSDK.zip")

md5sums=('8ef6d38d48a9b0003fb8377dc48220bf')

build() {
	# compile userspace library
	cd "${srcdir}"
	tar xzf "${srcdir}/LinuxSDK/Kernel_2.6/iowkit 1.5/libiowkit-1.5.0.tar.gz"
	cd libiowkit-1.5.0
	./configure --prefix="/usr"
	make
}

package() {
	cd $srcdir/libiowkit-1.5.0
	# install udev rule
	install -d -m755 "${pkgdir}/usr/lib/udev/rules.d"
	echo 'KERNEL=="iowarrior*",  NAME="usb/iowarrior%n", GROUP="users", MODE="666"' > \
		"${pkgdir}/usr/lib/udev/rules.d/10-iowarrior.rules"

	# install userspace library
	make DESTDIR=${pkgdir} install
	install -d -m755 "${pkgdir}/usr/share/java/"
	install -m644 java/codemercs.jar "${pkgdir}/usr/share/java/"
}