# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=paml-git
_pkgname=paml
pkgver=2012.12.31
pkgrel=1
pkgdesc="paml - Pacman Aria2 MetaLink - metalink generator and downloader for pacman - generates metalink from /etc/pacman.d/mirrorlist and calls aria2 to download the package"
arch=('any')
url="https://github.com/lahwaacz/paml"
license=('GPL')
depends=('python' 'pacman' 'aria2')
makedepends=('git')
install=paml.install
source=('git://github.com/lahwaacz/paml.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git log -1 --format=format:%cd --date=short | sed 's|-|.|g'
}

package() {
  cd "$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}

# vim:set ts=2 sw=2 et:
