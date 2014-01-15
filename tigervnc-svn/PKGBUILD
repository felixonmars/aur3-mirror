# Maintainer: Uroš Vampl <mobile.leecher at gmail dot com>

pkgname=tigervnc-svn
pkgver=5157
pkgrel=1
_xorgver=1.15.0
pkgdesc="suite of VNC servers and clients. Based on the VNC 4 branch of TightVNC."
arch=('i686' 'x86_64')
url="http://www.tigervnc.org"
license=('GPL')
depends=('fltk' 'pam' 'gnutls' 'libxtst' 'libxfont' 'pixman'
         'xorg-xauth' 'xorg-xsetroot' 'xkeyboard-config' 'xorg-xkbcomp'
         'libgl' 'perl')
makedepends=('cmake' 'nasm' 'xorg-font-util' 'xorg-util-macros' 'bigreqsproto'
             'compositeproto' 'damageproto' 'dri2proto' 'glproto' 'randrproto'
             'resourceproto' 'scrnsaverproto' 'videoproto' 'xcmiscproto'
             'xf86vidmodeproto' 'xtrans' 'mesa' 'subversion')
options=(!libtool)
conflicts=('tigervnc' 'tightvnc')
provides=('tigervnc')
source=(tigervnc::svn+https://tigervnc.svn.sourceforge.net/svnroot/tigervnc/trunk
        ftp://ftp.freedesktop.org/pub/xorg/individual/xserver/xorg-server-${_xorgver}.tar.bz2
	vncserver.service
	vncviewer.desktop
        gethomedir.patch
        getmaster.patch
        xorg115.patch)
md5sums=('SKIP'
         'c2ace3697b32414094cf8c597c39d7d9'
         '0903d5a0dfa38e0b04964505b644585c'
         'c93fd99581200be4cb4716cda2122065'
         '22f1523a0eca56ad79cfabd0db6e2cf6'
         'e056a2502dfe0cb3b02e08cab689482f'
         'd7765cb11be43b557ee77dfa486fdb68')

pkgver() {
  cd ${SRCDEST}/tigervnc
  svnversion | tr -d [A-z]
}

build() {
  cd ${srcdir}/tigervnc

  cp -r ${srcdir}/xorg-server-${_xorgver}/* unix/xserver
  patch -Np1 -i ${srcdir}/gethomedir.patch
  patch -Np1 -i ${srcdir}/getmaster.patch
  patch -Np1 -i ${srcdir}/xorg115.patch

  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd unix/xserver
  patch -Np1 -i ../xserver114.patch
  autoreconf -fiv
  ./configure --prefix=/usr \
	--disable-wayland --disable-present --disable-dri3 \
	--disable-static --disable-xinerama --without-dtrace \
	--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
	--disable-xwin --disable-xephyr --disable-kdrive --with-pic \
	--disable-config-dbus --disable-config-hal --disable-config-udev \
	--disable-unit-tests --disable-devel-docs --disable-selective-werror \
	--disable-dri --enable-dri2 --enable-glx --enable-glx-tls
  make
}

package() {
  cd ${srcdir}/tigervnc
  make DESTDIR=${pkgdir} install
  cd unix/xserver/hw/vnc
  make DESTDIR=${pkgdir} install
  sed -i 's/iconic/nowin/' ${pkgdir}/usr/bin/vncserver
  install -Dm0644 $srcdir/vncserver.service $pkgdir/usr/lib/systemd/system/vncserver.service
  install -Dm0644 $srcdir/vncviewer.desktop $pkgdir/usr/share/applications/vncviewer.desktop
}
