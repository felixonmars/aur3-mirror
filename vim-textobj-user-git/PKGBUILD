# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-textobj-user-git
pkgver=20140622
pkgrel=1
pkgdesc="Create your own text objects"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/kana/vim-textobj-user"
license=('MIT')
source=(git+https://github.com/kana/vim-textobj-user)
sha256sums=('SKIP')
provides=('vim-textobj-user')
conflicts=('vim-textobj-user')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-textobj-user/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload doc; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
