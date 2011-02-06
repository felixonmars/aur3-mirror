# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=dictd-gcide
pkgver=0.48
_pkgname=dict-gcide_$pkgver
_patchver=6
pkgrel=2
pkgdesc="GNU version of the Collaborative International Dictionary of English"
arch=('i686' 'x86_64')
url="http://www.dict.org"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.debian.org/debian/pool/main/d/dict-gcide/$_pkgname.orig.tar.gz"
        "ftp://ftp.debian.org/debian/pool/main/d/dict-gcide/$_pkgname-$_patchver.diff.gz")

build() {
  cd $srcdir/dict-gcide-$pkgver
  patch -Np1 -i $srcdir/$_pkgname-$_patchver.diff
  ./configure --with-local-libmaa --prefix=/usr
  make || return 1
  mkdir -p $pkgdir/usr/share/dictd
  make prefix=$pkgdir/usr datadir=$pkgdir/usr/share dictdir=$pkgdir/usr/share/dictd install || return 1
}
md5sums=('4be2976a6253025e0cefccd26f256c43'
         'c738aadd7439bb0d6922a190bb5c5316')
