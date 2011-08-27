# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=pidgin-paranoia
pkgver=0.4.0
pkgrel=1
pkgdesc="a plug-in for Pidgin that provides security with one-time pads"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pidgin-paranoia"
license=('GPL3')
depends=('pidgin')
options=('!libtool')
source=(http://downloads.sourceforge.net/pidgin-paranoia/$pkgname-$pkgver.tar.gz)
md5sums=('ef33e8ff629ef0b4ff52c6571b66d18b')


build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
