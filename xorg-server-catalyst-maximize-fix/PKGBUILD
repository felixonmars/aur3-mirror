# Maintainer Vi0l0 <vi0l093@gmail.com>
# Based on xorg-server-dev created by Det <nimetonmaili at gmail a-dot com>
# and original xorg-server by Jan de Groot <jgc@archlinux.org>


pkgname=xorg-server-catalyst-maximize-fix
srcname=xorg-server
pkgver=1.10.4
pkgrel=1
pkgdesc="X.Org X servers with backclear patch that fix slow maximizing and resizing with catalyst. xorg-server + xorg-server-common + xorg-server-devel"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org"
license=(custom)
depends=(dri2proto fontsproto inputproto kbproto libdrm libgcrypt libpciaccess libdmx libxau libxaw libxdmcp libxfixes libxfont libxi libxrender libxv pixman randrproto renderproto udev videoproto xextproto xf86-input-evdev xineramaproto xkeyboard-config xorg-fonts-misc xorg-xkb-utils xorg-util-macros xproto libgl)
makedepends=(bigreqsproto compositeproto dmxproto libx11 libxkbfile libxmu libxres libxtst mesa recordproto resourceproto scrnsaverproto xcmiscproto xf86dgaproto xf86driproto xtrans)
conflicts=(xorg-server xorg-server-common xorg-server-devel)
provides=(x-server "xorg-server=$pkgver-$pkgrel" "xorg-server-common=$pkgver-$pkgrel" "xorg-server-devel=$pkgver-$pkgrel")
options=(!libtool)
groups=(xorg)
replaces=('xorg-server-catalyst-maximize-fix-test')
backup=(etc/X11/xorg.conf.d/10-evdev.conf etc/X11/xorg.conf.d/10-quirks.conf)
source=(${url}/releases/individual/xserver/${srcname}-${pkgver}.tar.bz2
        bg-none-revert.patch
        xserver-1.10-pointer-barriers.patch
        autoconfig-nvidia.patch
        10-quirks.conf
	10-evdev.conf
	xserver-xorg-backclear.patch)
sha1sums=('857d6377025c77851a3cc5f8ec2ce84164a2fdc6'
          '629c6d8d52126eab81ee1b72a9e4209535f8cb81'
          '1b95e91384a57d966428c7db98ed06f4cc562f91'
          'f9328fd7bc931bb02c8909ecfcef35403de33782'
          '993798f3d22ad672d769dae5f48d1fa068d5578f'
	  'd01e3f0c2bc03331e6ece008a2dfe176fdf59267'
	  '9ffb14009ecbfa50c7b92e5daa1e89d3965b74f4')



build() {
  cd "$srcdir/${srcname/-d*}-$pkgver"

  # Add pointer barrier support, patch from Fedora
  patch -Np1 -i "${srcdir}/xserver-1.10-pointer-barriers.patch"

  # Patches from ~ajax/xserver xserver-next branch
  patch -Np1 -i "${srcdir}/bg-none-revert.patch"

  # Use nouveau/nv/nvidia drivers for nvidia devices
  patch -Np1 -i "${srcdir}/autoconfig-nvidia.patch"

  # Fix for slow fglrx maximize etc.
  msg "backclear patch"
  patch -Np1 -i "${srcdir}/xserver-xorg-backclear.patch" || return 1

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
      --with-dri-driver-path=/usr/lib/xorg/modules/dri \
      --with-fontrootdir=/usr/share/fonts
  make

  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -i hw/Makefile
}

package() {
  cd "$srcdir/${srcname/-d*}-$pkgver"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/var/log"

  install -m755 -d "$pkgdir/var/lib/xkb"

  # Install sane config files in /etc
  install -m755 -d "$pkgdir/etc/X11/xorg.conf.d"
  install -m644 "$srcdir/10-quirks.conf" "$pkgdir/etc/X11/xorg.conf.d/"
  install -m644 "$srcdir/10-evdev.conf" "$pkgdir/etc/X11/xorg.conf.d/"
  rm -rf "$pkgdir/usr/share/X11"

  # Needed for non-mesa drivers, libgl will restore it
  mv "$pkgdir/usr/lib/xorg/modules/extensions/libglx.so" \
     "$pkgdir/usr/lib/xorg/modules/extensions/libglx.xorg"

  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
} 
