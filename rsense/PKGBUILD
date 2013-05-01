# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Hiroki Umezaki <raa0121@gmail.com>
pkgname=rsense
pkgver=0.3
pkgrel=4
epoch=
pkgdesc="A Ruby development tools for Emacs and Vim"
arch=('any')
url="http://cx4a.org/software/rsense/"
license=('GPLv3+')
groups=()
depends=('ruby')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://cx4a.org/pub/rsense/${pkgname}-${pkgver}.tar.bz2")
noextract=()

#gerate with 'makepkg -g'
md5sums=('78b6d5aeb195a01ec955f50d97fde27e')

package() {
  mkdir -p ${pkgdir}/opt/
  mkdir -p ${pkgdir}/usr/bin/
  cd ${srcdir}
  mv rsense-0.3 ${pkgdir}/opt/
  chmod +x ${pkgdir}/opt/rsense-0.3/bin/rsense
  ln -s /opt/rsense-0.3/bin/rsense ${pkgdir}/usr/bin/rsense
}
  
# vim:set ts=2 sw=2 et:
