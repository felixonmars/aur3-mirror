pkgname=pacfolder
_gitname=pacfolder
pkgver=6.84bb0fc
pkgrel=1
pkgdesc="Programm to generate a folder with subfolders for each package\
 managed by pacman containing symlinks to all files belonging to that package."
arch=('any')
url="https://github.com/zvynar/pacfolder"
license=('MIT')
depends=('pacman' 'python')
makedepends=('git')
source=('git://github.com/zvynar/pacfolder.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  ## Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -Dm755 "$srcdir/$_gitname/pacfolder" "$pkgdir/usr/bin/pacfolder"
}
