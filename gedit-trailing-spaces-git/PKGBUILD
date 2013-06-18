# Maintainer: sh4nks7 <https://github.com/sh4nks/pkgbuilds>
# Author: Gustavo Noronha Silva <https://gitorious.org/~kov>
# Author: Simon Sapin <https://github.com/SimonSapin>

pkgname=gedit-trailing-spaces-git
_gitname=gedit-trailing-spaces
pkgver=f6ba965
pkgrel=1
pkgdesc="A plugin that highlights trailing spaces in files and automatically clears the ones left by auto-indentation."
arch=('any')
url="https://github.com/SimonSapin/gedit-trailing-spaces"
license=('GPLv3')
depends=('gedit>=3.8')
makedepends=('git')
provides=('gedit-trailing-spaces')
conflicts=('gedit-trailing-spaces')
source=('git://github.com/SimonSapin/gedit-trailing-spaces.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -d $pkgdir/usr/lib/gedit/plugins
  install -m644 trailingspaces.plugin trailingspaces.py $pkgdir/usr/lib/gedit/plugins
}
