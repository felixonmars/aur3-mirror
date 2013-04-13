# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>
pkgname=ffparser-git
_pkgname=ffparser
pkgver=2012.09.06
pkgrel=1
pkgdesc="Simple python script to parse JSON output of ffprobe."
arch=('any')
url="https://github.com/lahwaacz/ffparser"
license=('GPL')
depends=('python' 'ffmpeg')
makedepends=('git')
source=('git://github.com/lahwaacz/ffparser.git')
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
