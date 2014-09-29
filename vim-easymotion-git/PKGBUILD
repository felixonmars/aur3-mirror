# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname='vim-easymotion'
pkgname=${_pkgname}-git
pkgver=2.0.r212.g91464bd
pkgrel=1
pkgdesc="simpler and faster vim motions"
arch=('any')
url="https://github.com/Lokaltog/vim-easymotion"
license=('unknown')
groups=('vim-plugins')
depends=('vim-runtime' 'vim-vital-git')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=vimdoc.install
noextract=()
source=("$pkgname::git+https://github.com/Lokaltog/vim-easymotion.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"
  cp -r autoload doc plugin t "${pkgdir}/usr/share/vim/vimfiles/"
  rm -f "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"
}
