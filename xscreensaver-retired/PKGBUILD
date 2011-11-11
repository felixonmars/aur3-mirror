# $Id: PKGBUILD 113959 2011-03-10 22:37:48Z jgc $
# Maintainer: onexused <aursignup dot kyoo at xoxy dot net>
# Modified to fit your television.

pkgname=xscreensaver-retired
pkgver=5.15
pkgrel=1
pkgdesc="'Retired' xscreensaver hacks that are still included in the source."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('xscreensaver')
makedepends=('bc')
install=xscreensaver-retired.install
source=(http://www.jwz.org/xscreensaver/xscreensaver-${pkgver}.tar.gz \
        comeback.diff \
        LICENSE \
        xscreensaver-retired.install)
md5sums=('c0b8b2c817a9a7371f51a82e80602d10'\
         'd38fe907d3636d6838e31854731cbe8e'\
         '5e7f3f2a63d20a484742f5b4cb5d572c'\
         '74c2b783d3bf714294b44015b50fe6ad')

sha1sums=('b5ce7caa19f4d57c3bac83377a36dddbe7095052'\
          '8075e4801233c0a41e6160ac97a179204c976b1b'\
          '4209ea586b204fd1d81c382a0522c654f9fd9134'\
          '5f963465abad896905511d3a81e11ba4ab203e39')

build() {
  cd "${srcdir}/xscreensaver-${pkgver}"
  patch -Np1 -i "${srcdir}/comeback.diff"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --without-motif --with-gtk --with-gl \
    --without-gle --with-xpm --with-pixbuf --with-jpeg
  make
}

package() {
  cd "${srcdir}/xscreensaver-${pkgver}"
  make install_prefix="${pkgdir}" install
#  cd "${srcdir}/xscreensaver-${pkgver}/hacks"
#  install -d -m644 "${pkgdir}/usr/lib/xscreensaver/"
#  cp ant bubbles critical flag forest glx/glforestfire hyperball hypercube \
#  juggle laser lightning lisa lissie lmorph t3d vines whirlygig worm rotor \
#  sphere spiral \
#  "${pkgdir}/usr/lib/xscreensaver/"
#  cd config
#  install -d -m644 "${pkgdir}/usr/share/xscreensaver/config/"
#  cp ant.xml bubbles.xml critical.xml flag.xml forest.xml glforestfire.xml \
#  hyperball.xml hypercube.xml juggle.xml laser.xml lightning.xml lisa.xml \
#  lissie.xml lmorph.xml t3d.xml vines.xml whirlygig.xml worm.xml rotor.xml \
#  sphere.xml spiral.xml \
#  "${pkgdir}/usr/share/xscreensaver/config/"
  install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
