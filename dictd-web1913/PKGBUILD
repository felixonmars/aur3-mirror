# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-web1913
pkgver=1.4
_mypkgname=dict-web1913-${pkgver}-pre
pkgrel=3
pkgdesc="Webster's Revised Unabridged Dictionary (1913) for dict"
arch=(i686 x86_64)
url="http://www.dict.org"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.dict.org/dict/pre/$_mypkgname.tar.gz")
md5sums=('63a8d25ace68dff135185a8c96dd5f3c')

build() {
  cd $startdir/src/
  install -D -m 0644 $startdir/src/web1913.dict.dz $startdir/pkg/usr/share/dictd/web1913.dict.dz
  install -D -m 0644 $startdir/src/web1913.index $startdir/pkg/usr/share/dictd/web1913.index
}
