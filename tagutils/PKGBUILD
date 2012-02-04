# Maintainer: Andreas B. Wagner <AndreasBWagner@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=tagutils
pkgver=0.3.0
pkgrel=2
pkgdesc="The primary way of tagging files from the command line for leaftag"
arch=('i686' 'x86_64')
url="http://www.chipx86.com/w/index.php/Leaftag"
license=('GPLv2')
depends=('libleaftag')
makedepends=('pkgconfig')
source=(http://releases.chipx86.com/leaftag/tagutils/$pkgname-$pkgver.tar.gz)
md5sums=('7982695e411f6ba558080cbefe5a7940')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:set ts=2 sw=2 et:
