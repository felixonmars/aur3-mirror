# Maintainer: Vithon <ratm@archlinux.us>
# Contributor: Julien <julroy67 [at] gmail.com>
# Contributor: sironitomas@gmail.com

pkgname=songbird-bin
pkgver=1.10.1
_pkgver=2160
pkgrel=1
pkgdesc="Digital desktop media player (jukebox) mashed-up with web browser, powered by Mozilla (contributed build binary)."
url="http://www.getsongbird.com/"
license=('GPL2')
arch=('i686')
depends=('libxmu' 'gstreamer0.10-base' 'gstreamer0.10-good-plugins' 'gstreamer0.10-python')
optdepends=('gstreamer0.10-bad-plugins' 'gstreamer0.10-ugly-plugins')
conflicts=('songbird' 'songbird-nightly' 'songbird-svn')
provides=('songbird')
source=(http://download.songbirdnest.com/installer/linux/$CARCH/Songbird_$pkgver-${_pkgver}_linux-i686.tar.gz
songbird.desktop
songbird-launcher.sh 
$pkgname-1.4.3-symlink.patch)
md5sums=('2e3f9dabc1bb140dd26f8d1fd7b4c128'
         '094c05874ed5ca4351b3b2f35785b6e7'
         '377b899f900a70c04d265e6a45454843'
         'c75457bfc67dc8624fab8201eb22a909')

package() {
	cd $srcdir

	# Apply the symlink patch
	patch -Np0 -i $pkgname-1.4.3-symlink.patch || return 1

	# Create directory and copy everything
	install -d $pkgdir/opt/songbird
	cp -a $srcdir/Songbird/* $pkgdir/opt/songbird || return 1

	# Fix permissions
	find $pkgdir/opt/songbird -type d -exec chmod 755 {} +
	find $pkgdir/opt/songbird -type f -exec chmod 644 {} +
	chmod 755 $pkgdir/opt/songbird/songbird{,-bin}
	chmod 755 $pkgdir/opt/songbird/xulrunner/xulrunner{,-bin}

	# Install bin, icon and desktop
	install -Dm 755 $srcdir/songbird-launcher.sh $pkgdir/usr/bin/songbird
	install -Dm 644 $srcdir/Songbird/chrome/icons/default/default.xpm \
	$pkgdir/usr/share/pixmaps/Songbird.xpm
	install -Dm 644 $srcdir/songbird.desktop \
	$pkgdir/usr/share/applications/Songbird.desktop
}
