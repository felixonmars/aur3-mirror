# Author: NAKASHIMA, Makoto <makoto.nksm@gmail.com>

pkgname=rust-incoming-git
_gitname="rust"
pkgver=release.0.6.1731.gd577eaf
pkgrel=1
pkgdesc="A safe, concurrent, practical language from Mozilla."
arch=(i686 x86_64)
url="http://www.rust-lang.org/"
license=('custom:MIT' 'Apache')
depends=('gcc-libs')
makedepends=('git' 'gcc'
             'libffi' 'python2')
optdepends=('haskell-pandoc: to build rust.pdf')
provides=('rust')
conflicts=('rust')

source=('git+https://github.com/mozilla/rust.git#branch=incoming')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag or the last commit
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make || return 1
}

check() {
  cd "$srcdir/$_gitname"
  make check || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install

  install --directory "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 COPYRIGHT LICENSE-* "$pkgdir/usr/share/licenses/$pkgname/"

  _docdir=$pkgdir/usr/share/doc/rust
  install --directory "$_docdir"
  for _doc in rust.pdf rust.html tutorial.html rust.css core std rust.md ; do
    [ -e "doc/$_doc" ] || continue;
    cp -r "doc/$_doc" "$_docdir/"
    chmod -R 644 "$_docdir/$_doc"
  done
  find "$_docdir" -type d -exec chmod 755 '{}' ';'

  install --directory "$pkgdir/usr/share/apps/katepart/syntax/"
  cp src/etc/kate/rust.xml "$pkgdir/usr/share/apps/katepart/syntax/"

  install --directory "$pkgdir/usr/share/vim/"
  cp -a src/etc/vim "$pkgdir/usr/share/vim/vimfiles"

  cd src/etc/emacs
  if which emacs 2> /dev/null; then make; fi
  install --directory "$pkgdir/usr/share/emacs/site-lisp/"
  cp -a *.el* "$pkgdir/usr/share/emacs/site-lisp/"
}

