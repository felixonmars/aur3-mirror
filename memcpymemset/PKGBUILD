pkgname=memcpymemset
pkgver=20120718
pkgrel=1
pkgdesc="Replacment memcpy and memset by Simon Jhall for the Raspberry Pi"
arch=('arm' 'armv6h')
url="https://github.com/simonjhall/copies-and-fills"
license=(GPL2)
depends=()
makedepends=(git)
source=()
md5sums=()
_gitroot="https://github.com/simonjhall/copies-and-fills"
_gitname="copies-and-fills"

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull ) || warning "Git pull failed!"
  else
    git clone $_gitroot 
  fi
  cd $_gitname
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/lib"
  cp libcofi_rpi.so "$pkgdir/usr/lib"
}
