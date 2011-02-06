# Contributor:
# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=vimirc
pkgver=0.9.28
pkgrel=1
pkgdesc="An IRC client script"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=931"
license=('custom')
depends=(vim)
source=(${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=4171)
md5sums=('959a02f88645036f0a1df0eb0d3f279b')

build() {
    install -Dm755 ${srcdir}/${pkgname}.vim ${pkgdir}/usr/share/vim/vim72/plugin/${pkgname}.vim
}
