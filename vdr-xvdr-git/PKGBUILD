# Maintainer: David Spicer <azleifel at gmail dot com>

pkgname=vdr-xvdr-git
_gitname=vdr-plugin-xvdr
pkgver=20130329
pkgrel=1
pkgdesc="XVDR plugin for VDR"
arch=('i686' 'x86_64')
url="https://github.com/pipelka/vdr-plugin-xvdr"
license=('GPL2')
depends=('vdr>=2.0.0')
makedepends=('git')
optdepends=('vdr-wirbelscan: For channel scanning')
provides=('vdr-xvdr')
conflicts=('vdr-xvdr')
source=('git+https://github.com/pipelka/vdr-plugin-xvdr.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/$_gitname"

  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir/" install

  # Install documents
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  for _file in HISTORY README; do
    install -m644 $_file "$pkgdir/usr/share/doc/$pkgname"
  done
}
