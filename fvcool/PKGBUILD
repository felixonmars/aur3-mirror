# Contributor: f0x <f0x@f0x.ru>

pkgname=fvcool
pkgver=1.04
pkgrel=1
pkgdesc="CPU cooling software for AMD's Athlon/Duron"
arch=('i686')
url="http://www.nt.phys.kyushu-u.ac.jp/shimizu/download/fvcool/"
license=('BSD')
depends=()
install=
source=($url/FVCool104.tar.gz
	bsd-license)

build() {
  cd $startdir/src/FVCool104
  ./configure
  sed -i 's|/usr/local/sbin|$(DESTDIR)/usr/sbin|' Makefile
  mkdir ${pkgdir}/usr || return 1
  mkdir ${pkgdir}/usr/sbin || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  /bin/install -D -m 644 $startdir/src/bsd-license \
      $startdir/pkg/usr/share/licenses/$pkgname/bsd-license

}

md5sums=('c42222059abd57a430d9828fe19ff6bf'
	 'd69b948083a0b60b2a29b8c78842fb56')
