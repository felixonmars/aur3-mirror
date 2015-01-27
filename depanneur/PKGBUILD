# Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=depanneur
pkgver=0.14
pkgrel=2
pkgdesc="Manages and executes the builds using the obs-build script"
arch=(any)
url="https://download.tizen.org/tools/latest-release"
license=('GPL2')
depends=('obs-build-tizen' 'createrepo' 'perl-json' 'perl-html-template' 'perl-yaml' 'perl-xml-parser' 'perl-crypt-ssleay')
source=(git+git://git.tizen.org/tools/depanneur)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git describe --always | sed -r 's/-/./g')
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
}

