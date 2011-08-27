# Maintainer: Martti Kühne <mysatyre[at]gmail[dot]com>
# Contributor: Ian Taylor <ibtaylor[at]gmail[dot]com>
pkgname=tmux-cvs
pkgver=20110108
pkgrel=3
pkgdesc="A terminal multiplexer"
url="http://sourceforge.net/projects/tmux/"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('coreutils' 'make' 'cvs')
depends=('ncurses' 'libevent')
conflicts=(tmux)
provides=(tmux)
source=(LICENSE)
md5sums=('71601bc37fa44e4395580b321963018e')

_cvsroot=":pserver:anonymous@tmux.cvs.sourceforge.net:/cvsroot/tmux"
_cvsmod="tmux"

build() {
  cd $srcdir

  msg "Connection to $_cvsmod.sourceforge.net CVS server..."
  cvs -d$_cvsroot checkout $_cvsmod

  msg "CVS checkout done"
  msg "Starting make..."

  cd "$srcdir/${pkgname%-*}"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  mkdir -p "$pkgdir/usr/share/vim/syntax"
  mkdir -p "$pkgdir/usr/share/doc/tmux"
  mkdir -p "$pkgdir/usr/share/licenses/tmux"

  chmod +x ./autogen.sh && ./autogen.sh
  ./configure
  make

  install -Dm755 tmux "$pkgdir/usr/bin/tmux"
  install -Dm644 tmux.1 "$pkgdir/usr/share/man/man1/tmux.1"
  install -Dm644 examples/tmux.vim "$pkgdir/usr/share/vim/vimfiles/syntax/tmux.vim"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/tmux/LICENSE"
  install -dm755 "$pkgdir/usr/share/tmux/"
  install -m644 examples/*.conf "$pkgdir/usr/share/tmux/"
}
