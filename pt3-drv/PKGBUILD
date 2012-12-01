# Maintainer: acounto <acounto@kamikakushi.net>

pkgname=pt3-drv
pkgver=0.0.1
pkgrel=2
_gitroot=https://github.com/m-tsudo/pt3.git
_gitname=pt3
_foldername=m-tsudo-pt3-5d78838
pkgdesc="PT3 chardev Driver."
arch=('i686' 'x86_64')
url="https://github.com/m-tsudo/pt3"
license=('GPL3')
makedepends=('git' 'linux-headers')
source=('rules.patch' 'Makefile.patch' 'pt3-drv.install')
md5sums=('521ed32e6c1aad2a4045ccf14c2bd327' '466a23013becd3dec82fb9cd88d7d939' '5d6601d8a02f2c0f1e5864aafdfada6e')
install=pt3-drv.install

build() {
	cd "${srcdir}"
	msg 'Connecting to GIT server ...'
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
	msg "The local files updated."
	else
		git clone $_gitroot $_gitname
		msg 'Git checkout finished.'
	fi
	patch -p0 -i rules.patch
	patch -p0 -i Makefile.patch
	cd ${_gitname}/
	make PREFIX=/usr
}

package() {
  cd $srcdir/${_gitname}/
  mkdir -p ${pkgdir}/usr/lib/modules/`uname -r`/kernel/drivers/video
  mkdir -p ${pkgdir}/etc/udev/rules.d
  make PREFIX="${pkgdir}/usr" UDEVPREFIX="${pkgdir}/etc" install
}
