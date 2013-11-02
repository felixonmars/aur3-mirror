# Contributor: Anton Shestakov <engored*ya.ru>

_pkgname=cutemupen
pkgname=cutemupen-svn
pkgver=0.r86
pkgrel=1
pkgdesc='A graphical front-end for Mupen64Plus emulator, written using Qt and the Mupen64Plus v2.0 API.'
arch=(i686 x86_64)
url='http://sourceforge.net/userapps/mediawiki/vknecht/index.php?title=CuteMupen'
license=('GPL2')
depends=('mupen64plus>=1.99' 'qt4')
makedepends=('subversion')
provides=('cutemupen')
conflicts=('cutemupen')
install=cutemupen-svn.install
source=("$_pkgname::svn+https://cutemupen.svn.sourceforge.net/svnroot/cutemupen/trunk"
        'CuteMupen.conf.sample')
md5sums=('SKIP'
         '01d93f9ca7558a6c24685cdc35d6154b')


pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_pkgname"

  qmake-qt4
  make
}

package() {
  install -Dm755 "$srcdir/$_svnmod-build/cutemupen" "$pkgdir/usr/bin/cutemupen"
  install -Dm644 "$srcdir/CuteMupen.conf.sample" "$pkgdir/usr/share/cutemupen/CuteMupen.conf.sample"
}
