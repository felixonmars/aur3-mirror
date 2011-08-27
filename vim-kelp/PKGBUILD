# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname=vim-kelp
pkgver=1.4
pkgrel=1
pkgdesc="a vim plugin for kelp, the code annotation framework"
arch=('any')
url="http://kelp.sourceforge.net/"
makedepends=('moreutils')
license=('public-domain')
depends=('vim-runtime')
source=("http://downloads.sourceforge.net/project/kelp/plugin/${pkgver}/plugin-${pkgver}.zip")
md5sums=('89bca5410bdfc79d603cc5d2501b5472')

build() {
  cd ${srcdir}/plugin-${pkgver}/vim/
  tr -d '\015\032' < kelp.vim | sponge kelp.vim
  tr -d '\015\032' < README.txt | sponge README.txt
  install -D kelp.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/kelp.vim
  install -Dm644 README.txt ${pkgdir}/usr/share/doc/${pkgname}/README.txt
}

# vim:set ts=2 sw=2 et:
