# Contributor: Sebastian Pohle <naitsabes@imapmail.org>
pkgname=ifmetric
pkgver=0.3
pkgrel=3
pkgdesc="A tool for setting the metrics of all IPv4 routes attached to a given \
         network interface at once."
arch=('i686' 'x86_64')
url="http://0pointer.de/lennart/projects/ifmetric/"
license=('GPL')
depends=('glibc')
source=(http://0pointer.de/lennart/projects/ifmetric/$pkgname-$pkgver.tar.gz)
md5sums=('74aa3f5ee8aca16a87e124ddcc64fa36')

prepare() {
  #netlink fix
  sed -i "s/char replybuf\[2048\]/char replybuf\[4096\]/" ${srcdir}/${pkgname}-${pkgver}/src/nlrequest.c
}

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  # Since we dont package any docs we dont need lynx to
  # convert HTML docs to text.
  ./configure --prefix=/usr -sbindir=/usr/bin -disable-lynx
  make || return 1
}

package() {
  cd "$startdir/src/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
