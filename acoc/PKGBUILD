# Contributor: shacristo <shacristo at gmail dot com>
# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>
# Maintainer:  Federico Cinelli <cinelli.federico@gmail.com>

pkgname=acoc
pkgver=0.7.1
pkgrel=3
pkgdesc='An arbitrary command output colourer'
url='http://www.caliban.org/ruby/acoc.shtml'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ruby' 'ruby-term-ansicolor')
optdepends=('ruby-tpty')
provides=("acoc")
source=(http://www.caliban.org/files/ruby/$pkgname-$pkgver.tar.gz
        fix_class_clash.patch)
md5sums=('c7fa847e2d55eccbc6625d3e22ad609e'
         'e2e788d561c29af53ce119fb422a34e9')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch acoc <$srcdir/fix_class_clash.patch
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install ROOT="$pkgdir"
}
