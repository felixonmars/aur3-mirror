pkgname=vim-phpcs-git
pkgver=20140703
pkgrel=1
pkgdesc="A small VIM plugin to use PHP_CodeSniffer on the current PHP, JS or CSS file"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/bpearson/vim-phpcs"
license=('GPL-v2')
source=(${pkgname%-git}::git+https://github.com/bpearson/vim-phpcs)
sha256sums=('SKIP')
provides=('vim-phpcs')
conflicts=('vim-phpcs')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | tr -d -
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README $pkgdir/usr/share/doc/${pkgname%-git}/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _appdir in plugin doc; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/vim/vimfiles/$_appdir
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
