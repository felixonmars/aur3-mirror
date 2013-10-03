# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nemo-fileroller
pkgname=${_pkgname}-git
pkgver=79.14bf441
pkgrel=1
pkgdesc="Nemo file rollerextension"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
source=(git+https://github.com/linuxmint/nemo-extensions.git)
depends=('libnotify' 'nemo' 'file-roller')
options=('!libtool' '!emptydirs')
conflicts=("${_pkgname}")

pkgver() { 
  cd "$srcdir"/nemo-extensions
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}"/nemo-extensions/"${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}"/nemo-extensions/"${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
