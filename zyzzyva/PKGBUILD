# Contributor: Ramana Kumar <firstname.lastname@gmail.com>
pkgname=zyzzyva
pkgver=2.1.5
pkgrel=1
pkgdesc="Word and anagram study program"
arch=(i686 x86_64)
url="http://zyzzyva.net"
license=('GPL')
groups=()
depends=('qt>=4')
makedepends=('qt>=4' 'make' 'sed')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=($url/packages/current/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('3e7fa46e7b46abe2c92c04c511b81ad6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/int32_t/qint32/g' src/libzyzzyva/WordGraph.{h,cpp}
  qmake || return 1
  make || return 1

  mkdir -p $pkgdir/usr/bin
  echo "#!/usr/bin/env sh"       > $pkgdir/usr/bin/$pkgname
  echo "cd /usr/share/$pkgname" >> $pkgdir/usr/bin/$pkgname
  echo "./$pkgname"             >> $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/lib
  cp -d bin/lib$pkgname.so* $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/share/$pkgname
  cp bin/$pkgname $pkgdir/usr/share/$pkgname/
  cp -r data $pkgdir/usr/share/$pkgname/
  touch $pkgdir/usr/share/$pkgname/$pkgname.top
}

# vim:set ts=2 sw=2 et:
