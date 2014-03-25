# Maintainer: ian <ian at kremlin dot cc>
pkgname=bashstyle-git
pkgver=bashstyleng.8.4.r22.g7b082d4
pkgrel=2
pkgdesc="A PyGTK client for managing bash, readline, vim, and nano settings (git version)"
arch=('any')
url="https://github.com/Nanolx/bashstyle-ng"
license=('GPL3')
groups=('system')
depends=('gawk' 'sed' 'bc' 'gettext' 'less' 'libnewt' 'python-configobj' 'python-gobject' 'hicolor-icon-theme')
makedepends=('git')
optdepends=("acpi: showbatteryload support" "lspci: systeminfos support" "lsusb: systeminfos support" "ps2pdf: man2pdf support" "tree: fs support" "dmidecode: dmi variables support")
install=".install"
conflicts=('bashstyle')
provides=('bashstyle')
source=("git://github.com/Nanolx/bashstyle-ng.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/bashstyle-ng"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/bashstyle-ng/.configure"
	#patch base < "$srcdir/base.patch"
	#patch checks < "$srcdir/checks.patch"
	cd "$srcdir/bashstyle-ng/rc/functions"
	#patch text2morse < "$srcdir/text2morse.patch"
	cd "$srcdir/bashstyle-ng/.make"
	#patch adjust < "$srcdir/adjust.patch"
}

build() {
	cd "$srcdir/bashstyle-ng"
	./configure --python=/usr/bin/python --no-installdocs
	make
}

package() {
	cd "$srcdir/bashstyle-ng"
	make DESTDIR="$pkgdir/" install

	# get rid of locales if already present
	#if [ -f /usr/share/locale/de/LC_MESSAGES/bs-ng-wizard.mo ]; then
	#	rm $pkgdir/usr/share/locale/de/LC_MESSAGES/bs-ng-wizard.mo
	#fi
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
	#if [ -f /usr/share/locale/ru/LC_MESSAGES/bs-ng-wizard.mo ]; then
		#rm $pkgdir/usr/share/locale/ru/LC_MESSAGES/bs-ng-wizard.mo
	#fi
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
	if [ "$(ls -A $pkgdir/usr/share/doc/bashstyle-ng/img-style 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/doc/bashstyle-ng/img-style
	fi
	if [ "$(ls -A $pkgdir/usr/share/doc/bashstyle-ng/img 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/doc/bashstyle-ng/img
	fi
	if [ "$(ls -A $pkgdir/usr/share/locale 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/locale
	fi
	if [ "$(ls -A $pkgdir/usr/share/doc/bashstyle-ng 2> /dev/null)" == "" ]; then
		rmdir $pkgdir/usr/share/doc/bashstyle-ng
		rmdir $pkgdir/usr/share/doc
	fi
}
