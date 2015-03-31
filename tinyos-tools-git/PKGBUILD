# Maintainer: Andras Biro <bbandi86@gmail.com>
pkgname=tinyos-tools-git
pkgver=r3468.7a0541a
pkgrel=1
pkgdesc="Development-tools for TinyOS"
arch=('i686' 'x86_64')
license=('GPL')
options=(!libtool)
url="http://www.tinyos.net/"
depends=('python2' 'perl' 'bash' 'nesc' 'java-runtime')
makedepends=('java-environment')
provides=('tinyos-tools')
conflicts=('tinyos-tools')
repo="tinyos-main"
source=("git://github.com/tinyos/${repo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${repo}/tools/"
	./Bootstrap
	./configure --prefix=/usr
	make
}

package() {
  cd "${srcdir}/${repo}/tools/"
  make DESTDIR="$pkgdir/" install || return 1
}
