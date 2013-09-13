# Original PKGBUILD by Jan de Groot <jgc@archlinux.org>
# Patch by Procyon

pkgname=lib32-libx11-ldpreloadnograb
pkgver=1.6.2
pkgrel=1
pkgdesc="X11 client-side library with no keyboard grab and no mouse grab patch usable with LD_PRELOAD"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(lib32-libx11)
makedepends=(gcc-multilib 'xorg-util-macros' 'xextproto' 'xtrans' 'inputproto')
options=('!libtool')
license=('custom')
source=(
${url}/releases/individual/lib/libX11-${pkgver}.tar.bz2
)
sha256sums=(
2aa027e837231d2eeea90f3a4afe19948a6eb4c8b2bec0241eba7dbc8106bd16
)

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "${srcdir}/libX11-${pkgver}"

  ./configure --libdir=/usr/lib32 --disable-specs --prefix=/usr --disable-static --disable-xf86bigfont

  #we will make three alternative libraries with different names.
  #A make clean seems to be necessary because it doesn't see the change for some reason.
  #no keyboard / no mouse / no key & no mouse
  
  #back up key grab file
  cp src/GrKeybd.c src/GrKeybd.bak

  #Patch keyboard grab prevention
  sed -i '/xGrabKeyboardReply/i return (GrabSuccess);' src/GrKeybd.c

  make

  #One done
  mv src/.libs/libX11.so.6.3.0 libX11-nokey.so

  #restore keygrab
  mv src/GrKeybd.bak src/GrKeybd.c

  #Mouse grab prevention.
  sed -i '/xGrabPointerReply/i return (GrabSuccess);' src/GrPointer.c

  make clean
  make

  #Two done
  mv src/.libs/libX11.so.6.3.0 libX11-nomouse.so

  #both patches
  sed -i '/xGrabKeyboardReply/i return (GrabSuccess);' src/GrKeybd.c

  make clean
  make

  #All done
  mv src/.libs/libX11.so.6.3.0 libX11-nokeynomouse.so
}

package() {
  cd "${srcdir}/libX11-${pkgver}"

  install -m755 -d "${pkgdir}/usr/lib32/"
  install -m755 libX11-* "${pkgdir}/usr/lib32/"
}
