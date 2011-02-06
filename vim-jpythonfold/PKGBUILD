# Maintainer: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-jpythonfold
_srcid=10034
pkgver=3.2
pkgrel=6
pkgdesc="A better python fold script"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2527"
license=('unknown')
groups=('vim-plugins')
depends=(vim)
source=(
  ${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid
  )
md5sums=('81866af3199f166573c5225a9f839678')

build() {
    install -Dm644 ${srcdir}/${pkgname}.vim \
        ${pkgdir}/usr/share/vim/vimfiles/ftplugin/python_jpythonfold.vim \
        || return 1
}

