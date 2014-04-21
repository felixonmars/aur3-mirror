# Maintainer: Tasos Latsas < tlatsas2000 at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: damir <damir@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>
# Contributor: caemir

pkgname=gtkatlantic
pkgver=0.5.0
pkgrel=1
pkgdesc='Monopoly board game client for the monopd server.'
arch=('i686' 'x86_64')
url='http://gtkatlantic.gradator.net/'
license=('GPL')
depends=('gtk3')
source=(http://gtkatlantic.gradator.net/downloads/v0.5/$pkgname-$pkgver.tar.gz
        gtkatlantic.desktop)

md5sums=('155d0997b6094807580e47b212a4ca1e'
         '8f570f9210682354b21517e6692ed08a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 $srcdir/$pkgname.desktop \
      $pkgdir/usr/share/applications/$pkgname.desktop
}
