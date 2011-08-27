# $Id: PKGBUILD 30440 2009-03-19 18:04:27Z eric $
# Maintainer: damir <damir@archlinux.org>
# Contributor: Gan Lu <rhythm.gan@gmail.com>

pkgname=scim-multilib
pkgver=1.4.8
pkgrel=1
pkgdesc="A Input Method development platform"
arch=("i686" "x86_64")
url="http://www.scim-im.org/projects/scim"
license=('GPL')
depends=('gtk2' 'gcc-libs')
makedepends=('intltool')
backup=('etc/scim/config' 'etc/scim/global')
options=('!libtool')
install=scim.install
source=(http://downloads.sourceforge.net/sourceforge/scim/$pkgname-$pkgver.tar.gz)
md5sums=('c52da019d48df4ba44cbd01558203cc7')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/opt/lib32/usr --sysconfdir=/etc \
    --with-gnu-ld --with-x --disable-static || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
