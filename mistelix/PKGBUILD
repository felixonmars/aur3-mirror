# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mistelix
pkgver=0.33
pkgrel=4
pkgdesc="DVD authoring application with slideshow creation capabilities"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Mistelix"
license=('MIT')
depends=('gstreamer0.10-base-plugins' 'gtk-sharp-2' 'mono-addins' 'gnome-desktop2' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool')
optdepends=('gstreamer0.10-good-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs')
options=('!libtool')
install=$pkgname.install
source=(http://gent.softcatala.org/jmas/$pkgname/$pkgname-$pkgver.tar.gz
        drop-gnome-sharp.patch)
md5sums=('954d351bff0e47a5092c55bb7bb5038a'
         'b183e5ab60d9de9045b55c30dd3f0485')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://bugzilla.gnome.org/show_bug.cgi?id=675046
  patch -Np1 -i "$srcdir/drop-gnome-sharp.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}
