# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>
pkgname=mp3convert-git
_pkgname=mp3convert
pkgver=2013.02.28
pkgrel=1
pkgdesc="Simple python script to convert recursively all audio files in given folder to specified bitrate"
arch=('any')
url="https://github.com/lahwaacz/mp3convert"
license=('GPL')
depends=('python' 'ffmpeg' 'ffparser-git')
makedepends=('git')
source=('git://github.com/lahwaacz/mp3convert.git')
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
