pkgname=scrap2rtf
pkgver=0.1
pkgrel=1
pkgdesc="converts scrap of document (Shell Scrap Object File) is the OLE-container containing a RTF-document"
arch=(i686 x86_64)
url="http://code.google.com/p/scrap2rtf/"
license=('GPL3')
depends=()
source=(http://scrap2rtf.googlecode.com/files/scrap2rtf-$pkgver.tar.gz)
md5sums=('36103a5fb706e7007bff91399fc868b1')

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
