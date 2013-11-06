# Maintainer: Christophe-Marie Duquesne <chmd@chmd.fr>
# Former maintainer: Mikhail Borisov <borisov.mikhail@gmail.com>

pkgname=udisks-glue-git
pkgdesc="A tool to associate udisks events to user-defined actions"
url="http://github.com/fernandotcl/udisks-glue"
depends=('glib2' 'confuse' 'dbus-glib' 'udisks')
makedepends=('git' 'gcc' 'automake' 'autoconf' 'pkg-config')
provides=('udisks-glue')
conflicts=('udisks-glue')
license=('BSD')
pkgver=release.1.3.5.r0.g70376b7
pkgrel=1
arch=('i686' 'x86_64')
source=("$pkgname"::'git+http://github.com/fernandotcl/udisks-glue.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR=$pkgdir
  install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/udisks-glue/LICENSE
}
