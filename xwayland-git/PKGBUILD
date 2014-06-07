# Maintainer: Yukicanis <yukicanis@gmail.com>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>
# Contributor: Tim Jester-Pfadt <t.jp@gmx.de>
# Edited by: Zachary Lund <admin@computerquip.com>

pkgname=xwayland-git
pkgver=1.15.99.903
pkgrel=1
pkgdesc="Stand-alone Xwayland X server (doesn't replace xorg-server)"
arch=('i686' 'x86_64')
url="http://wayland.freedesktop.org/"
license=('MIT')
depends=('libxfont' 'pixman' 'wayland' 'nettle' 'libgl' 'libunwind' 'libxdmcp' 'libxshmfence' 'libxau')
makedepends=('git' 'xtrans' 'xorg-util-macros' 'xorg-font-util' 'libepoxy'
             'libdmx' 'libxaw' 'libxkbfile' 'libxrender' 'libxres' 'libxtst'
             'xcb-util' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms'
             'dri2proto' 'dri3proto' 'glproto' 'xcmiscproto' 'bigreqsproto'
             'randrproto' 'videoproto' 'compositeproto' 'scrnsaverproto'
             'resourceproto' 'xf86driproto' 'presentproto' 'xineramaproto')
provides=('xwayland')
options=('!libtool')
source=('git+git://anongit.freedesktop.org/xorg/xserver')
sha256sums=('SKIP')

prepare() {
  cd $srcdir/xserver
  git reset --hard HEAD
  git clean -dfx
}

build() {
  cd $srcdir/xserver
  autoreconf -fi
  ./configure --prefix=/usr \
      --enable-xwayland \
      --enable-dri \
      --disable-xorg \
      --disable-xwin \
      --disable-xquartz \
      --disable-xvfb \
      --disable-xnest \
      --disable-docs \
      --disable-devel-docs
  make
}

package() {
  cd $srcdir/xserver
  install -Dm755 hw/xwayland/Xwayland "${pkgdir}/usr/bin/Xwayland"
}

pkgver() {
  cd $srcdir/xserver
  git describe --always | sed 's|xorg-server-||g' | sed 's|-|.|g'
}
