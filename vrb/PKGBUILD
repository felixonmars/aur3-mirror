# Maintainer: Linas <linas_fi@ymail.com>
# Package changelog:
# Version 2. GCC now fails due to an unused-but-set-variable
# Removed poll_num with unused-but-set-variable.diff
pkgname=vrb
pkgver=0.5.1
pkgrel=2
pkgdesc="The Virtual Ring Buffer library allows easy circular buffers."
arch=('i686' 'x86_64')
url="http://vrb.slashusr.org/"
license=('LGPL')
depends=(glibc)
source=(http://vrb.slashusr.org/download/$pkgname-$pkgver.tar.bz2 removed_options.diff unused-but-set-variable.diff)
md5sums=(346914bd6d963d1ef06e075ee21d689e 145355328f2f7d404f94b40f0c5fac64 d97f34aec867ebde061f0a684141454a)
sha1sums=(1371128ef46744a71551863b062eaf339391ebba c5da90202e70a5550c28c2ed7634e22b13439739 95c801bdd3914aa9c942f9a78a177508711d48b9)
sha256sums=(d579ed1998ef2d78e2ef8481a748d26e1fa12cdda806d2e31d8ec66ffb0e289f b62e82c5ca76351d32f24d65832c4beb71226dd8b2f2e38f712a6f5ab875fb7b 33a8125c5438dcb0c424abe4f1ccc7ad738ec425a560559796425c17207cdc6e)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 < ../removed_options.diff
  patch -p0 < ../unused-but-set-variable.diff
  ./configure --prefix=/usr --install-prefix="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  mkdir -p "$pkgdir/usr/share/man/man3" "$pkgdir/usr/include"

  make install
  cp -p ../vrb/man/man3/*.3 "$pkgdir/usr/share/man/man3"
}

