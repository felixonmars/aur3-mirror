#Contributor: jiuren <youremail at domain dot com> (disguise your email to protect against spam)

pkgname=lemur
pkgver=4.11
pkgrel=1
pkgdesc="Lemur is a toolkit designed to facilitate research in language modeling and information retrieval "
arch=('i686' 'x86_64')
url="http://www.lemurproject.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ncu.dl.sourceforge.net/project/lemur/lemur/lemur-toolkit-4.11/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('b165c136348f5f45e150117e4f44054e')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr --enable-java --enable-php 
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
