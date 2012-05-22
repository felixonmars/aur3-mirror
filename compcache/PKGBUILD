pkgname=compcache
pkgver=20120522
pkgrel=1
pkgdesc="Compressed virtual swap disc for Linux"
url="http://code.google.com/p/compcache/"
install=${pkgname}.install
license="GPL2"
arch=('i686' 'x86_64')
options=('zipman')
backup=(etc/conf.d/compcache)
makedepends=('mercurial')
depends=('bc')

source=(compcache.conf compcache.init)
md5sums=('0c19420ec23bd3402f3a6ccb4ed6f614'
         '1dbf33da8aacf862dc4bdb0c5bb8d458')

_gitroot=https://code.google.com/p/compcache/
_gitname=compcache

build() {
  cd $srcdir

  if [ -e ${_gitname} ] ; then
    cd ${_gitname}
    git pull
    cd ..
  else
    git clone ${_gitroot} ${_gitname}
  fi

  cd $srcdir/${_gitname}

  install -Dm 644 $srcdir/${_gitname}/README $pkgdir/usr/share/compcache/README
  install -Dm 755 $srcdir/${_gitname}/sub-projects/scripts/zram_stats $pkgdir/usr/bin/zram_stats
  install -Dm 644 $srcdir/compcache.conf $pkgdir/etc/conf.d/compcache 
  install -Dm 755 $srcdir/compcache.init $pkgdir/etc/rc.d/compcache
}
