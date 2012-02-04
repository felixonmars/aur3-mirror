# Contributor: Vadim Abramchuk <abram@uainet.net>
pkgname=accel-pptp-kernel-git
pkgver=20091126
pkgrel=1
pkgdesc="Kernelspace PPTP server module"
arch=('i686' 'x86_64')
url="http://accel-pptp.sourceforge.net/"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='accel-pptp.install'
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://accel-pptp.git.sourceforge.net/gitroot/accel-pptp/accel-pptp"
_gitname="accel-pptp"

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

  #
  # BUILD HERE
  #

#  ./autogen.sh
#  ./configure --prefix=/usr
#  make || return 1
#  make DESTDIR="$pkgdir/" install
  cd kernel/driver
  make
  mkdir -p $pkgdir/lib/modules/`uname -r`/extra
  cp pptp.ko $pkgdir/lib/modules/`uname -r`/extra/
 
} 
