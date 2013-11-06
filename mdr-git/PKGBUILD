# Maintainer: François Vaux <madx+arch@yapok.org>

_pkgname=mdr
pkgname=${_pkgname}-git
pkgver=20131105
pkgrel=1
pkgdesc="Make Diffs Readable"
arch=('any')
url="https://github.com/halffullheart/mdr"
license=(GPL)
depends=('ruby' 'webkitgtk')
makedepends=('git')
provides=('mdr')
conflicts=('mdr')
source=("git://github.com/halffullheart/mdr.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() { 
  cd "$srcdir/${_pkgname}"

  rake
}


package() {
  cd "$srcdir/${_pkgname}"
  
  install -D -m755 mdr "${pkgdir}/usr/bin/mdr"
}
# vim:set ts=2 sw=2 et:

