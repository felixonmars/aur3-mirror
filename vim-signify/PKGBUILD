# Maintainer: Josh VanderLinden <arch@cloudlery.com>

pkgname=vim-signify
pkgver=1.9
pkgrel=1
pkgdesc="Show diff information in Vim's sign column"
arch=('any')
url="https://github.com/mhinz/vim-signify"
license=('vim')
depends=("vim")
optdepends=(
  'git'
  'hg'
  'darcs'
  'bzr'
  'subversion'
  'cvs'
  'rcs'
  'fossil'
)
groups=('vim-plugins')
install='vimdoc.install'
source=("${pkgname}-${pkgver}.zip::https://github.com/mhinz/vim-signify/archive/1.9.zip")

md5sums=('2f24abf55cba03cc091446f1c3d93875')

package() {
  cd $srcdir/${pkgname}-${pkgver}/

  install -d ${pkgdir}/usr/share/vim/vimfiles/
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/

  install -Dm644 ./doc/signify.txt ${pkgdir}/usr/share/vim/vimfiles/doc/signify.txt
  install -Dm644 ./plugin/signify.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/signify.vim

  ln -s /usr/share/licenses/vim-runtime/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:et ts=2 sw=2:
