# $Id$

pkgname=xfce4-screenshooter-imgur-git
pkgver=1.8.1.r122.g1291d1c
pkgrel=3
pkgdesc="Plugin that makes screenshots for the Xfce panel with Imgur + clipboard support."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libsoup' 'hicolor-icon-theme' 'curl' 'json-glib')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
install=$pkgname.install
source=("${pkgname%-*-*}"::"git://git.xfce.org/apps/xfce4-screenshooter#branch=master"
		"${pkgname%-*}+cb-git.patch"
		"systemext.patch")

provides=('xfce4-screenshooter-plugin')
conflicts=('xfce4-screenshooter-plugin')
replaces=('xfce4-screenshooter-plugin')

sha256sums=('SKIP' 'SKIP' 'SKIP')
  
pkgver() {
  cd "${pkgname%-*-*}"
  git describe --long | sed -r 's/^xfce4.screenshooter.//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-*-*}"
  patch -Np1 < ../"${pkgname%-*}"+cb-git.patch
  patch -N configure.ac.in < ../systemext.patch
  
}


build() {

msg "Starting build..."

  cd "$srcdir/${pkgname%-*-*}"

	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--disable-debug
  make
}

package() {

msg "Starting install..."

  cd "$srcdir/${pkgname%-*-*}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
