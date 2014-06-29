# Maintainer: Damian Barberon <damian01w@gmail.com>

pkgbase=ode
pkgname=ode0.12
pkgver=0.12
pkgrel=1
pkgdesc="An open source, high performance library for simulating rigid body dynamics"
arch=('i686' 'x86_64')
url="http://www.ode.org"
license=('LGPL' 'BSD')
options=('!libtool')
provides=('ode')
conflicts=('ode')
depends=('gcc-libs' 'bash')
source=("http://downloads.sourceforge.net/sourceforge/opende/${pkgbase}-${pkgver}.tar.bz2")
md5sums=('48fdd41fae1a7e7831feeded09826599')


build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ./configure --prefix=/usr \
              --enable-shared \
              --enable-libccd \
              --enable-double-precision
  make
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  make DESTDIR=${pkgdir}/ install

  install -Dm0644 ${srcdir}/${pkgbase}-${pkgver}/ou/LICENSE-BSD.TXT \
                  ${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE-BSD.TXT
  install -Dm0644 ${srcdir}/${pkgbase}-${pkgver}/GIMPACT/GIMPACT-LICENSE-BSD.TXT \
                  ${pkgdir}/usr/share/licenses/${pkgbase}/GIMPACT-LICENSE-BSD.TXT
  install -Dm0644 ${srcdir}/${pkgbase}-${pkgver}/libccd/BSD-LICENSE \
                  ${pkgdir}/usr/share/licenses/${pkgbase}/BSD-LICENSE
}
