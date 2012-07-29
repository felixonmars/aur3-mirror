# Maintainer: Thibi <thibitian [at] gmail.com>
# Contributor: Ray Blostein <rblostein [at] gmail.com>

pkgname=('barry-desktop')
_realname=barry
pkgver=0.18.3
pkgrel=1
pkgdesc="Barry is a GPL C++ library for interfacing with the RIM BlackBerry Handheld. This enables the new desktop UI."
url='http://www.netdirect.ca/software/packages/barry'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libusb-compat' 'zlib' 'libglademm' 'libtar' 'libxml++'
  'libgcal>=0.9.6' 'wxgtk' 'sdl' 'libopensync4x-barry')
makedepends=('make' 'gcc' 'patch' 'pkg-config' 'autoconf' 'automake'
  'libtool' 'gettext')
optdepends=('fuse: for bfuse')
conflicts=('barry' 'barry-git')
replaces=('barry')
install=barry.install
source=(http://downloads.sourceforge.net/${_realname}/${_realname}-${pkgver}.tar.bz2
  tarfile-ops-nt.cc.patch
  barry.desktop)

md5sums=('1a3077256efd449ec59fa9309aa28b81'
'1f808132b402c4ea68a0d1fc3f19142c'
'3242b4d11b4c9ebd01de927dea812de5')

build() {
  # Apply patches
  cd $srcdir/${_realname}-$pkgver/src
  patch -p0 < ../../tarfile-ops-nt.cc.patch

  # Build the package
  cd $srcdir/${_realname}-$pkgver
  ./configure --prefix=/usr --libexec=/usr/lib \
    --enable-gui \
    --enable-desktop \
    --enable-opensync-plugin-4x

  make || return 1
  make DESTDIR=$pkgdir install

  # Remove libtool files
  find "$pkgdir/" -name "*.la" -exec rm {} \;
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  
  # Install icon & desktop link
  mkdir -p $pkgdir/usr/share/pixmaps
  cp ./desktop/images/barry_logo_icon.xpm $pkgdir/usr/share/pixmaps
  
  mkdir -p $pkgdir/usr/share/applications
  cp ../barry.desktop $pkgdir/usr/share/applications
}