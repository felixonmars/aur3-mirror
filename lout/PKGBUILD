# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: catwell <catwell@archlinux.us>

pkgname=lout
pkgver=3.39
pkgrel=1
pkgdesc="A lightweight document formatting system."
arch=('i686' 'x86_64')
url="http://lout.wiki.sourceforge.net/"
license=('GPL')
install=lout.install
source=(http://mirrors.ctan.org/support/$pkgname/$pkgname-$pkgver.tar.gz makefile.arch lout.install)
md5sums=('151e1fba676c7052936ccc1bcd9663a9'
         '088a29ca16477a9a30da9fafc9391de8'
         'c1fe68b4573c25dba41c2483346c2974')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cp ../makefile.arch .
  make -f makefile.arch PKGDIR="$pkgdir" install
}

