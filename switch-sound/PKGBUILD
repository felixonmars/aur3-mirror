# Maintainer: Stanislav GE <ginermail@gmail.com>

_pkgver=2013-05-06
pkgname=switch-sound
pkgver=20130506
pkgrel=1
pkgdesc="Script to switch audio input and output for pulseaudio"
arch=(i686 x86_64)
url=http://www.helplinux.ru
license=(GPL3)
install=switch-sound.install
depends=(pulseaudio libnotify)
source=(https://github.com/giner/helplinux/archive/$pkgname.$_pkgver.tar.gz
	switch-sound.install)
md5sums=('49b890ea49d9b51ae9c47c0275e1eb95'
         '9fee2e9c52139b11ef71f19614d281cc')
_scriptdir=helplinux-$pkgname.$_pkgver/scripts/$pkgname

pkgver() {
	echo ${_pkgver//-/}
}

package() {
	cd $srcdir/$_scriptdir

	# Install scripts
	install -d $pkgdir/usr/bin
	install *.sh $pkgdir/usr/bin

	# Install desktop files
	install -d $pkgdir/usr/share/applications
	install -m 644 desktop/*.desktop $pkgdir/usr/share/applications

	# Install docs
	install -d $pkgdir/usr/share/doc/$pkgname
	install -m 644 README $pkgdir/usr/share/doc/$pkgname
}
