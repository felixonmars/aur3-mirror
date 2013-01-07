# Maintainer: George Kamenov < cybertorture@gmail.com >
# Contributor: Nikolay Dinchev < bearnik@gmail.com > 
pkgname=thunderbird-extension-nowebsearch
pkgver=1
pkgrel=1
pkgdesc="Removes web search feature"
url="https://github.com/bearnik/nowebsearch-tb"
arch=('any')
license=('GPL3')
depends=("thunderbird")
makedepends=('')
source=(https://github.com/bearnik/nowebsearch-tb/archive/master.zip)
md5sums=('60bdeed24fb488237371a42b342a5daf')

build() {
  cd nowebsearch-tb-master/packed
  mkdir -p ${pkgdir}/usr/lib/thunderbird/extensions/
  install -Dm644 nowebsearch.xpi ${pkgdir}/usr/lib/thunderbird/extensions/nowebsearch@bearnik.com.xpi
}
