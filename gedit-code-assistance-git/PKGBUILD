# Maintainer: Marius Knaust <marius.knaust@gmail.com>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgname=gedit-code-assistance
pkgname=gedit-code-assistance-git
pkgver=v0.3.1.r0.g06b490d
pkgrel=1
pkgdesc="Plugin providing code assistance support from gnome-code-assistance services"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/gedit-code-assistance"
license=('GPL')
depends=('gedit' 'gnome-code-assistance')
makedepends=('git' 'vala')
conflicts=('gedit-code-assistance')
provides=('gedit-code-assistance')
source=('git://git.gnome.org/gedit-code-assistance')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

