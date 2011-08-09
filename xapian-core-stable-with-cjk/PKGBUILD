# $Id: PKGBUILD,v 1.12 2008/08/10 12:47:57 pizzapunk Exp $
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com> xiaoym <ym.xiao87@gmail.com>

pkgname=xapian-core-stable-with-cjk
pkgver=1.2.6
pkgrel=1
pkgdesc="Open source search engine library"
arch=('i686' 'x86_64')
url="http://www.xapian.org/"
license=('GPL')
depends=('gcc-libs' 'zlib')
conflicts=('xapian-core')
provides=('xapian-core')
source=(http://oligarchy.co.uk/xapian/1.2.6/xapian-core-1.2.6.tar.gz http://trac.xapian.org/raw-attachment/ticket/180/cjk.patch)
md5sums=('30f5cc976f063694f93cbdf9b83dc2ea' '30c451b47565cedc5d06a94e091c2ade')

build() {
  cd "$srcdir/xapian-core-1.2.6"

  patch -p2< ../../cjk.patch
  aclocal
  autoconf
  automake
  autoreconf
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
