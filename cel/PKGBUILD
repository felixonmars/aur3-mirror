# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=cel
pkgver=2.0
pkgrel=1
pkgdesc="A set of plugins and applications to specifically help with writing games"
arch=('i686' 'x86_64')
url="http://www.crystalspace3d.org/main/CEL"
license=('LGPL')
depends=('crystalspace')
makedepends=('pkgconfig' 'autoconf' 'automake' 'jam')
source=(http://www.crystalspace3d.org/downloads/release/cel-src-${pkgver}.tar.bz2
        cel.profile)
md5sums=('d1ab4a29cd50aa713d7353cbee7b0ee4'
         '892c22fb3cb894d49d2dcb114c992fdf')

build() {
  cd ${srcdir}/${pkgname}-src-${pkgver}
  ./autogen.sh
  PYTHON=python2 \
  CXXFLAGS='-fpermissive' \
  ./configure --prefix=/opt/cel --sysconfdir=/etc --without-python
  jam -q
}

package() {
  cd ${srcdir}/${pkgname}-src-${pkgver}
  jam DESTDIR="$pkgdir" install

  install -D -m755 "${srcdir}"/cel.profile "${pkgdir}"/etc/profile.d/cel.sh

  install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
  echo '/opt/cel/lib' > "${pkgdir}"/etc/ld.so.conf.d/cel.conf
}
