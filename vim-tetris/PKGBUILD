# Maintainer: jsteel <mail at jsteel dot org>
# Contributer: Laszlo Papp <djszapi2 at gmail com>
# Contributer: CRT<crt.011@gmail.com>

pkgname=vim-tetris
_pkgname=tetris.vim
pkgver=0.52fix
pkgrel=5
pkgdesc="A tetris game in pure vim"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=172"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=$pkgname.install
source=($_pkgname::http://www.vim.org/scripts/download_script.php?src_id=650
        LICENSE)
md5sums=('500c4e0755a90371001c98ae733b1ba4'
         '1a288b30fdcf330b9a1219b855b9153c')

package() {
  install -Dm755 "$srcdir"/$_pkgname "$pkgdir"/usr/share/vim/vimfiles/plugin/$_pkgname 
  install -Dm755 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
