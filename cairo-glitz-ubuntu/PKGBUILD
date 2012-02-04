# $Id$
# Contributor: Niccolò Forlini <nick@linuxbox360.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-glitz-ubuntu
_realname=cairo
pkgver=1.8.8
_pkgver=2ubuntu1
pkgrel=1
pkgdesc="Cairo vector graphics library with glitz backend and Ubuntu's LCD rendering patches."
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('glitz' 'libpng>=1.2.31' 'libxrender' 'fontconfig>=2.6.0' 'pixman>=0.12.0' 'xcb-util>=0.3.0')
makedepends=('pkgconfig')
options=('!libtool')
provides=("$_realname=$pkgver")
conflicts=("$_realname" "cairo-wglitz" "cairo-glitz" "cairo-cleartype" "cairo-lcd" "cairo-xeffects" "cairo-glitz-cleartype")
source=(http://cairographics.org/releases/$_realname-${pkgver}.tar.gz 
        http://download.tuxfamily.org/ccm/glitz/0001-Fix-glitz-support-for-24.8-fixed-point.patch
        http://archive.ubuntu.com/ubuntu/pool/main/c/cairo/cairo_${pkgver}-${_pkgver}.diff.gz)
md5sums=('d3e1a1035ae563812d4dd44a74fb0dd0' 
         'e9f6817d38bd02cae9d5958aaa31e8b8'
	 'f6f1ff76133abe521a4f4ed373af66df')


build() {
  cd "${srcdir}/$_realname-${pkgver}"
  patch -p1 < ${srcdir}/0001-Fix-glitz-support-for-24.8-fixed-point.patch || return 1

  # Ubuntu patch
  patch -Np1 -i ../cairo_${pkgver}-${_pkgver}.diff || return 1  

  for _f in $(cat debian/patches/00list) ; do    
      patch -Np1 -i debian/patches/${_f} || return 1    
  done

  ./configure --prefix=/usr --sysconfdir=/etc --enable-glitz\
    --localstatedir=/var --enable-xcb --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  # Docs
  # Excluding debian/changelog temporarily
  install -d ${pkgdir}/usr/share/doc/cairo/
  install -m644 -t ${pkgdir}/usr/share/doc/cairo/ NEWS README || return 1
}

