# Maintainer: Dmitry Grebennikov <dmitry.ew at gmail.com>
#patch from: https://bugs.freedesktop.org/show_bug.cgi?id=865

pkgdesc="Apllying patch to fix freedesktop-bug-865: [XKB] need to kick hotkeys on release, not press"
pkgbase=xorg-server-xdb-patch
pkgname=('xorg-server-xdb-patch')
# 'xorg-server-xephyr-xdb-patch' 'xorg-server-xdmx-xdb-patch' 'xorg-server-xvfb-xdb-patch' 'xorg-server-xnest-xdb-patch' 'xorg-server-common-xdb-patch' 'xorg-server-devel-xdb-patch')
pkgver=1.13.1
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 'inputproto' 'fontsproto' 'videoproto'
             'compositeproto' 'recordproto' 'scrnsaverproto' 'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont' 'renderproto' 'libpciaccess'
             'libxv' 'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres' 'xorg-xkbcomp' 'xorg-util-macros'
             'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt')
options=('!libtool')
source=(${url}/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2
        autoconfig-nvidia.patch
        autoconfig-sis.patch
        xvfb-run
        xvfb-run.1
        10-quirks.conf
#        git-fixes.patch
        use-pixman-glyph-cache.patch
#	xkb.patch
	freedesktop-bug-865.patch)

sha256sums=('c93540e2799df4655c6f1b67dc7d8d6db96df4f08ef1702fffbc5df843a43d00'
            '66e25f76a7496c429e0aff4b0670f168719bb0ceaeb88c6f2272f2bf3ed21162'
            'd027776fac1f7675b0a9ee817502290b1c45f9c09b0f0a6bb058c35f92361e84'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776'
            '94612f5c0d34a3b7152915c2e285c7b462e9d8e38d3539bd551a339498eac166'
            '7c1dacd30c46b01424c7c75974285cd348dafd0327eb3f211cbe446ad90dd308'
            '603d6a08565ea780257cc33b567f48786fe9fc22afcc50d6b6b60756c021c06e')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Apply upstream fixes from server-1.13 branch
#  patch -Np1 -i "${srcdir}/git-fixes.patch"

  # Use pixman 0.28.0 glyph cache - backported from git master
#  patch -Np1 -i "${srcdir}/use-pixman-glyph-cache.patch"

  # Use nouveau/nv/nvidia drivers for nvidia devices
  patch -Np1 -i "${srcdir}/autoconfig-nvidia.patch"

  # Use unofficial imedia SiS driver for supported SiS devices
  patch -Np0 -i "${srcdir}/autoconfig-sis.patch"

  # Apply xkb.patch
  patch -Np1 -i "${srcdir}/freedesktop-bug-865.patch"

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