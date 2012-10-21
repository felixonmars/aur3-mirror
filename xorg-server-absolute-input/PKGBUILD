# Maintainer: Brandon Coffman <bkcoffma@gmail.com> 
pkgname=('xorg-server-absolute-input')
pkgver=1.13.0
pkgrel=1
pkgdesc="Xorg X server patched to prevent jumpy cursors on things that use absolute pointing devices such as USB tablets and VirtualBox"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org"
license=('custom')
groups=()
depends=('libxdmcp' 'libxfont' 'libpciaccess' 'libdrm' 'pixman' 'libgcrypt'
         'libxau' 'xorg-server-common' 'xf86-input-evdev')
makedepends=('pixman' 'libx11' 'mesa' 'libgl' 'xf86driproto' 'xcmiscproto'
             'xtrans' 'bigreqsproto' 'randrproto' 'inputproto' 'fontsproto'
             'videoproto' 'compositeproto' 'recordproto' 'scrnsaverproto'
             'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont'
             'renderproto' 'libpciaccess' 'libxv' 'xf86dgaproto' 'libxmu'
             'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst'
             'libxres' 'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util'
             'glproto' 'dri2proto' 'libgcrypt' 'xf86-input-evdev'
             'xorg-server-common')
provides=('X-ABI-VIDEODRV_VERSION=13' 'X-ABI-XINPUT_VERSION=18'
          'X-ABI-EXTENSION_VERSION=7.0' 'x-server')
conflicts=('xorg-server' 'nvidia-utils<=290.10')
backup=('etc/X11/xorg.conf.d/10-evdev.conf'
        'etc/X11/xorg.conf.d/10-quirks.conf')
options=('!libtool')
source=(${url}/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2
        autoconfig-nvidia.patch
        autoconfig-sis.patch
        xvfb-run
        xvfb-run.1
        10-quirks.conf
        0001-dix-fix-zaphod-screen-scrossing-54654.patch
        0001-dix-set-the-device-transformation-matrix.patch)
sha256sums=('548b91cb01087ad4f892428e7ac4955251cf12393e86c70420436b33848ef28a'
            '66e25f76a7496c429e0aff4b0670f168719bb0ceaeb88c6f2272f2bf3ed21162'
            'd027776fac1f7675b0a9ee817502290b1c45f9c09b0f0a6bb058c35f92361e84'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776'
            '94612f5c0d34a3b7152915c2e285c7b462e9d8e38d3539bd551a339498eac166'
            '23861814b4283ca3fe43aae6e88ee82bcbae5713bf88eabeaef7beb94efe9707'
            '09a49c5aee3df2dddc34c98802c9d75384eec8ba3a9647c9d33aba9625b05d2b')

build() {
  cd "${srcdir}/xorg-server-${pkgver}"

  # Use nouveau/nv/nvidia drivers for nvidia devices
  patch -Np1 -i "${srcdir}/autoconfig-nvidia.patch"

  # Use unofficial imedia SiS driver for supported SiS devices
  patch -Np0 -i "${srcdir}/autoconfig-sis.patch"

  # https://bugs.archlinux.org/task/31959
  patch -Np1 -i ${srcdir}/0001-dix-fix-zaphod-screen-scrossing-54654.patch

  # Mouse jumps to edges / corners when using
  # an absolute input device (ie virtual machine usb tablet)
  # Fixed in upstream - waiting for release
  patch -Np1 -i ${srcdir}/0001-dix-set-the-device-transformation-matrix.patch

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
      --enable-kdrive-evdev \
      --enable-kdrive-kbd \
      --enable-kdrive-mouse \
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

package() {
  cd "${srcdir}/xorg-server-${pkgver}"
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

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-absolute-input"
  ln -sf /usr/share/licenses/xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-absolute-input/COPYING"

  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share/aclocal"
}
