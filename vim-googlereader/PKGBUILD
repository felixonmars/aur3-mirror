# Maintainer: jsteel <mail at jsteel dot org>

pkgname=vim-googlereader
_pkgname=googlereader.vim
pkgver=2.2
pkgrel=3
pkgdesc="Vimscript for googlereader"
arch=('any')
url="http://vim.org/scripts/script.php?script_id=2678"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=$pkgname.install
source=($_pkgname::http://www.vim.org/scripts/download_script.php?src_id=13267
        README
        LICENSE)
md5sums=('f4bbeee9e081860280aaeea2329abda4'
         'a7d2022255eaa5ffedf63ce60389de99'
         '1a288b30fdcf330b9a1219b855b9153c')

package() {
  install -Dm755 "$srcdir"/$_pkgname "$pkgdir"/usr/share/vim/vimfiles/plugin/$_pkgname
  install -Dm755 "$srcdir"/README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm755 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
