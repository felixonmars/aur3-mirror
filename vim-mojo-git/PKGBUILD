# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-mojo-git
pkgver=20140206
pkgrel=1
pkgdesc="Vim syntax for mojo epl templates in Mojolicious projects"
arch=('any')
depends=('vim')
makedepends=('git')
checkdepends=('make')
optdepends=('perl-text-vimcolor: run tests')
groups=('vim-plugins')
url="https://github.com/yko/mojo.vim"
license=('PerlArtistic')
source=(${pkgname%-git}::git+https://github.com/yko/mojo.vim)
sha256sums=('SKIP')
provides=('vim-mojo')
conflicts=('vim-mojo')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

check() {
  cd ${pkgname%-git}

  msg 'Testing...'
  make test || return 1
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-mojo/LICENSE"

  msg 'Installing docs...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-mojo/README"
  install -Dm 644 Changes "$pkgdir/usr/share/doc/vim-mojo/Changes"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in after ftdetect snippets syntax; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
