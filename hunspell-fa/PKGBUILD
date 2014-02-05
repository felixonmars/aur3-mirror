# Maintainer: Hassan Zamani <hsn.zamani at gmail dot com>
pkgname=hunspell-fa
pkgver=0.11
pkgrel=1
pkgdesc="Farsi dictionary for hunspell"
arch=(any)
url="http://aspell.net/"
license=('GPLv2+')
makedepends=('hunspell' 'aspell')
optdepends=('hunspell: the spell checking libraries and apps')
source=(ftp://ftp.gnu.org/gnu/aspell/dict/fa/aspell6-fa-${pkgver}-0.tar.bz2)
sha256sums=('482d26ea879a8ea02d9373952205f67e07c85a7550841b13b5079bb2f9f2e15b')

build() {
  cd "$srcdir/aspell6-fa-${pkgver}-0"
  export LANG=fa_IR.utf8
  preunzip -d *.cwl
  cat *.wl > farsi.wordlist
  wordlist2hunspell farsi.wordlist fa_IR
}

package() {
  cd "$srcdir/aspell6-fa-${pkgver}-0"
  export LANG=fa_IR.utf8
  install -d $pkgdir/usr/share/hunspell
  install -D -m644 *.dic *.aff $pkgdir/usr/share/hunspell/

  # the symlinks
  install -d $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
  for file in $pkgdir/usr/share/hunspell/fa_IR.*; do
    ln -sv /usr/share/hunspell/$(basename $file) .
  done
  popd

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 COPYING Copyright doc/README doc/ChangeLog "$pkgdir/usr/share/doc/$pkgname/"
}
