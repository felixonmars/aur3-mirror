# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=vim-gist
pkgver=7.1
pkgrel=1
pkgdesc="Vim script for gist.github.com"
arch=(any)
url=http://www.vim.org/scripts/script.php?script_id=2423
license=(BSD)
depends=('vim>=7' vim-webapi)
optdepends=('git: git profile support')
install=vimdoc.install
source=($pkgname-$pkgver.zip::'http://www.vim.org/scripts/download_script.php?src_id=19176'
    license.txt)
sha256sums=('f8ef0572f54def3b9633dd241d66b46b039f9cebeec9f085682ac3d04151facc'
    '4689a6d3ed3bca186ab8fea8360f32fdbb84f84c82fb21698390202efa7b7d19')
sha512sums=('78ce6850182c7bad08bed8c24a38ee63432731d08c8e93a75fb1067178dbbff490f44d50cca00a269c23ebca8d1e258c3289f6880ce00914ae011cb4e2bbba05'
    '5fda2700cf3ac7c3f671f4786c19933df87a0fc36838260d5c4907c294ecb0e39165a02f2d63e2091f5846926476c7ac13b09b0b398581aabc5d5be632a00bf1')

package() {
    find -mindepth 2 -type f -exec install -Dm644 '{}' "$pkgdir"/usr/share/vim/vimfiles/'{}' \;
    install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
