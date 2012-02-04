# Contributor: Enno Lohmeier <e.lohmeier@gmx.de>
pkgname=fbrcapi
pkgver=0.3
pkgrel=1
pkgdesc="fbrcapi (Fritz!Box Remote CAPI over TCP) is a kernel module, for Fritz!Box Fon Routers to transport CAPI messages over TCP."
arch=(i686 x86_64)
url="http://fbrcapi.v3v.de/"
license=('GPL')
depends=('capi4k-utils' 'kernel26')
makedepends=('patch' 'perl')
source=('http://fbrcapi.v3v.de/dl/fbrcapi-0.3.tar.gz')
md5sums=('c9aae30be1e454f93f0b0fd20268cc51')
install=fbrcapi.install

build() {
  cd "$srcdir/fbrcapi-$pkgver/"

  perl -pe 's/.*/KERNEL_DIR := \/usr\/src\/linux-`uname -r`/ if $. == 1' Makefile > Makefile.tmp

  perl -pe 's/.*/	mkdir -p \$(DESTDIR)\/\$(BUILD_DIR)/ if $. == 17' Makefile.tmp > Makefile

  perl -pe 's/.*/	cp \$(BUILD_NAME).ko \$(DESTDIR)\/\$(BUILD_DIR)/ if $. == 18' Makefile > Makefile.tmp

  perl -pe 's/.*// if $. == 19' Makefile.tmp > Makefile

  make || return 1

  
  make DESTDIR=$pkgdir install
}
