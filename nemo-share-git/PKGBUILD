# Maintainer: Alex Filgueira <alexfilgueira@cinnarch.com>

_pkgname=nemo-share
pkgname=nemo-share-git
pkgver=49.6539547
pkgrel=1
pkgdesc="Nemo share extension"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
source=("git+https://github.com/linuxmint/nemo-extensions.git")
depends=('nemo' 'samba')
makedepends=('git' 'intltool')
options=('!libtool' '!emptydirs')
sha256sums=('SKIP')

pkgver() { 
  cd "$srcdir"/nemo-extensions
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {

  
  cd "$srcdir"/nemo-extensions/${_pkgname}

  autoreconf -fi
  
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/nemo-extensions/${_pkgname}
  make DESTDIR="${pkgdir}" install
}


