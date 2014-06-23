# Maintainer: ava1ar <mail(at)ava1ar(dot)info)

pkgname=kdeplasma-applets-easysshconnection-git
_pkgname=easy-ssh-connection
pkgver=9.12923b3
pkgrel=1
pkgdesc="Plasmoid which allow you to connect your ssh servers by one click"
arch=('any')
url="https://github.com/ava1ar/easy-ssh-connect"
license=('GPL3')
depends=('kdebindings-python2' 'python2' 'python2-pyqt4')
source=('easy-ssh-connection::git+https://github.com/ava1ar/easy-ssh-connect')
sha1sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/apps/plasma/plasmoids/${_pkgname}
	cp -R easy-ssh-connection/* ${pkgdir}/usr/share/apps/plasma/plasmoids/${_pkgname}
	install -m644 -D easy-ssh-connection/metadata.desktop ${pkgdir}/usr/share/kde4/services/plasma-applet-easysshconnection.desktop
}
