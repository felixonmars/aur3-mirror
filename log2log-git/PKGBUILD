# Maintainer: Igor Duarte Cardoso <igordcard@gmail.com>
pkgname=log2log-git
pkgver=20130303
pkgrel=1
pkgdesc="Can't download Meebo chat logs? Shot that Adium duck? Pidgin poop? Log2Log: The all-in-one solution to chat log conversion!"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/log2log/"
license=('GPL3')
depends=('qt4>=4.4.0')
makedepends=('git')
provides=(log2log)
conflicts=(log2log)

_gitroot="git://log2log.git.sourceforge.net/gitroot/log2log/log2log"
_gitname="log2log"

build() {
  cd "$srcdir"
  msg "Connecting to git..."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "Done, but please check if there were any errors."
  msg "Compiling..."

  cd "$srcdir/$_gitname"

  qmake-qt4
  make DESTDIR=${pkgdir}
}

package() {
  cd "$srcdir/$_gitname"
  make INSTALL_ROOT="$pkgdir" install
}
