# Maintainer: ian <ian at kremlin dot cc>
pkgname=bashstyle
pkgver=8.99
pkgrel=3
# new epoch as PKGBUILD was rewritten -- kremlin
epoch=1
pkgdesc="A PyGTK client for managing bash, readline, vim, and nano settings"
arch=('any')
url="http://nanolx.org/nanolx/bashstyle-ng"
license=('GPL3')
groups=('system')
depends=('python' 'hicolor-icon-theme' 'libnewt')
makedepends=('python-configobj' 'bc')
optdepends=('dmidecode: hardware information support' 'acpi: acpi events support' 'lspci: pci device support' 'lsusb: usb device support' 'ps2pdf: pdf display' 'tree: treecd support')
install=".INSTALL"
provides=("bashstyle-git")
conflicts=("bashstyle-git")
source=("http://downloads.nanolx.org/BashStyle-NG/bashstyle-ng_8.99.tar.bz2" ".INSTALL")

md5sums=('63e39b4423b754df9a23f114a0bc9fe4'
         '9860a43b61a650f019c56e92d21dc4e5')
sha512sums=('a878e9d7afa8681b6f75fc846a6d764e0e7df37f321f40337fa831063b19237600b759a1eac72b855b69a170cb49a82020c3c0f9bfca66dc4f82a5489e891e7c'
            'ca841fb59df272af223af8ba51b984de5ce08139e219f37d47165154ec4704b7175f21d940b34e9359a293d2178b2bfb993821e60c9df904c0565707d41bd62c')
#prepare() {
	#cd "$srcdir/bashstyle-ng_8.99/.configure"
	#patch checks < $srcdir/configchecks.patch
#}

build() {
	cd "$srcdir/bashstyle-ng_8.99"
	./configure
	make
}

package() {
	cd "$srcdir/bashstyle-ng_8.99"
	make DESTDIR="$pkgdir/" install

	# get rid of potfiles if already present
	if [ -f /usr/share/locale/de/LC_MESSAGES/bs-ng-wizard.mo ]; then
		rm $pkgdir/usr/share/locale/de/LC_MESSAGES/bs-ng-wizard.mo
	fi
	if [ -f /usr/share/locale/de/LC_MESSAGES/bs-ng.mo ]; then
		rm $pkgdir/usr/share/locale/de/LC_MESSAGES/bs-ng.mo
	fi
	if [ -f /usr/share/locale/de/LC_MESSAGES/nx-rc.mo ]; then
		rm $pkgdir/usr/share/locale/de/LC_MESSAGES/nx-rc.mo
	fi
	if [ -f /usr/share/locale/es/LC_MESSAGES/bs-ng.mo ]; then
		rm $pkgdir/usr/share/locale/es/LC_MESSAGES/bs-ng.mo
	fi
	if [ -f /usr/share/locale/es/LC_MESSAGES/nx-rc.mo ]; then
		rm $pkgdir/usr/share/locale/es/LC_MESSAGES/nx-rc.mo
	fi
	if [ -f /usr/share/locale/it/LC_MESSAGES/bs-ng.mo ]; then
		rm $pkgdir/usr/share/locale/it/LC_MESSAGES/bs-ng.mo
	fi
	if [ -f /usr/share/locale/ru/LC_MESSAGES/bs-ng-wizard.mo ]; then
		rm $pkgdir/usr/share/locale/ru/LC_MESSAGES/bs-ng-wizard.mo
	fi
	if [ -f /usr/share/locale/ru/LC_MESSAGES/bs-ng.mo ]; then
		rm $pkgdir/usr/share/locale/ru/LC_MESSAGES/bs-ng.mo
	fi
	if [ -f /usr/share/locale/ru/LC_MESSAGES/nx-rc.mo ]; then
		rm $pkgdir/usr/share/locale/ru/LC_MESSAGES/nx-rc.mo
	fi

	# clean up empty dirs
	if [ "$(ls -A $pkgdir/usr/share/locale/ru/LC_MESSAGES 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/locale/ru/LC_MESSAGES
		rmdir $pkgdir/usr/share/locale/ru
	fi
	if [ "$(ls -A $pkgdir/usr/share/locale/de/LC_MESSAGES 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/locale/de/LC_MESSAGES
		rmdir $pkgdir/usr/share/locale/de
	fi
	if [ "$(ls -A $pkgdir/usr/share/locale/it/LC_MESSAGES 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/locale/it/LC_MESSAGES
		rmdir $pkgdir/usr/share/locale/it
	fi
	if [ "$(ls -A $pkgdir/usr/share/locale/es/LC_MESSAGES 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/locale/es/LC_MESSAGES
		rmdir $pkgdir/usr/share/locale/es
	fi
#	if [ "$(ls -A $pkgdir/usr/share/doc/bashstyle-ng/img-style 2> /dev/null)" == "" ]; then
#		rmdir $pkgdir/usr/share/doc/bashstyle-ng/img-style
#	fi
#	if [ "$(ls -A $pkgdir/usr/share/doc/bashstyle-ng/img 2> /dev/null)" == "" ]; then
#		rmdir $pkgdir/usr/share/doc/bashstyle-ng/img
#	fi
	if [ "$(ls -A $pkgdir/usr/share/locale 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/locale
	fi
#	if [ "$(ls -A $pkgdir/usr/share/doc/bashstyle-ng 2> /dev/null)" == "" ]; then
#		rmdir $pkgdir/usr/share/doc/bashstyle-ng
#		rmdir $pkgdir/usr/share/doc
#	fi
}
