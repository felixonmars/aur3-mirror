# Maintainer: I. Senner <s0x@sixserv.org>
pkgname=qutim-plugin-otr-git
pkgver=20101116
pkgrel=1
pkgdesc="Off-the-Record Messaging (OTR) for Qutim, git Version"
arch=('i686', 'x86_64')
url="https://github.com/proDOOMman/qutim-otr"
license=('GPL')
depends=('qutim' 'libotr')
makedepends=('qt' 'gcc' 'make' 'pkgconfig' 'git')
provides=('qutim-plugin-otr')
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
#source=($pkgname-$pkgver.tar.gz)
#noextract=()
#md5sums=() #generate with 'makepkg -g'
_gitroot="https://github.com/proDOOMman/qutim-otr.git"
_gitname="qutim-otr"

build() {
  msg "Git Checkout"
  if [ -d $srcdir/$_gitname ]
  then
    msg "Updating local repository..."
    cd $_gitname
    git pull origin
    msg "The locale files are updated."
  else
    git clone $_gitroot
  fi
  msg "git checkout done or server timeout"
  msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build/

  msg "Building..."
  qmake || return 1
  make || return 1

  msg "Installing..."
  mkdir -p $_gitname/pkg/usr/lib/qutim
  install -Dm644 -p $srcdir/$_gitname-build/libotr.so $pkgdir/usr/lib/qutim/libotr.so || return 1;
  
  msg "Removing build directory..."
  cd $srcdir
  rm -rf $_gitname-build
}
