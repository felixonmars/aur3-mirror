# Maintainer: Marius Knaust <marius.knaust@gmail.com>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>

_pkgname=gnome-code-assistance
pkgname=gnome-code-assistance-git
pkgver=v0.3.1.r2.gee27697
pkgrel=3
pkgdesc="Common code assistance services for code editors"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/CodeAssistance"
license=('GPL')
depends=('clang' 'python' 'python-dbus' 'python-simplejson' 'ruby' 'ruby-ruby-dbus' 'gjs' 'vala' 'libgee' 'go')
makedepends=('git' 'vala')
conflicts=('gnome-code-assistance')
provides=('gnome-code-assistance')
source=('git://git.gnome.org/gnome-code-assistance')
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

