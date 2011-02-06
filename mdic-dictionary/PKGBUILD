# Contributor & Maintainer: Roozbeh Shafiee <Roozbeh@Chakra-Project.org>

pkgname=mdic-dictionary
pkgver=0.8.1
pkgrel=1
pkgdesc="A Qt-based program to access multilingual dictionaries and Google Translate."
arch=('i686' 'x86_64')
url="http://mdic.gnufolks.org/"
license=('GPL3')
depends=('qt' 'aspell')
makedepends=('cmake' 'automoc4')
conflicts=('kdemod-extragear-mdic')
#source=(http://downloads.sourceforge.net/project/$pkgname/MDic/$pkgver/$pkgname-$pkgver.tar.gz)
source=(http://d10xg45o6p6dbl.cloudfront.net/projects/m/mdic/$pkgname-$pkgver.tar.gz)

md5sums=('07fd86daeb374df5be0943e2990f3b27')

build() {
  cd $srcdir/$pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
