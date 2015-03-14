# $Id$
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=parole-gtk2
_pkgname=parole
pkgver=0.5.4
pkgrel=1
pkgdesc="A modern media player based on the GStreamer framework, old version with gtk2 support"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/parole/"
license=('GPL')
depends=('gstreamer' 'gst-plugins-base-libs' 'hicolor-icon-theme' 'libnotify>=0.4.1'
         'libxfce4ui>=4.10.0' 'taglib>=1.4' 'desktop-file-utils' 'gst-plugins-good')
makedepends=('xfce4-dev-tools')
optdepends=('gst-libav'
	    'gst-plugins-bad'
	    'gst-plugins-base'
	    'gst-plugins-ugly')
conflicts=('parole')
provides=('parole')
install=parole.install
source=(http://git.xfce.org/apps/parole/snapshot/parole-$pkgver.tar.bz2)
md5sums=('19ae948309472429b669eed8ac290dcd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib \
    --enable-taglib --enable-libnotify --with-gstreamer=1.0
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
