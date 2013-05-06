# Maintainer: Stefan Reuter <stefan dot gert dot r at gmail dot com
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=xfwm4-vsync
_realname=xfwm4
pkgver=4.10.1
pkgrel=1
pkgdesc="Xfce window manager with vsync patch for DRI drivers."
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'libwnck' 'hicolor-icon-theme' 'libdrm')
makedepends=('intltool')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
options=('!libtool')
install=$_realname.install
source=(http://archive.xfce.org/src/xfce/$_realname/4.10/$_realname-$pkgver.tar.bz2
	vsync-v3.diff)
sha256sums=('380c44fba6eb779e34be0fe94f3726cfa131803014d6073c45aec8a1257fa740'
	    'a76583c31017336936f100fe0d27ecf88a0a0902c63189c172d4fbe25ce59896')

build() {
  cd "$srcdir/$_realname-$pkgver"
  
# Add vsync to compositor https://bugzilla.xfce.org/show_bug.cgi?id=8898
  patch -n -p2 -i "$srcdir/vsync-v3.diff"
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
