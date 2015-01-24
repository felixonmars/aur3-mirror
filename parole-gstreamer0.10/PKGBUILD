# Maintainer: Cascendo <cascendo@hotmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: TDY <tdy@gmx.com>

_pkgname=parole
pkgname=parole-gstreamer0.10
pkgver=0.5.4
pkgrel=1
pkgdesc="A modern media player based on the GStreamer framework"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/parole/"
license=('GPL')
depends=('gstreamer0.10-base-plugins' 'hicolor-icon-theme' 'libnotify>=0.4.1'
         'libxfce4ui>=4.7.0' 'taglib>=1.4' 'desktop-file-utils')
conflicts=('parole')
makedepends=('pkgconfig>=0.9.0' 'xfce4-dev-tools')
optdepends=('xulrunner: browser plugin'
	    'gstreamer0.10-plugins: Additional media backends')
conflicts=('parole-media-player-git')
options=('!libtool')
install=parole-gstreamer0.10.install
source=(http://git.xfce.org/apps/parole/snapshot/parole-$pkgver.tar.bz2)
md5sums=('19ae948309472429b669eed8ac290dcd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's|AM_CONFIG_HEADER|AC_CONFIG_HEADER|g' configure.ac.in
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib \
    --enable-taglib --enable-libnotify --with-gstreamer=0.10
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
