# Maintainer: Christoph Grabo <asaaki@mannaz.cc>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb-latest
pkgver=2.3.4
pkgrel=1

pkgdesc="A distributed open-source database with a flexible data model for documents, graphs, and key-values."
license=("Apache")
url="https://www.arangodb.com/"

provides=("arangodb=$pkgver")
conflicts=("arangodb" "arangodb-git")
depends=("glibc" "gcc-libs" "openssl" "readline" "systemd")
makedepends=("python2")

arch=("i686" "x86_64")

_go_ver=1.4
_go_arch_dl=amd64
_go_arch=64
[[ $CARCH = i686 ]] && _go_arch_dl=368 && _go_arch=32

install=arangodb.install
source=(  "https://www.arangodb.com/repositories/Source/ArangoDB-${pkgver}.tar.bz2"
          "https://storage.googleapis.com/golang/go${_go_ver}.linux-${_go_arch_dl}.tar.gz"
          "arangodb.service")
md5sums=( "26525ffdf76af9e1f6b40421b03a8544"
          "9b44606c28c88a5c3d0cb4a36ce7de54"
          "3cdd43ed5552ab918b41627ec4906e52")
[[ $CARCH = i686 ]] && md5sums[1]="4fea51cc90b4d78fe6176ec30a1e5334"

build() {
  msg2 "Python2 link"
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"

  msg2 "Prepare Go ${_go_ver} ${_go_arch_dl} ..."
  mv $srcdir/go $srcdir/ArangoDB-$pkgver/3rdParty/go-$_go_arch

  msg2 "Configure ArangoDB project ..."
  cd $srcdir/ArangoDB-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-all-in-one-libev \
    --enable-all-in-one-etcd \
    --enable-all-in-one-icu \
    --enable-all-in-one-v8 \
    --enable-internal-go \
    --disable-mruby

  msg2 "Build ArangoDB project ..."
  make
}

check() {
  cd $srcdir/ArangoDB-$pkgver
  make -k check
}

package() {
  msg2 "Prepare ArangoDB installation ..."
  cd $srcdir/ArangoDB-$pkgver
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/arangodb
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/* $pkgdir/usr/share/doc/arangodb/

  msg2 "Prepare systemd service setup ..."
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb.service $pkgdir/usr/lib/systemd/system/

  msg2 "Done!"
}
