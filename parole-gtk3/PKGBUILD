# Maintainer: CyberWalrus <mdlawson@gmx.com>
_pkgname=parole
pkgname=parole-gtk3
pkgver=0.7.0
pkgrel=1
pkgdesc="A modern media player based on the GStreamer framework"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/parole/"
license=('GPL')
depends=('gstreamer' 'gst-plugins-base-libs' 'hicolor-icon-theme' 'libnotify>=0.4.1'
         'libxfce4ui-devel>=4.11.0' 'taglib>=1.4' 'desktop-file-utils' 
'gst-plugins-good')
makedepends=('pkgconfig>=0.9.0' 'xfce4-dev-tools')
optdepends=('xulrunner: browser plugin'
	    'gst-libav'
	    'gst-plugins-bad'
	    'gst-plugins-base'
	    'gst-plugins-ugly'
	    'libvisual-plugins')
conflicts=('parole-media-player-git')
install=parole.install
source=(http://git.xfce.org/apps/parole/snapshot/parole-$pkgver.tar.bz2)
sha1sums=('76e288d0e6695625e9cf6f4bf9462c376651a495')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's|AM_CONFIG_HEADER|AC_CONFIG_HEADER|g' configure.ac.in
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib --enable-taglib --enable-libnotify --with-gstreamer=1.0
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
