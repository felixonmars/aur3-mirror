# $Id: PKGBUILD,v 1.0 2009/06/06 01:45:02 BaSh Exp $
# Maintainer: Kirurgs <kirurgs@one.lv>
# Contributor: Asif Ali Rizvan <fast.rizwaan@gmail.com>
 
pkgname=nautilus-search-tool
pkgver=0.3.1
pkgrel=1
pkgdesc="A nautilus plugin for easier file search"
arch=('i686' 'x86_64')
url="http://saettaz.altervista.org/software/nautilus_search_tool.html"
license=('GPL')
depends=('nautilus' 'gnome-utils')
makedepends=('pkgconfig' 'intltool' 'gettext')
options=('!libtool')
source=(http://prdownloads.sourceforge.net/nautsearchtool/$pkgname-$pkgver.tar.gz)
md5sums=('8c250190ab03e960034fb893af6f05a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --disable-static --prefix=/usr

  make || return 1
  make DESTDIR="$pkgdir" install
}
