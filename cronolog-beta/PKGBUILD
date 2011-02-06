# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
#Maintainer:Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=cronolog-beta
pkgver=1.7.0
pkgrel=3
pkgdesc="Web log rotation utility"
arch=('i686' 'x86_64')
url="http://cronolog.org/"
license=('GPL')
source=(http://cronolog.org/patches/cronolog-$pkgver-beta.tar.gz)
md5sums=('4a53cc3d44984b292f33b73da365cd3e')

build() {
  cd $srcdir/cronolog-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make || return 1
  make DESTDIR=pkgdir/ install

  
}
