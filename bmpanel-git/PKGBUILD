# Contributor: Cainã Costa <sryche@archlinux-br.org>
# Contributor: Buharev Vasilij <buharev.v.p@gmail.com>

_pkgname=bmpanel
pkgname=bmpanel-git
pkgver=0.9.27.r13.g4e209c3
pkgrel=1
pkgdesc="lightweight panel with taskbar, tray, desktop switcher and clock and theme support"
arch=('i686' 'x86_64')
url="http://nsf.110mb.com/bmpanel/"
license=('custom')
depends=('imlib2' 'fontconfig' 'libxrender' 'libxcomposite')
makedepends=('git')
provides=('bmpanel')
conflicts=('bmpanel')
source=("git://github.com/nsf/bmpanel.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr --optimize --with-composite
  make
}

package() {
  cd $_pkgname

  make DESTDIR=$pkgdir install
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
