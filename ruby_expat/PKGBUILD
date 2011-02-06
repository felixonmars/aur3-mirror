# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk

pkgname=ruby_expat  
_pkgname=xmlparser
pkgver=0.7.1
pkgrel=1 
pkgdesc="Expat (XML Parser Toolkit) Module for Ruby."
url="http://www.yoshidam.net/Ruby.htm"
arch=`arch`
license=('GPL')
depends=('expat')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.yoshidam.net/$_pkgname-$pkgver.tar.gz)
md5sums=('89d6d9b61ad93d9b0120913aafcd72f8')
build() {
  cd $srcdir/$_pkgname
  ruby extconf.rb
  make || return 1
  make DESTDIR=$pkgdir install
}