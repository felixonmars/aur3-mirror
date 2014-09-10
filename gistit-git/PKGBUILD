# Maintainer: Michal Rus <m@michalrus.com>
pkgname=gistit-git
pkgver=0.1.2.r3.g41f004d
pkgrel=3
pkgdesc='Send content from console/file to GitHub gist'
arch=('i686' 'x86_64')
url='https://github.com/jrbasso/gistit'
license=('MIT')
depends=(curl jansson)
replaces=(gistit)
source=('git+https://github.com/jrbasso/gistit.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gistit"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gistit"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/gistit"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
