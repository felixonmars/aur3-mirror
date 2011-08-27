# Contributor: damir <damir(at)archlinux(dot)org>
# Contributor: Rogof <fake.bios(at)gmail(dot)com>

pkgname=scim-prime
pkgver=1.0.1
pkgrel=1
_filecode=29156
pkgdesc="Japanese PRIME input method module for SCIM"
arch=("i686" "x86_64")
url="http://sourceforge.jp/projects/scim-imengine/"
license=('GPL2' 'LGPL2')
depends=('scim>=1.4.8' 'prime>=1.0.0')
options=('!libtool')
source=(http://osdn.dl.sourceforge.jp/scim-imengine/$_filecode/$pkgname-$pkgver.tar.gz)
md5sums=('12eae8334f73c70408b2f60c0ea0c82c')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
