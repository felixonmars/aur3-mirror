# Maintainer: peace4all <markspost at rocketmail dot com>

pkgname=rhythmbox-opencontainingfolder-git
_gitname="rhythmbox-plugins-open-containing-folder"
pkgver=v2.99.23.g3fd8185
pkgrel=1
pkgdesc="Adds an option to open the folder containing the selected track(s) to the right click context menu."
url="https://github.com/donaghhorgan/rhythmbox-plugins-open-containing-folder"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('git')
depends=('rhythmbox>=3.0' 'xdg-utils' 'python-lxml')
source=("$_gitname::git+https://github.com/donaghhorgan/rhythmbox-plugins-open-containing-folder.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/opencontainingfolder"
  cp -r {README,LICENSE,release/3.0/{*.plugin,*.py}} \
	"$pkgdir/usr/lib/rhythmbox/plugins/opencontainingfolder/"

  find "${pkgdir}" -type d | xargs chmod 755
  find "${pkgdir}" -type f | xargs chmod 644
}
