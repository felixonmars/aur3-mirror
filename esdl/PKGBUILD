# Contributor: kappa <kappacurve@gmail.com>

pkgname=esdl
pkgver=1.0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="SDL and OpenGL bindings for the Erlang programming language"
url="http://esdl.sourceforge.net"
license=('custom')
depends=('erlang>=R13B' 'sdl' 'mesa')
source=(http://downloads.sourceforge.net/esdl/$pkgname-$pkgver.src.tar.gz)
md5sums=('50230ea81418cb029281a70627a5dd8e')
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  find -type f -print0 | xargs -0 chmod 644
  make || return 1
  make INSTALLDIR=${pkgdir}/usr/lib/erlang/lib/${pkgname}-${pkgver} install || return 1
  install -D -m 644 ${srcdir}/$pkgname-$pkgver/license.terms ${pkgdir}/usr/share/licenses/esdl/license.terms
}
