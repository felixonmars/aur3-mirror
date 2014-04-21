# Maintainer: peace4all <markspost at rocketmail dot com>

pkgname=rhythmbox-plugins-wikipedia-search-git
_gitname="rhythmbox-plugins-wikipedia-search"
pkgver=46e5eda
pkgrel=1
pkgdesc="Search for selected artist, album, track or genre at the click of a button."
url="https://github.com/donaghhorgan/rhythmbox-plugins-wikipedia-search"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('git')
depends=('rhythmbox>=3.0' 'python-lxml')
source=("$_gitname::git+https://github.com/donaghhorgan/rhythmbox-plugins-wikipedia-search.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}


package() {
  cd "${srcdir}/$_gitname"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname"
  cp -r {README,LICENSE,release/3.0/{*.plugin,*.py}} \
	"$pkgdir/usr/lib/rhythmbox/plugins/$_gitname/"
}
