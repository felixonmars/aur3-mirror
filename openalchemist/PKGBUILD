# Contributor: zoulnix <z[o]ulnix.borkedduck.c[o]m>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=openalchemist
pkgver=0.3
pkgrel=2
pkgdesc="OpenAlchemist is a new reflexion game which looks like Tetris\
but where you can take your time. Be a crazy alchemist and try to make new\
objects from those you get from the sky."
arch=(i686 x86_64)
url="http://www.openalchemist.com/"
license=('GPL' 'CCPL:by-sa') # Code is licensed under GPL 2+ 
                             # Graphics are licensed under CC BY-SA 2.0
depends=('clanlib>=1.0.0')
makedepends=('autoconf' 'automake' 'gcc' 'make' 'patch' 'pkgconfig' 'zip')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-src.tar.gz
        ${pkgname}-clanlib1.0.patch \
        openalchemist.desktop)
md5sums=('3107b699d63d5ae7cbf65ddc9872c49a'
         '0dc18074d7115e8f5d6528fcb2be83e3'
         'dd99627251d7b3f631eb60708161a1a1')

build() {
  cd ${srcdir}/$pkgname-$pkgver-src
  
  # Applying Patch*
  patch -Np1 -i ../${pkgname}-clanlib1.0.patch || return 1
  
  # Regenerating building system
  sh autogen.sh || return 1
  
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static
  
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  # Other files
  install -d ${pkgdir}/usr/share/{applications,pixmaps} || return 1
  
  install -m644 ${startdir}/${pkgname}.desktop \
                ${pkgdir}/usr/share/applications/ || return 1
  install -m644 data/logo.png \
                ${pkgdir}/usr/share/pixmaps/${pkgname}.png || return 1
  install -m644 data/logo_svg.svg\
                ${pkgdir}/usr/share/pixmaps/${pkgname}.svg || return 1

  # Removing unnecessary stuff
  find ${pkgdir} -type f -name "*LICENSE*" -exec rm {} \;

}

# vim:set ts=2 sw=2 et:
