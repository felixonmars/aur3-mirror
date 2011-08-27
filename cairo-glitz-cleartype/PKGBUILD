# $Id$
# Contributor: Niccolò Forlini <nick@linuxbox360.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-glitz-cleartype
_realname=cairo
pkgver=1.8.8
pkgrel=1
pkgdesc="Cairo vector graphics library with glitz backend and cleartype patch."
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('glitz' 'libpng>=1.2.31' 'libxrender' 'fontconfig>=2.6.0' 'pixman>=0.12.0' 'xcb-util>=0.3.0')
makedepends=('pkgconfig')
options=('!libtool')
provides=("$_realname=$pkgver")
conflicts=("$_realname" "cairo-wglitz" "cairo-glitz" "cairo-cleartype" "cairo-lcd"  "cairo-xeffects"  "cairo-glitz-ubuntu")
source=(http://cairographics.org/releases/$_realname-${pkgver}.tar.gz 
        http://download.tuxfamily.org/ccm/glitz/0001-Fix-glitz-support-for-24.8-fixed-point.patch
        libcairo-1.2.4-lcd-cleartype-like.diff)
md5sums=('d3e1a1035ae563812d4dd44a74fb0dd0' 
         'e9f6817d38bd02cae9d5958aaa31e8b8'
	 'de7cccfcca8e686bca039a985436548e')


build() {
  cd "${srcdir}/$_realname-${pkgver}"
  patch -p1 < ${srcdir}/0001-Fix-glitz-support-for-24.8-fixed-point.patch || return 1
  patch -Np1 -i ${srcdir}/libcairo-1.2.4-lcd-cleartype-like.diff || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --enable-glitz\
    --localstatedir=/var --enable-xcb --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

