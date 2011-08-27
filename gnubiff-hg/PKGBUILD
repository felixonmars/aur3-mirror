# Contributor: Andre Klitzing <aklitzing () online () de>
pkgname=gnubiff-hg
pkgver=13
pkgrel=1
pkgdesc="Mail notification program that checks for mail and displays headers when new mail has arrived"
arch=('i686' 'x86_64')
url="http://freehg.org/u/misery/gnubiff/"
license=("GPL")
depends=('gnome-panel')
makedepends=('perlxml' 'mercurial')
conflicts=('gnubiff-gtk' 'gnubiff')
source=()
md5sums=()

_hgroot="http://freehg.org/u/misery"
_hgrepo="gnubiff"

build() {
  cd $startdir/src

  if [ -d $_hgrepo/.hg ]; then
    (cd $_hgrepo && hg up -r $pkgver)
  else
    hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
  fi

  cd ${_hgrepo}
  ./configure --prefix=/usr --with-password --with-password-string --disable-fam || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  # remove info directory
  rm -rf $startdir/pkg/usr/info
}
