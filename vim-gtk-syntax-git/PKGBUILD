# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-gtk-syntax-git
pkgver=20130811
pkgrel=1
pkgdesc="Vim syntax highlighting for GLib, Gtk+, Xlib, Gimp, Gnome, and more"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-scripts/gtk-vim-syntax"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/vim-scripts/gtk-vim-syntax)
sha256sums=('SKIP')
provides=('vim-gtk-syntax')
conflicts=('vim-gtk-syntax' 'gtk-vim-syntax' 'gtk-vim-syntax-git')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-gtk-syntax/README"
  install -Dm 644 c.vim.example "$pkgdir/usr/share/doc/vim-gtk-syntax/c.vim.example"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
