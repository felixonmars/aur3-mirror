# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
# Original Maintainer: Alexander Baldeck <kth5@archlinux.org>
# Original Contributor: Jan de Groot <jgc@archlinux.org>
# This is a modified version of this package: http://aur.archlinux.org/packages.php?ID=26687

pkgname=xorg-server-1.7-catalyst-maximize-fix
srcname=xorg-server
pkgver=1.7.7
pkgrel=1
pkgdesc="X.Org X servers with fedora patch, that fix slow maximizing and resizing with catalyst (for X server 1.7)"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org"
depends=('hal>=0.5.12' 'libgl' 'libxfont>=1.4.0' 'openssl>=0.9.8k' 'libpciaccess>=0.10.8' 'libxv>=1.0.4' 'pixman>=0.16.0' 'xcursor-themes' 'xkeyboard-config>=1.6' 'xorg-server-utils' 'xorg-fonts-misc' 'xbitmaps' 'diffutils' 'xf86-input-evdev>=2.2.5')
makedepends=('libx11>=1.2.2' 'mesa>=7.5.1' 'xf86driproto>=2.1.0' 'xtrans>=1.2.4' 'libxkbfile>=1.0.5' 'randrproto>=1.3.0' 'renderproto>=0.9.3' 'xcmiscproto>=1.2.0' 'bigreqsproto>=1.1.0' 'resourceproto>=1.0.2' 'videoproto>=2.3.0' 'compositeproto>=0.4' 'scrnsaverproto>=1.2.0' 'xf86dgaproto>=2.0.99.1' 'recordproto>=1.13.2' 'libgl>=7.5.1' 'glproto>=1.4.9' 'xorg-util-macros' 'xineramaproto>=1.1.99.1')
conflicts=('catalyst-utils<=9.2')
options=('!libtool')
provides=('x-server' 'xorg-server' 'xorg-server=1.7.7')
groups=('xorg')
install=xorg-server.install
conflicts=('catalyst-utils<=9.2')
source=(${url}/releases/individual/xserver/${srcname}-${pkgver}.tar.bz2
        xorg-redhat-die-ugly-pattern-die-die-die.patch
        xvfb-run
        xvfb-run.1
        fedora_dont_backfill_bg_none.patch)

md5sums=('8c0146330fb155c23d947ac37d431d4b'
         '1a336eb22e27cbf443ec5a2ecddfa93c'
         '52fd3effd80d7bc6c1660d4ecf23d31c'
         '376c70308715cd2643f7bff936d9934b'
         '9c68ab9f2ccab42a5ddac36767d69dc0')

build() {
  cd "${srcdir}/${srcname}-${pkgver}"
  # Get rid of the ugly pattern
  patch -Np3 -i "${srcdir}/xorg-redhat-die-ugly-pattern-die-die-die.patch" || return  1

  # Fix dbus config path
  sed -i -e 's/\$(sysconfdir)/\/etc/' config/Makefile.*  || return 1

  # Fix for slow fglrx maximize etc.
  msg "Fedora patch"
  patch -Np1 -i "${srcdir}/fedora_dont_backfill_bg_none.patch" || return 1

  ./configure --prefix=/usr \
              --enable-ipv6 \
              --enable-dri \
              --disable-dmx \
              --enable-xvfb \
              --enable-xnest \
              --enable-composite \
              --enable-xcsecurity \
              --enable-xorg \
      	      --enable-xephyr \
              --enable-glx-tls \
	            --enable-kdrive \
              --enable-install-setuid \
              --enable-config-hal \
      	      --enable-config-dbus \
      	      --enable-record \
      	      --disable-xfbdev \
      	      --disable-xfake \
      	      --disable-xsdl \
              --disable-static \
              --sysconfdir=/etc/X11 \
              --localstatedir=/var \
              --with-default-font-path=/usr/share/fonts/misc,/usr/share/fonts/100dpi:unscaled,/usr/share/fonts/75dpi:unscaled,/usr/share/fonts/TTF,/usr/share/fonts/Type1 \
              --with-xkb-path=/usr/share/X11/xkb \
              --with-xkb-output=/var/lib/xkb \
              --with-dri-driver-path=/usr/lib/xorg/modules/dri || return 1

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/" || return 1
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/" || return 1

  rm -rf "${pkgdir}/var/log" || return 1

  install -m755 -d "${pkgdir}/etc/X11" || return 1
  install -m755 -d "${pkgdir}/var/lib/xkb" || return 1

  # Needed for non-mesa drivers, libgl will restore it
  mv "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so" \
     "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.xorg" || return 1

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
