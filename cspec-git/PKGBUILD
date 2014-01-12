pkgname=cspec-git
pkgver=20140111
pkgrel=1
pkgdesc="CSpec: Behaviour-driven development in C"
url="https://github.com/arnaudbrejeon/cspec"
license="LGPL"
depends=()
makedepends=('git' 'autoconf')
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
#install=compiz.install
#source=(compiz-intel-copy-pixel-issue-workaround-1.diff)
#md5sums=('10a157b86d528bca2be6731c5eaff7b3')

_gitroot="https://github.com/arnaudbrejeon/cspec.git"
_gitname="cspec"
build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  autoreconf -i
  ./configure --prefix=/usr
  make || return 1
} 

package() {
  cd $srcdir/$_gitname-build
  make DESTDIR="$pkgdir/" install
  #find $startdir/pkg -type f -name '*.la' -exec rm {} \;
}
