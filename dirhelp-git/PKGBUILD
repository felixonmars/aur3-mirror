# Maintainer: Joshua Barney <qwitwa@gmail.com>
pkgname=dirhelp-git
_gitname=linux-directory-help
pkgver=24.19ea9a3
pkgrel=1
pkgdesc="Print FHS information about directories"
arch=('any')
url="https://github.com/jrenner/linux-directory-help"
license=('MIT')
makedepends=('go')
source=('git://github.com/jrenner/linux-directory-help.git')
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd $srcdir/$_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd $srcdir/$_gitname/src
    GOPATH=$srcdir/$_gitname go build -o dirhelp
}

package() {
  install -D $srcdir/$_gitname/src/dirhelp $pkgdir/usr/bin/dirhelp
  install -D $srcdir/$_gitname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
