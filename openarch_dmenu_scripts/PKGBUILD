# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_dmenu_scripts
pkgver=0.5
pkgrel=2
pkgdesc="Mount/umount scripts using dmenu"
arch=('any')
groups=('openarch_scripts')
url="http://ovsinc.narod.ru/"
license=('GPL')
depends=('dmenu-xft' 'udisks' 'python2-dbus' 'python2-notify' 'ttf-droid')
source=('openarch_dmenu.tar.gz' 'setup.py' 'dmenu_udisks.tar.gz')

build() {
	cd "${srcdir}"
	install -d -m755 "${pkgdir}"/usr/share/dmenu_udisks
	install -d -m755 "${pkgdir}"/usr/bin
	install -m644 "${srcdir}"/icons/* "${pkgdir}"/usr/share/dmenu_udisks

	# wrapper scripts
	install -m755 "${srcdir}"/scripts/*.sh "${pkgdir}"/usr/bin/
	ln -sf mount.sh "${pkgdir}"/usr/bin/umount.sh
	
	# python script
	python2 "${srcdir}"/setup.py build
	python2 "${srcdir}"/setup.py install --root="${pkgdir}/"
}
md5sums=('f05ee620ff8bce9cff8373a56148d486'
         '7a48867937c696fd4e7b74273c5a551e'
         '835c8a14ad4e435d19fe0e916da46f69')
