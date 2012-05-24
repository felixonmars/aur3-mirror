# Maintainer: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=samsung-laptop-git
pkgver=20120524
pkgrel=1
pkgdesc="Kernel module for Samsung laptops - Development version"
arch=('any')
url=("http://github.com/iksaif/samsung-laptop-dkms")
license=('GPL')
provides=('samsung-laptop')
makedepends=('git')
install=samsung-laptop.install
source=(samsung-laptop.rc)
md5sums=('51d82463028aed0cba5c144c253574af')

_gitroot=("https://github.com/iksaif/samsung-laptop-dkms.git")
_gitname=("samsung-laptop-dkms")

build() {
	cd ${srcdir}

	# Git checkout
	if [ -d ${srcdir}/${_gitname} ] ; then
		msg "Git checkout:  Updating existing tree"
		cd ${_gitname} && git pull origin
		msg "Git checkout:  Tree has been updated"
	else
		msg "Git checkout:  Retrieving sources"
		git clone ${_gitroot}
	fi
	msg "Checkout completed"
}

package() {
	install -Dm755 samsung-laptop.rc "${pkgdir}/etc/rc.d/samsung-laptop"
	install -d "${pkgdir}/usr/src/samsung-laptop"

	cd ${srcdir}/${_gitname}
	cp -R * "${pkgdir}/usr/src/samsung-laptop"
  # Remove useless stuff
  cd "${pkgdir}/usr/src/samsung-laptop/"
  rm -rf debian
}

# vim:set ts=2 sw=2 et:
