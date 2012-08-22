# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server1.10
_pkgbase=xorg-server
pkgname=xorg-server1.10
true && pkgname=('xorg-server1.10' 'xorg-server1.10-xephyr' 'xorg-server1.10-xdmx' 'xorg-server1.10-xvfb' 'xorg-server1.10-xnest' 'xorg-server1.10-common' 'xorg-server1.10-devel')
pkgver=1.10.6
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 'inputproto' 'fontsproto' 'videoproto' 'compositeproto' 'recordproto' 'scrnsaverproto' 'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont' 'renderproto' 'libpciaccess' 'libxv' 'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres' 'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'glproto' 'dri2proto')
options=('!libtool')
source=(${url}/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2
        bg-none-revert.patch
        xserver-1.10-pointer-barriers.patch
        autoconfig-nvidia.patch
        xvfb-run
        xvfb-run.1
        10-quirks.conf
        compsize.h
        glxcmds.h)
sha1sums=('398b5ba7332829f1831b8fa69e2ea071fb7d1e59'
          '629c6d8d52126eab81ee1b72a9e4209535f8cb81'
          '1b95e91384a57d966428c7db98ed06f4cc562f91'
          'f9328fd7bc931bb02c8909ecfcef35403de33782'
          'c94f742d3f9cabf958ae58e4015d9dd185aabedc'
          '6838fc00ef4618c924a77e0fb03c05346080908a'
          '993798f3d22ad672d769dae5f48d1fa068d5578f'
          '1cad9e90dc92d1baa4f9446246d3af1311b28fe4'
          'c607abca3ec02dce366c5b3f63a7a778ef02ddc7')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  # Add pointer barrier support, patch from Fedora
  patch -Np1 -i "${srcdir}/xserver-1.10-pointer-barriers.patch"

  # Patches from ~ajax/xserver xserver-next branch
  patch -Np1 -i "${srcdir}/bg-none-revert.patch"

  # Use nouveau/nv/nvidia drivers for nvidia devices
  patch -Np1 -i "${srcdir}/autoconfig-nvidia.patch"

  # Add missing files
  cp "${srcdir}"/{glxcmds,compsize}.h hw/dmx/glxProxy/

  autoreconf -fi
  ./configure --prefix=/usr \
      --enable-ipv6 \
      --enable-dri \
      --enable-dmx \
      --enable-xvfb \
      --enable-xnest \
      --enable-composite \
      --enable-xcsecurity \
      --enable-xorg \
      --enable-xephyr \
      --enable-glx-tls \
      --enable-kdrive \
      --enable-install-setuid \
      --enable-config-udev \
      --disable-config-dbus \
      --enable-record \
      --disable-xfbdev \
      --disable-xfake \
      --disable-static \
      --sysconfdir=/etc/X11 \
      --localstatedir=/var \
      --with-xkb-path=/usr/share/X11/xkb \
      --with-xkb-output=/var/lib/xkb \
      --with-fontrootdir=/usr/share/fonts
  make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -i hw/Makefile
}

package_xorg-server1.10-common() {
  pkgdesc="Xorg server common files"
  depends=('xkeyboard-config' 'xorg-xkbcomp' 'xorg-setxkbmap' 'xorg-fonts-misc')
  provides=("xorg-server-common=$pkgver")
  conflicts=('xorg-server-common')

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.10-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server1.10-common"
  
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 doc/man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server1.10() {
  pkgdesc="Xorg X server"
  depends=(libxdmcp libxfont udev libpciaccess libdrm pixman libgcrypt libxau xorg-server1.10-common xf86-input-evdev1.10)
  backup=('etc/X11/xorg.conf.d/10-evdev.conf' 'etc/X11/xorg.conf.d/10-quirks.conf')
  provides=('x-server' "xorg-server=$pkgver")
  conflicts=('xorg-server')
  groups=('xorg1.10')

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/etc/X11"
  mv "${pkgdir}/usr/share/X11/xorg.conf.d" "${pkgdir}/etc/X11/"
  install -m644 "${srcdir}/10-quirks.conf" "${pkgdir}/etc/X11/xorg.conf.d/"

  rmdir "${pkgdir}/usr/share/X11"

  # Needed for non-mesa drivers, libgl will restore it
  mv "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so" \
     "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.xorg"

  rm -rf "${pkgdir}/var"

  rm -f "${pkgdir}/usr/share/man/man1/Xserver.1"
  rm -f "${pkgdir}/usr/lib/xorg/protocol.txt"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.10"
  ln -sf ../xorg-server1.10-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.10/COPYING"

  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share/aclocal"
}

package_xorg-server1.10-xephyr() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont libgl libgcrypt libxv pixman xorg-server1.10-common)
  provides=("xorg-server-xephyr=$pkgver")
  conflicts=('xorg-server-xephyr')

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/kdrive"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.10-xephyr"
  ln -sf ../xorg-server1.10-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.10-xephyr/COPYING"
}

package_xorg-server1.10-xvfb() {
  pkgdesc="Virtual framebuffer X server"
  depends=(libxfont libxdmcp libxau libgcrypt pixman xorg-server1.10-common)
  provides=("xorg-server-xvfb=$pkgver")
  conflicts=('xorg-server-xvfb')

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/vfb"
  make DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.10-xvfb"
  ln -sf ../xorg-server1.10-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.10-xvfb/COPYING"
}

package_xorg-server1.10-xnest() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont libxext libgcrypt pixman xorg-server1.10-common)
  provides=("xorg-server-xnest=$pkgver")
  conflicts=('xorg-server-xnest')

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/xnest"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.10-xnest"
  ln -sf ../xorg-server1.10-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.10-xnest/COPYING"
}

package_xorg-server1.10-xdmx() {
  pkgdesc="Distributed Multihead X Server and utilities"
  depends=(libxfont libxi libgcrypt libxaw libxrender libdmx libxfixes pixman xorg-server1.10-common)
  provides=("xorg-server-xdmx=$pkgver")
  conflicts=('xorg-server-xdmx')

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/dmx"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.10-xdmx"
  ln -sf ../xorg-server1.10-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.10-xdmx/COPYING"
}

package_xorg-server1.10-devel() {
  pkgdesc="Development files for the X.Org X server"
  depends=(xproto randrproto renderproto xextproto inputproto kbproto fontsproto videoproto dri2proto xineramaproto xorg-util-macros pixman libpciaccess)
  provides=("xorg-server-devel=$pkgver")
  conflicts=('xorg-server-devel')

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/share/X11"
  rm -rf "${pkgdir}/usr/lib/xorg"
  rm -rf "${pkgdir}/var"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.10-devel"
  ln -sf ../xorg-server1.10-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.10-devel/COPYING"
}

# AUR workaround
pkgdesc="Xorg X server"
depends=('xkeyboard-config' 'xorg-xkbcomp' 'xorg-setxkbmap' 'xorg-fonts-misc' libxdmcp libxfont udev libpciaccess libdrm pixman libgcrypt libxau xf86-input-evdev1.10 libgl libxv pixman libxdmcp libxext libxi libxaw libxrender libdmx libxfixes xproto randrproto renderproto xextproto inputproto kbproto fontsproto videoproto dri2proto xineramaproto xorg-util-macros libpciaccess)
true && depends=()

