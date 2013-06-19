# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail at com>

pkgname=vim-drawit
pkgver=12
_src_id=19631
pkgrel=1
pkgdesc="Ascii drawing plugin: lines, ellipses, arrows, fills, and more!"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=40"
license=('custom:vim')
depends=('vim-runtime' 'vim-align')
groups=('vim-plugins')
install='vimdoc.install'
source=($pkgname-$pkgver.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_src_id})

package() {
   cd "$srcdir"
   _vimdir='/usr/share/vim/vimfiles'
   install -dm775 "$pkgdir"/$_vimdir
#   _majver_vim=$(LC_ALL=C pacman -Qi vim-runtime | awk '/Version/ {$3=gensub(/(^[0-9]+)\.([0-9]+).*/,"\\1\\2","g",$3); print $3}')
   vim -c "UseVimball $srcdir" -c "q" "$pkgname-$pkgver.vba"

   tar -c ./ \
       --exclude "$pkgname-$pkgver.vba*" \
       --exclude .VimballRecord \
       --exclude plugin/cecutil.vim \
       --exclude doc/tags \
       | tar -xC "$pkgdir"/$_vimdir

   #license
  install -dm775 "$pkgdir"/usr/share/licenses/custom/$pkgname
#   ln -s /usr/share/vim/vim${_majver_vim}/doc/uganda.txt $pkgdir/usr/share/licenses/custom/$pkgname/license.txt
  ln -s /usr/share/licenses/vim-runtime/license.txt "$pkgdir"/usr/share/licenses/custom/$pkgname/license.txt
}
md5sums=('b2bfd6f6cd33d0c45efb00a7b7f41469')
