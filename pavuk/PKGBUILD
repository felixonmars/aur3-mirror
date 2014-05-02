# Maintainer: Periklis Ntanasis <pntanasis@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=pavuk
pkgver=0.9.35
pkgrel=6
pkgdesc="A multifunctional open source web grabber"
arch=('i686' 'x86_64')
url="http://pavuk.sourceforge.net/"
license=('custom')
depends=('libxmu' 'gtk2')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6204c7a1339433ab32456ccd62126ea9')
sha1sums=('c7ad9bfd9af60daee606c870d12d3a58dcff1e80')
conflicts=('pavuk')
provides=('pavuk')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS="-march=native -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4"
  CPPFLAGS="-D_FORTIFY_SOURCE=0"
  echo '#! /bin/sh' > /tmp/pavuk-0.9.35-tmp-file
  echo 'LIBS="-lX11"' >> /tmp/pavuk-0.9.35-tmp-file
  cat configure >> /tmp/pavuk-0.9.35-tmp-file
  mv /tmp/pavuk-0.9.35-tmp-file configure
  chmod +x configure
  ./configure --prefix=/usr --enable-threads --disable-docbook
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
