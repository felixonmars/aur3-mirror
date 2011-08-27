# Maintainer: Yanghai Zhang < zhang9560@gmail.com>

pkgname=mew
pkgver=6.3
pkgrel=1
pkgdesc="Mew is a user interface for text messages, multimedia messages (MIME), news articles and security functionality including PGP, S/MIME, SSH, and SSL. Also, Mew can work with the recent search services."
arch=('i686' 'x86_64')
url="http://www.mew.org/en/info"
license=('GPL')
depends=('emacs' 'ruby')
optdepends=('stunnel: For ssl')
source=("http://www.mew.org/Release/mew-6.3.tar.gz")
md5sums=('a0ca3b478dbad44d5a7e09083e323ccc') #generate with 'makepkg -g'

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
