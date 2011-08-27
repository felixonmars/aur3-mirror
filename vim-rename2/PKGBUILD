# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=vim-rename2
pkgver=0.1
pkgrel=1
pkgdesc="Remake of the origional Rename plugin"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2724"
license=('custom')
depends=('vim')
conflicts=('vim-renamer')
source=('Rename2.vim' 'LICENSE')
md5sums=('77db42b1e760a424a268e04826d877b0'\
         '67e5bfecb3f278d8540c449495428592') 

build() {
  cd $srcdir/
      install -d $pkgdir/usr/share/{licenses/$pkgname,vim/plugin}
      install Rename2.vim $pkgdir/usr/share/vim/plugin/
      install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
  }

# vim:set ts=2 sw=2 et:
