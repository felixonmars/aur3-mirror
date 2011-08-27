# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname='raggle'
pkgver='0.4.4'
pkgrel='7'
pkgdesc='Open-source console RSS aggregator, written in Ruby'
arch=('any')
url='http://www.raggle.org/'
license=('GPL')
depends=('ruby' 'ruby-ncurses')

md5sums=('5423eadaa7699d48314cb753ff9f9aea'
         'd6fd8e1487f53e5cf89e1bf3cf3adbfc')
source=('ruby-1.9.patch'
  "${url}files/${pkgname}-${pkgver}.tar.gz")

build()  {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i \
  '25 s:${DATADIR}:/usr/share/raggle:' \
  Makefile

  patch -Np0 -i $srcdir/ruby-1.9.patch
  make PREFIX="$pkgdir/usr" install
}
