# Contributor: Sergej Pupykin <ps@lx-ltd.ru>
# Maintainer: Ng Oon-Ee <ngoonee.talk@gmail.com>
pkgname=tap-plugins
pkgver=0.7.2
pkgrel=2
pkgdesc="Tom's LADSPA Plugins"
url="http://tap-plugins.sourceforge.net/index.html"
license="GPL"
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('354b171e580cfad6bad87c26a79ef273')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed 's|/usr/local/|$(DESTDIR)/usr/|' -i Makefile
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
