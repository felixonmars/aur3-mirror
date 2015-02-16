# Contributor: Dave Reisner <d@falconindy.com>

pkgname=burp-git
pkgver=5.5.gb05cbca
pkgrel=1
pkgdesc="A simple AUR uploader"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/burp"
license=('MIT')
depends=('curl')
makedepends=('git' 'perl')
provides=('burp')
conflicts=('burp')
source=('git://github.com/falconindy/burp.git')
md5sums=('SKIP')

pkgver() {
  cd burp
  git describe | sed sa-a.ag
}

prepare() {
  cd burp
  autoreconf -fisv
}

build() {
  cd burp

  ./configure
  make
}

package() {
  cd burp
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
