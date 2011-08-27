
# Maintainer: schef

pkgname=lilycomp
pkgver=1.0.2
pkgrel=1
pkgdesc="Is a graphical note entry program for use with the LilyPond music typesetting program."
arch=('i686' 'x86_64')
url="http://lilycomp.sourceforge.net/"
license=('GPL')
depends=('python' 'tk')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname.$pkgver.tar.gz/download \
	'german.patch')
md5sums=('efd57e8ce909ea2a268c411e6b6ef30a'
         '986b815884c19231000a09e53c55f274')
build() {
  cd "$srcdir/$pkgname.$pkgver"

  mv lilycomp.py /usr/bin/lilycomp
  chmod +x /usr/bin/lilycomp
  patch /usr/bin/lilycomp -i $srcdir/german.patch 
}
