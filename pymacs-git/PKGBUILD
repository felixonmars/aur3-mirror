# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>

pkgname=pymacs-git
pkgver=20120328
pkgrel=1
pkgdesc="Interface between Emacs List and Python (Python3 support)"
url="https://github.com/pinard/Pymacs"
arch=('any')
license=('GPL')
depends=('emacs' 'python')
makedepends=('git' 'python-docutils')
conflicts=('pymacs')
provides=('pymacs')
source=()
md5sums=()


_gitroot='https://github.com/pinard/Pymacs.git'
_gitname='pymacs'

build() {
  cd "$srcdir"
  msg "Connecting to git server..."
  if [[ -d $_gitname ]]; then
	cd $_gitname && git pull origin
	msg "The local files are up-to-date"
  else
	git clone $_gitroot $_gitname --depth=1
	cd $_gitname
  fi

  make PREFIX=/usr
  make pymacs.pdf
  emacs -batch -f batch-byte-compile pymacs.el
  python setup.py build || return 1
  # ./configure --prefix=/usr
  # make || return 1
  # make DESTDIR=$startdir/pkg install
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=$pkgdir/usr --optimize=1
  install -d ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 pymacs.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  install -Dm644 pymacs.pdf ${pkgdir}/usr/share/doc/pymacs/pymacs.pdf
  cp -r contrib ${pkgdir}/usr/share/doc/pymacs/
}
