pkgname=kde-thumbnailer-odf-hg
pkgver=r1.16f0dcf220bc
pkgrel=2
pkgdesc="KDE thumbnail generator for OpenDocument files"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://kde-apps.org/content/show.php?content=110864"
depends=('kdelibs')
makedepends=('mercurial' 'cmake')
source=('hg+https://hg.kenai.com/hg/kde-odf-thumbnail~sources')
md5sums=('SKIP')

pkgver() {
             cd "$srcdir/kde-odf-thumbnail~sources"
             printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
             cd $srcdir/kde-odf-thumbnail~sources
             mkdir build
             cd build
             cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
             make
}

package() {
             cd $srcdir/kde-odf-thumbnail~sources/build
             make DESTDIR=$pkgdir install
        
}
