# Maintainer: GERGE <muratcan.simsek@gmail.com>
# Orijinal Contributor: Julien <julroy67 [at] gmail.com>
# Contributor: GERGE <muratcan.simsek@gmail.com>

pkgname=songbird-bin64
pkgver=1.8.0
_pkgver=1800
pkgrel=1
pkgdesc="Digital desktop media player (jukebox) mashed-up with web browser, powered by Mozilla (lastest contributed 64bit build binary)."
url="http://www.getsongbird.com/"
license=('GPL2')
arch=('x86_64')
depends=('libxmu' 'gstreamer0.10-base' 'gstreamer0.10-good-plugins' 'gstreamer0.10-python')
optdepends=('gstreamer0.10-bad-plugins' 'gstreamer0.10-ugly-plugins')
conflicts=('songbird' 'songbird-bin' 'songbird-nightly' 'songbird-svn')
provides=('songbird')
source=(http://download.songbirdnest.com/installer/linux/$CARCH/Songbird_$pkgver-${_pkgver}_linux-$CARCH.tar.gz
songbird.desktop
songbird-launcher.sh 
$pkgname-1.4.3-symlink.patch)
md5sums=('99634168690c5f217f2ace1f48fe901e'
         '094c05874ed5ca4351b3b2f35785b6e7'
         '377b899f900a70c04d265e6a45454843'
         '28d332d6eb55b6679be99d78f8a9a759')

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
