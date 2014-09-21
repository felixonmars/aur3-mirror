# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-lexical-git
pkgver=20140816
pkgrel=1
pkgdesc="Build on Vim’s spell/thes/dict completion"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=('moby-thesaurus: thesaurus'
            'words: dictionary')
groups=('vim-plugins')
url="https://github.com/reedes/vim-lexical"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/reedes/vim-lexical)
sha256sums=('SKIP')
provides=('vim-lexical')
conflicts=('vim-lexical')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-lexical/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
