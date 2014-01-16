# Contributor: Hubert Czobodziński <hcz@onet.eu>
pkgname=gpdftext
pkgver=0.1.6
pkgrel=1
pkgdesc="GTK+ text editor for ebook PDF files"
arch=('i686' 'x86_64')
url="http://gpdftext.sourceforge.net"
license=('GPL3')
depends=('gnome-doc-utils' 'poppler-glib' 'intltool')
source=(http://downloads.sourceforge.net/project/gpdftext/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('390dccf58844629e5c2642d6bae601fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package () {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
