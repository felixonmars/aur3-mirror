# Maintainer: Jonathan Lestrelin <zanko@daemontux.org>

pkgname=easy-union
pkgver=0.4~bzr163
pkgrel=1
pkgdesc="Utility to make the content of multiple directories available in a single one (through persistent unionfs mount points)."
arch=('any')
url="https://launchpad.net/nautilus-easy-unionfs"
license=('GPL')
depends=('bindfs' 'unionfs-fuse' 'pyinotify' 'python-nautilus' 'pygtk' 'python2-gconf')
optdepends=('python-notify')
source=("http://ppa.launchpad.net/zanko/daemontux-stuff/ubuntu/pool/main/e/${pkgname}/${pkgname}_${pkgver}_all.deb")
md5sums=('5e4f6bfd6ee69cc888b8fa871df0946e')

package() {
	cd "${pkgdir}" &&
	tar -xzf "${srcdir}/data.tar.gz" &&
	# Fix license path
	sed -ie "s#/usr/share/common-licenses/GPL-3#/usr/share/licenses/common/GPL3/license.txt#g" ${pkgdir}/usr/share/easyunion/functions.py &&
	# Fix unionfs-fuse binary name
	ln -sf "/usr/bin/unionfs" "${pkgdir}/usr/bin/unionfs-fuse" ||
	return 1
}

