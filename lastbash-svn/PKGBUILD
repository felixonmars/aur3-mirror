# Contributor: Nicolás Reynolds <nicolas.reynolds[at]gmail.com> 
pkgname=lastbash-svn
pkgver=241
pkgrel=1
license=('GPL')
pkgdesc="LastBASH is a console/terminal based Last.fm player"
arch=(i686 x86_64)
url="http://lastbash.sourceforge.net/"
depends=('bash')
provides=('lastbash')
conflicts=('lastbash')
source=()
md5sums=()

_svntrunk="https://lastbash.svn.sourceforge.net/svnroot/lastbash/lastbash"
_svnmod="lastbash"

build() {
  cd $startdir/src/

  svn co $_svntrunk --config-dir ./ $_svnmod
  msg "SVN checkout done or server timeout."

  cd $startdir/src/lastbash

  make PREFIX=$startdir/pkg/usr/bin DESTDIR=$startdir/pkg install

  mkdir -p $startdir/pkg/usr/bin
  mv $startdir/pkg/usr/local/bin/lastbash $startdir/pkg/usr/bin/lastbash
  rm -rf $startdir/pkg/usr/local
}
