# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Edited for git by: ilikenwf <parwok@gmail.com>
# Contributor: ilikenwf/Matt Parnell <parwok@gmail.com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>

pkgname=pspp-git
_pkgname=pspp
pkgver=0.7.9.549.g5445e00
pkgrel=1
pkgdesc="Statistical analysis of sampled data, free replacement for SPSS"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/pspp/"
license=('GPL3')
depends=('gsl' 'gtksourceview2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('perl' 'gperf' 'git')
install=pspp.install
options=('!libtool')
source=("git://git.sv.gnu.org/$_pkgname.git"
        "git://git.sv.gnu.org/gnulib.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  local _commit=$(awk '/^\tcommit/ {print $2}' "$srcdir/$_pkgname/README.Git")

  cd "$srcdir/gnulib"
  git checkout $_commit
}

build() {
  cd "$srcdir/$_pkgname"

  make -f Smake

  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--without-libreadline-prefix

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  rm -f "$pkgdir/usr/share/info/dir"

  if [[ -x $(which emacs) ]]; then
    emacs -Q --batch --eval '(byte-compile-file "pspp-mode.el")'
    install -d "$pkgdir/usr/share/emacs/site-lisp/pspp"
    install -m644 -t "$pkgdir/usr/share/emacs/site-lisp/pspp" pspp-mode.el{,c}
  fi
}
