# Contributor: Andrea Zucchelli <zukka77@gmail.com> 
pkgname=expendable
pkgver=0.0.9
pkgrel=1
pkgdesc="A Home Finance Modelling Program"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/expendable/"
license=('GPL')
depends=('python' 'gtk2' 'python-numpy')
install=$pkgname.install
source=(https://fedorahosted.org/releases/e/x/expendable/$pkgname-$pkgver.tar.xz)
md5sums=('abe7718c7a9bfa718f92fcc6ec805c92')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR="$pkgdir/" install
}

