# Maintainer: exul <exul  [at] v-net [dot] ch>

pkgname=ctags-go
pkgver=20120726
pkgrel=1
pkgdesc='Go support for exuberant ctags'
arch=('x86_64' 'i686')
license=('GPL')
depends=('glibc')
conflicts=('ctags')
makedepends=('git')
url=('https://github.com/lyosha/ctags-go')

_gitroot="https://github.com/lyosha/$pkgname.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $pkgname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $pkgname
    cd $pkgname
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting configure..."
  ./configure

  msg "Starting make..."
  make
} 

package() {
  cd ${srcdir}/${pkgname}

  make prefix=${pkgdir}/usr install
}
