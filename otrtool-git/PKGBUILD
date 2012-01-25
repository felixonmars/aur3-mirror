# Maintainer: PyroPeter <com.googlemail@abi1789>
pkgname=otrtool-git
pkgver=0
pkgrel=3
pkgdesc="Open source decoder for .otrkey files (onlinetvrecorder.com) [otrdecoder]"
arch=('i686' 'x86_64')
url="http://pyropeter.github.com/otrtool/"
license=('custom:CC0')
depends=('curl' 'libmcrypt')
makedepends=('git' 'make' 'gcc')
provides=('otrtool')
conflicts=('otrtool')
source=()
md5sums=()

_gitroot="git://github.com/pyropeter/otrtool.git"
_gitname="otrtool_git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  make
}
package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p "$pkgdir"/usr/{bin,share/{man/man1,licenses/otrtool-git}}
  install -m775 otrtool "$pkgdir/usr/bin/"
  install -m644 otrtool.1.gz "$pkgdir/usr/share/man/man1"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/otrtool-git"
}

