# Maintainer: Kesara Nanayakkara Rathnayake <kesara@kesara.lk>

pkgname=crun
pkgver=0.1.3
pkgrel=1
pkgdesc="Lightweight, easy to use, simpler cron-like tool."
arch=('i686' 'x86_64')
url="http://code.google.com/p/koolkit/"
license=('GPL3')
source=(http://koolkit.googlecode.com/files/crun-$pkgver.tar.gz)
sha1sums=('6a6cae24f2ad780869312e7978df09ef73b2039a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr/
  make || return 1
  make DESTDIR="$startdir/pkg/" install
}

