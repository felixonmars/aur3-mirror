# Contributor : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=potracegui
pkgver=1.3.4
pkgrel=2
pkgdesc="Frontend for potrace"
arch=('i686' 'x86_64')
url="http://potracegui.sourceforge.net/"
license=('GPL')
depends=('potrace' 'kdelibs3')
makedepends=('autotrace')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
	potracegui-gcc43.diff)
md5sums=('42786aa55ae3a7d5510d2f045f06191d'
	'a8feec8cbcf51f0c5444235095aaa184')

build() {
  cd $srcdir/$pkgname-$pkgver
  . /etc/profile.d/kde3.sh
  patch -p0 < ../potracegui-gcc43.diff || return 1
  ./configure --prefix=/opt/kde --without-arts
  make || return 1
  make prefix=$pkgdir/opt/kde install
}
