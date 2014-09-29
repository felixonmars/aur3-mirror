# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=vim-easymotion
pkgver=2.0
pkgrel=2
pkgdesc='simpler and faster vim motions'
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3526"
license=('unknown')
depends=('vim-runtime' 'vim-vital-git')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Lokaltog/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('641cb5533d0648ede23fe8967dd176dba16c0e4a9e3b36268ca5c0e410a8d2f08e2cb9ec8ec30266f63d87c176b29de9821f5feda7638a47f405115be809048d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"
  cp -r autoload doc plugin t "${pkgdir}/usr/share/vim/vimfiles/"
  rm -f "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"
}
# vim:set ts=2 sw=2 et:
