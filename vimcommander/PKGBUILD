# Maintainer: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Laszlo Papp <djszapi2@gmail.com>
pkgname=vimcommander
pkgver=80
pkgrel=1
pkgdesc="Totalcommander-like two-panel tree file explorer for vim"
arch=('i686' 'x86_64')
url="http://vim.sourceforge.net/scripts/script.php?script_id=808"
_src_id='12730'
license=('custom')
depends=(vim)
md5sums=('e89ffda16da93fcb28ff64000877263d')
source=(${pkgname}.vim::http://vim.sourceforge.net/scripts/download_script.php?src_id=${_src_id})


build() {
    install -Dm755 ${srcdir}/${pkgname}.vim ${pkgdir}/usr/share/vim/vim72/plugin/${pkgname}.vim
}
