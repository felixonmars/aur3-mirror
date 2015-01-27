# Maintainer: Sam Andersen <samstext at gmail dot com>

pkgname=tigervnc-armv7h
pkgver=r2867.e4d9726
pkgrel=1
_xorgver=1.16.2.901
pkgdesc="Suite of VNC servers and clients. Based on the VNC 4 branch of TightVNC. For ARMv7(h)."
arch=('armv7h')
url="http://www.tigervnc.org"
license=('GPL')
depends=('fltk' 'pam' 'gnutls' 'libjpeg-turbo' 'libxtst' 'libxfont' 'pixman'
	 'xorg-xauth' 'xorg-xsetroot' 'xkeyboard-config' 'xorg-xkbcomp'
	 'libgl' 'libgcrypt' 'perl')
makedepends=('cmake' 'nasm' 'xorg-font-util' 'xorg-util-macros' 'bigreqsproto'
	     'compositeproto' 'damageproto' 'randrproto' 'resourceproto'
	     'scrnsaverproto' 'videoproto' 'xcmiscproto' 'xf86vidmodeproto'
	     'xtrans' 'glproto' 'dri2proto' 'dri3proto' 'presentproto'
	     'mesa' 'git' 'xf86driproto')
optdepends=('mesa: for OpenGL functionality in Xvnc')
conflicts=('tigervnc' 'tightvnc' 'tigervnc-armv7h')
provides=('tigervnc-armv7h')
source=(git+https://github.com/TigerVNC/tigervnc.git
	ftp://ftp.freedesktop.org/pub/xorg/individual/xserver/xorg-server-${_xorgver}.tar.bz2
	vncserver.service
	vncviewer.desktop
	gethomedir.patch
	getmaster.patch
	compile_fix.patch
    CMake.patch)
md5sums=('SKIP'
         '82cbcf6755787962e943d8e23495358d'
         '0903d5a0dfa38e0b04964505b644585c'
         'b200d83c60e80c6f9693ea19a2d9f5b0'
         '22f1523a0eca56ad79cfabd0db6e2cf6'
         'e056a2502dfe0cb3b02e08cab689482f'
         'a509e1372cd6fb423284979a9e7f1770'
         '0bf2f344db1ae3dbfb7b375b0a0952b3')

pkgver() {
  cd tigervnc
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {

    cd tigervnc
    cp ../../CMake.patch ./
    patch < CMake.patch

    patch -Np1 -i ${srcdir}/gethomedir.patch
    patch -Np1 -i ${srcdir}/getmaster.patch
    patch -Np1 -i ${srcdir}/compile_fix.patch
    sed -i 's/iconic/nowin/' unix/vncserver

    cd unix/xserver
    cp -r ${srcdir}/xorg-server-${_xorgver}/* .
    patch -Np1 -i ../xserver116.patch
}

build() {
    cd tigervnc
    cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr
    make

    cd unix/xserver
    autoreconf -fiv
    ./configure --prefix=/usr --disable-static --disable-xinerama --without-dtrace --disable-xorg --disable-xnest --disable-xvfb --disable-dmx --disable-xwin --disable-xephyr --disable-kdrive --disable-xwayland --disable-config-hal --disable-config-udev --with-pic --disable-unit-tests --disable-devel-docs --disable-selective-werror --disable-dri --enable-dri2 --enable-dri3 --enable-glx --enable-glx-tls
    make
}

package() {
  cd tigervnc
  make DESTDIR=${pkgdir} install
  cd unix/xserver/hw/vnc
  make DESTDIR=${pkgdir} install
  install -Dm0644 $srcdir/vncserver.service $pkgdir/usr/lib/systemd/system/vncserver.service
  install -Dm0644 $srcdir/vncviewer.desktop $pkgdir/usr/share/applications/vncviewer.desktop
}

