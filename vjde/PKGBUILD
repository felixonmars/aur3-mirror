# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=vjde
pkgver=2.16.4
pkgrel=1
pkgdesc="Just a Development Envirement for VIM"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1213"
depends=('vim')
license=('GPL')
source=(${pkgname}.tgz::"http://www.vim.org/scripts/download_script.php?src_id=14254")
md5sums=('7d2d9187d06ca85d22f4b0558f95d308')

package() {
  cd ${srcdir}
  installpath="${pkgdir}/usr/share/vim/vim73"
  install -d $installpath
  cp -rf autoload compiler doc plugin syntax $installpath
  chmod +x $installpath/plugin/${pkgname}/readtags

  rm $installpath/plugin/${pkgname}/{{readtags,wspawn}.exe,tipswnd.dll}
}
