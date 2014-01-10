# Maintainer: inhies
# Contributors: Prurigro, sekret 

# To requests changes, please do so via Github at https://github.com/inhies/arch-packages/tree/master/chkboot-pkgbuild

_pkgname=chkboot
pkgname=${_pkgname}-git
pkgver=20140107.24
pkgrel=1
pkgdesc="Checks all files under /boot for changes"
url="https://github.com/inhies/${_pkgname}"
license=('GPL2')
makedepends=('git')
arch=('any')
install=${_pkgname}.install
backup=("etc/default/chkboot.conf")

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
    #INSTALL THE COMMON CONFIGURATION SETTINGS FILE
	install -D -m644 "${srcdir}"/${_pkgname}/${_pkgname}.conf "${pkgdir}"/etc/default/${_pkgname}.conf

    #INSTALL THE MAIN CHKBOOT SCRIPT AND A ONE TO CHECK THE CURRENT STATE
	install -D -m755 "${srcdir}"/${_pkgname}/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
	install -D -m755 "${srcdir}"/${_pkgname}/${_pkgname}-check "${pkgdir}"/usr/bin/${_pkgname}-check

	#INSTALL A PROFILE SCRIPT THAT TRIGGERS A WARNING IN A USER'S TERMINAL WHEN CHANGES EXIST
	install -D -m755 "${srcdir}"/${_pkgname}/${_pkgname}-profilealert.sh "${pkgdir}"/etc/profile.d/${_pkgname}-profilealert.sh

	#INSTALL AN INITCPIO SCRIPT FOR USERS TO ADD TO THE END OF THE 'HOOKS' ARRAY IN '/etc/mkinitcpio.conf'
	install -D -m644 "${srcdir}"/${_pkgname}/${_pkgname}-initcpio "${pkgdir}"/usr/lib/initcpio/install/${_pkgname}

    #INSTALL THE SYSTEMD SERVICES FOR 
	install -D -m644 "${srcdir}"/${_pkgname}/${_pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${_pkgname}.service
	install -D -m755 "${srcdir}"/${_pkgname}/${_pkgname}-bootcheck "${pkgdir}"/usr/lib/systemd/scripts/${_pkgname}-bootcheck
}
