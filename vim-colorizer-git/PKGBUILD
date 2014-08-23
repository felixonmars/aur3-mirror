# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

_name='vim-colorizer'
pkgname="${_name}-git"
pkgver=10.r0.g151983a
pkgrel=1
pkgdesc='A plugin to highlight color values'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3963'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('vim-runtime' 'git')
install='vimdoc.install'
source=("${_name}"::'git+https://github.com/vim-scripts/Colorizer--Brabandt')
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${_name}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_name}"

  instdir="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 autoload/Colorizer.vim "${instdir}/autoload/Colorizer.vim"
  install -Dm644 doc/Colorizer.txt "${instdir}/doc/Colorizer.txt"
  install -Dm644 plugin/ColorizerPlugin.vim "${instdir}/plugin/ColorizerPlugin.vim"
}

# vim:set ts=2 sw=2 et:
