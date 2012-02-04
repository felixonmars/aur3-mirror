# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=palm-emulator
pkgver=1.2.0.33
pkgrel=1
pkgdesc="Palm emulator for VirtualBox."
arch=('i686')
url="http://developer.palm.com/"
license=('GPL')
depends=('virtualbox')
source=(https://cdn.downloads.palm.com/sdkdownloads/1.2.0.33/sdkBinaries/palm-novacom_0.3-svn196852-hud21_i386.deb
	https://cdn.downloads.palm.com/sdkdownloads/1.2.0.33/sdkBinaries/palm-sdk_1.2.0-svn202408-sdk77-pho33_i386.deb)
md5sums=('11b78cd45aaffcd17d071f691dfb6407'
         'fe0a295cde004defcdd9e004d580dba2')

build() {
  cd $srcdir

  # Extract Debian Packages
  bsdtar xf palm-novacom_0.3-svn196852-hud21_i386.deb
  bsdtar xf data.tar.gz -C $pkgdir
  bsdtar xf palm-sdk_1.2.0-svn202408-sdk77-pho33_i386.deb
  bsdtar xf data.tar.gz -C $pkgdir

  cd $startdir

  # Start Script
  install -Dm755 palm-start $pkgdir/usr/bin/palm-start

  # Desktop icon
  install -Dm644 palm.png $pkgdir/usr/share/pixmaps/palm.png
  install -Dm644 palm.desktop $pkgdir/usr/share/applications/palm.desktop
}
