# Maintainer: cantabile <cantabile dot desu at gmail dot com>

pkgname=twf
_realname=thewidgetfactory
pkgver=0.2.1
pkgrel=2
pkgdesc="A showcase for (gtk2) widgets."
arch=('i686' 'x86_64')
url="http://www.stellingwerff.com/?page_id=10"
license=('GPL')
depends=('gtk2')
source=("http://www.stellingwerff.com/TheWidgetFactory/${_realname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/$_realname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

sha256sums=('10bbbe50dc23a0cd47762749c6bb402559721951f3c6af40366258593bcb1ce4')
# vim:set ts=2 sw=2 et:
