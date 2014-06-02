# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Based on `ode` package in [community]
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>
_pkgname=ode
pkgname=ode-sp
pkgver=0.13
pkgrel=1
pkgdesc="An open source, high performance library for simulating rigid body dynamics (single precision)"
arch=('i686' 'x86_64')
url="http://www.ode.org"
license=('LGPL' 'BSD')
depends=('gcc-libs' 'bash')
conflicts=('ode')
source=("http://downloads.sourceforge.net/sourceforge/opende/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('04b32c9645c147e18caff7a597a19f84')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --enable-shared \
              --enable-libccd
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR=${pkgdir}/ install

  install -Dm0644 ${srcdir}/${_pkgname}-${pkgver}/ou/LICENSE-BSD.TXT \
                  ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-BSD.TXT
  install -Dm0644 ${srcdir}/${_pkgname}-${pkgver}/GIMPACT/GIMPACT-LICENSE-BSD.TXT \
                  ${pkgdir}/usr/share/licenses/${_pkgname}/GIMPACT-LICENSE-BSD.TXT
  install -Dm0644 ${srcdir}/${_pkgname}-${pkgver}/libccd/BSD-LICENSE \
                  ${pkgdir}/usr/share/licenses/${_pkgname}/BSD-LICENSE
}
