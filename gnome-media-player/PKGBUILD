# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gnome-media-player
pkgver=0.1.3
pkgrel=2
pkgdesc="A simple media player for GNOME that supports libvlc, xine-lib and libgstreamer"
arch=('i686' 'x86_64')
url="https://launchpad.net/gnome-media-player"
license=('GPL')
depends=('gtkmm>=2.12' 'libunique' 'vlc>=1.0.0' 'xine-lib>=1.1.16' 'gstreamer0.10-base-plugins' 'gconf')
makedepends=('intltool>=0.35')
install=$pkgname.install
source=(http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz
        add-translation-support.patch
        vlc-1.1.0-upgrade.patch
        mouse-event-support.patch)
md5sums=('8abf61f7a2c131be6b4ea334a747ad9d'
         'd823164e99be431a0ca3f2819378b92b'
         '06790531e5afbd9f7aed91292842bc77'
         'f03218a11771124a0b574397b9451aaf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/add-translation-support.patch"
  patch -Np1 -i "$srcdir/vlc-1.1.0-upgrade.patch"
  patch -Np1 -i "$srcdir/mouse-event-support.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
