# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=gpa
pkgver=0.9.4
pkgrel=1
pkgdesc="A graphical user interface for the GnuPG"
arch=('i686' 'x86_64')
url="http://wald.intevation.org/projects/gpa/"
license=('GPL')
depends=('gpgme' 'gtk2')
install="$pkgname.install"
#source=("http://wald.intevation.org/frs/download.php/603/$pkgname-$pkgver.tar.bz2"
source=("ftp://ftp.gnupg.org/gcrypt/gpa/gpa-$pkgver.tar.bz2")
md5sums=('178144d53c35703a59eeb5ab767b4c6c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
