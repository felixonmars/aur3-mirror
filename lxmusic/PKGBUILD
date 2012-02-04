# Submitter: voidnull <giovanni at archlinux dot org>
# Maintener: Marcus Schulderinsky <mmaacceess at gmail dot com>

pkgname=lxmusic
pkgver=0.4.4
pkgrel=1
pkgdesc="Lightweight XMMS2 client (part of LXDE)"
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
groups=('lxde')
depends=('gtk2' 'xmms2')
makedepends=('pkgconfig' 'intltool')
source=(http://downloads.sourceforge.net/lxde/$pkgname-$pkgver.tar.gz
				lxmusic-notify.patch)
md5sums=('962bca8f2dc307484828503aafe529f6'
				'ee908f166804c65c6f4e973cfd68a982')

build() {
	patch $startdir/src/$pkgname-$pkgver/src/lxmusic-notify.c $startdir/lxmusic-notify.patch
  cd $startdir/src/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  make DESTDIR=$startdir/pkg install
}