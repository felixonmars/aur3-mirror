#maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
# Corrected for version 1.4.1: vic.pozd
pkgname=cqrlog_1.4.1_i386
pkgver=1.4.1
pkgrel=1
pkgdesc="An advanced ham radio logger based on MySQL database. (Binary Version)"
arch=(i686)
url="http://www.cqrlog.com"
license=('GPL')
groups=()
depends=('glibc' 'libx11' 'gdk-pixbuf2' 'gtk2' 'glib2' 'pango' 'atk' 'cairo-xcb' 'hamlib' 'libxcb' 'libpng' 'libxfixes' 'fontconfig' 'libxext' 'libxrender' 'libxinerama' 'libxi' 'libxrandr' 'libxcursor' 'libxcomposite' 'libxdamage' 'pcre' 'libffi' 'pixman' 'freetype2' 'zlib' 'libltdl' 'libusb-compat' 'libxau' 'libxdmcp' 'expat' 'bzip2' 'libusb' 'mysql' 'xplanet' 'trustedqsl')
source=(http://www.cqrlog.com/files/cqrlog_1.4.1/cqrlog_1.4.1_i386.tar.gz)
md5sums=('5b41b4f72b1804a46b3192445fd62362')
package() {
  cd "$srcdir/$pkgname"
  cp -rfv ./* $pkgdir
}

# vim:set ts=2 sw=2 et:
