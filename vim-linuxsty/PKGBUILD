pkgname=vim-linuxsty
pkgver=0.2
_scriptid=19997
pkgrel=1
pkgdesc="Vim plugin to respect the Linux kernel coding style"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=4369"
license=('custom')
depends=(vim)
groups=('vim-plugins')
source=(${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('6a2460017cbd7c1cf662ed747026e23e')

build() {
    install -Dm755 ${srcdir}/${pkgname}.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/${pkgname}.vim || return 1
}
