# Maintainer: TDY <tdy@archlinux.info>

pkgname=vimrepress
pkgver=3.2.0
pkgrel=1
pkgdesc="Manage wordpress blog posts from Vim"
arch=('any')
url="https://github.com/vim-scripts/VimRepress"
license=('GPL')
groups=('vim-plugins')
depends=('vim>=7.3' 'python2')
install=vimdoc.install
source=($pkgname-$pkgver.tgz::https://github.com/vim-scripts/VimRepress/archive/$pkgver.tar.gz)
md5sums=('e01c4a0f7f204575fbf6b5368197f6b9')

package() {
  cd "$srcdir/VimRepress-$pkgver"
  install -Dm644 doc/vimpress.txt "$pkgdir/usr/share/vim/vimfiles/doc/vimpress.txt"
  install -Dm644 plugin/blog.vim "$pkgdir/usr/share/vim/vimfiles/plugin/blog.vim"
  install -Dm644 syntax/blogsyntax.vim "$pkgdir/usr/share/vim/vimfiles/syntax/blogsyntax.vim"
}

# vim:set ts=2 sw=2 et:
