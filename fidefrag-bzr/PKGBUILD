# Contributor:  Kevin Barry <barryk@gmail.com>
arch=(i686 x86_64)
pkgname=fidefrag-bzr
pkgver=53
pkgrel=2
pkgdesc="Filesystem independent file defragmenter written in Python"
url="https://launchpad.net/fidefrag"
license=('GPL')
depends=('lsof' 'findutils' 'rsync' 'e2fsprogs')
provides=('fidefrag')
conflicts=('fidefrag')
makedepends=('bzr' 'python')
source=()
md5sums=()

_bzrtrunk=lp:fidefrag
_bzrmod=fidefrag

build() {
  cd $startdir/src
  msg "Connecting to server..."

  if [ ! -d ./$_bzrmod ]; then
    bzr co -r1 $_bzrtrunk $_bzrmod
  else
    bzr up $_bzrmod
  fi
  msg "Finished pull."
 
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/fidefrag
  #mkdir -p $startdir/pkg/usr/man/man3
  install -m 0755 $_bzrmod/src/fiDefrag.py $startdir/pkg/usr/share/fidefrag/fiDefrag.py
  install -m 0755 $_bzrmod/src/Progress.py $startdir/pkg/usr/share/fidefrag/Progress.py
  ln -s /usr/share/fidefrag/fiDefrag.py $startdir/pkg/usr/bin/fidefrag
  #gzip -c $_bzrmod/src/README.txt > $startdir/pkg/usr/man/man3/fidefrag.3.gz
  
}
# vim:syntax=sh
