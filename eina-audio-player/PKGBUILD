# Maintainer: Marco Scopesi <marco.scopesi@gmail.com>
pkgname=eina-audio-player
pkgver=0.14.0
pkgrel=3
pkgdesc="A classic music player for a modern era"
arch=('i686' 'x86_64')
url="http://eina.sourceforge.net/"
license=('GPL')
depends=('gstreamer0.10' 'libnotify' 'libpeas' 'clutter-gtk'
         'desktop-file-utils' 'dconf')
makedepends=('pkgconfig>=0.16' 'intltool' 'gtk-doc')
optdepends=('python2: for submitting to last.fm')
conflicts=('eina-audio-player-git')
options=('!libtool')
install=$pkgname.install
source=(http://launchpad.net/eina/trunk/$pkgver/+download/eina-$pkgver.tar.gz)
md5sums=('62204a2f0a8f5fbec6730a96e4fd45ab')


build() {
  cd "$srcdir/eina-$pkgver"
  sed s/python/python2/ -i eina/lastfm/lastfmsubmitd/lastfmsubmitd
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper \
              --disable-schemas-compile
  make -j1
}

package() {
  cd "$srcdir/eina-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm -f $pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled
}

# vim:set ts=2 sw=2 et:
