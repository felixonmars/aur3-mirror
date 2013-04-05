#Maintainer: Ariel Popper <a at arielp dot com>

pkgname=bitchx13-git
pkgver=0+5_6c7e32a
pkgrel=1
pkgdesc="IRC (Internet Relay Chat) client by Colten Edwards aka panasync"
arch=('i686' 'x86_64')
url="http://www.bitchx.ca/"
license=("GPL2")
depends=('openssl')
makedepends=('git' 'cpio')
conflicts=('ircii-pana' 'bitchx-svn')
source=("BitchX::git+https://github.com/BitchX/BitchX1.3.git")
md5sums=('SKIP')

_gitname=BitchX

pkgver () {
	cd "$srcdir/$_gitname"
	echo "0+$(git rev-list --count HEAD)_$(git describe --always )"
}

build() {
	cd $srcdir/$_gitname
	./configure --prefix=/usr --mandir=/usr/share/man --enable-ipv6 --with-plugins --with-ssl
	make 
}

package() {
	cd $srcdir/$_gitname
	sed -i 's/\/usr\/local/\/usr/' "$srcdir/$_gitname/doc/BitchX.1"
	make DESTDIR="$pkgdir/" install
}
  
