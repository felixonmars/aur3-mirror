# $Id: PKGBUILD,v 1.6 2006/05/30 17:31:15 ganja_guru Exp $
# Maintainer: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=pdq
pkgver=2.2.1
pkgrel=1
pkgdesc="A direct replacement of lpr"
arch=(i686 x86_64)
license=('GPL2')
depends=('gtk')
source=(http://pdq.sourceforge.net/ftp/$pkgname-$pkgver.tgz)
md5sums=('c72d076b4ba59bf206bc469c57201785')
url="http://pdq.sourceforge.net/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr pdqlibdir=$startdir/pkg/etc/pdq install
}
