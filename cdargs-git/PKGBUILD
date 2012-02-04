# Contributor: Sausageandeggs <s_stoakley at hotmail.co.uk>>

pkgname=cdargs-git
pkgver=20100814
pkgrel=1
pkgdesc="Fork of cdargs"
arch=('i686' 'x86_64')
url="http://github.com/cbxbiker61/cdargs"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=('cdargs')
conflicts=('cdargs')
replaces=()
backup=()
install=$pkgname.install
options=()
noextract=()

_gitroot="http://github.com/cbxbiker61/cdargs.git"
_gitname="cdargs"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$pkgdir/" install
  # Helper scripts
  mkdir -p $pkgdir/usr/share/cdargs
  cd contrib
  make || return 1
  make DESTDIR=$pkgdir install
  install $_gitname-{tcsh.csh,bash.sh} $pkgdir/usr/share/cdargs
} 
