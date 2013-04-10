# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

_pkgname=xfce4-vala
pkgname=${_pkgname}-git
provides=($_pkgname)
conflicts=($_pkgname)
_gitname=$_pkgname
source=("git://git.xfce.org/bindings/${_pkgname}")
md5sums=('SKIP')

pkgver=20121023
pkgrel=1
pkgdesc="Vala bindings for the Xfce framework"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://wiki.xfce.org/vala-bindings"
depends=('vala')
makedepends=('xfce4-dev-tools' 'pkg-config' 'git')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/${_gitname}"

  msg "Starting build..."
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var 
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir" install
}
