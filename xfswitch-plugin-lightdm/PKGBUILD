# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Loic Pefferkorn <${firstname} AT loicp DOT eu>
pkgname=xfswitch-plugin-lightdm
_pkgname=xfswitch-plugin
pkgver=0.0.1
pkgrel=1
pkgdesc="User switching plugin for the Xfce4 Panel that works with lightdm and NO need for gdm and gnome deps!"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfswitch-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'lightdm')
conflicts=('gdm' 'xfswitch-plugin')
makedepends=('pkg-config' 'intltool')
source=(http://archive.xfce.org/src/panel-plugins/${_pkgname}/0.0/$_pkgname-$pkgver.tar.gz)
install=post.install
sha256sums=('44fede57f181b507277ae406a6e56f215bb4ba29b60442e6ccd166e7df98a738')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
