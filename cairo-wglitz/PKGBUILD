# $Id$
# Contributor: Niccolò Forlini <nick@linuxbox360.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-wglitz
_realname=cairo
pkgver=1.8.6
pkgrel=2
pkgdesc="Cairo vector graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('glitz' 'libpng>=1.2.31' 'libxrender' 'fontconfig>=2.6.0' 'pixman>=0.12.0' 'xcb-util>=0.3.0')
makedepends=('pkgconfig')
options=('!libtool')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
source=(http://cairographics.org/releases/$_realname-${pkgver}.tar.gz)
md5sums=('4e64139ef6f668df24450f3b81dd0771')

build() {
  cd "${srcdir}/$_realname-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-glitz\
    --localstatedir=/var --enable-xcb --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

