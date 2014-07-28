# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Marco Scopesi <marco.scopesi@gmail.com>

_pkgname=eina
pkgname=eina-audio-player-git
pkgver=0.13.90.122.gd97339c
pkgrel=1
pkgdesc="classic music player for a modern era"
arch=('i686' 'x86_64')
url="http://eina.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('gstreamer0.10' 'libnotify' 'libpeas' 'clutter-gtk'
         'desktop-file-utils' 'dconf')
makedepends=('git' 'pkgconfig>=0.16' 'intltool' 'gtk-doc')
optdepends=('python2: for submitting to last.fm')
conflicts=('eina-audio-player')
provides=('eina-audio-player')
options=('!libtool')
install=$pkgname.install
source=("git://github.com/ldotlopez/eina.git")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g'
}

prepare() {
  cd $_pkgname

  sed s/python/python2/ -i eina/lastfm/lastfmsubmitd/lastfmsubmitd
}
build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper \
              --disable-schemas-compile
  make -j1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
  rm -f $pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled
}

# vim:set ts=2 sw=2 et:
