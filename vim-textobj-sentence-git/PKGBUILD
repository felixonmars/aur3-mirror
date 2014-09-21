# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-textobj-sentence-git
pkgver=20140223
pkgrel=1
pkgdesc="Improving on Vim's native sentence text object and motion"
arch=('any')
depends=('vim' 'vim-textobj-user-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/reedes/vim-textobj-sentence"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/reedes/vim-textobj-sentence)
sha256sums=('SKIP')
provides=('vim-textobj-sentence')
conflicts=('vim-textobj-sentence')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-textobj-sentence/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-textobj-sentence/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
