# Maintainer: Peter Sutton <foxxy at foxdogstudios com>
# Past maintainer: Laszlo Papp <djszapi2 at gmail com>

pkgname=vim-vibrantink
pkgver=1.3
pkgrel=4
pkgdesc="A Vim port of Justin Palmer's VibrantInk theme for TextMate"
url='http://www.vim.org/scripts/script.php?script_id=1794'

# The source has been released into the public domain. However, we need a
# license and I've choosen GPL.
license=('GPL')

arch=('any')
depends=('vim')

source=(
    'vibrantink.vim::http://www.vim.org/scripts/download_script.php?src_id=10117'
)

md5sums=(
    'da8b6deb4e0e9d4ff80cb83ffa7faf25'
)

package() {
    install -Dm755 "${srcdir}/vibrantink.vim" \
            "${pkgdir}/usr/share/vim/vim74/colors/vibrantink.vim"
}

