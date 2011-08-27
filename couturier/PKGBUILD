# Maintainer: jase <jase at typomaster dot com>

pkgname=couturier
pkgver=0.5
pkgrel=1
pkgdesc="PDF merge application for the GNOME Desktop."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/couturierapp"
license=('GPL')
groups=()
depends=('mono')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://dl.dropbox.com/u/1111373/Couturier/Sources/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('cb60a9f3136942a3030786e1b693faeb')
