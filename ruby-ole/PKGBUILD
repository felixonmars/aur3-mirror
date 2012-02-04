# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-ole
pkgver=1.2.10.1
pkgrel=1
pkgdesc="Read/write access to OLE2 structured storage files"
url="http://code.google.com/p/ruby-ole/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ruby')
source=("http://ruby-ole.googlecode.com/files/${pkgname}-${pkgver}.gem")
md5sums=('f7737137dbce3dec6578fc0168598afd')
sha1sums=('6db7e1d0337d0a08c829b0903f64fa50a4c7c971')
noextract=("${pkgname}-${pkgver}.gem")

build() { return 0; }

package() {
  cd "$srcdir"
  gem install -i "$pkgdir/$(gem environment gemdir)" "${pkgname}-${pkgver}.gem"
}
