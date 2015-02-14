# Contributor: Michele Mocciola <mickele>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=omninotify
pkgver=2.1
pkgrel=5
pkgdesc="A multi-threaded implementation of the CORBA Notification Service"
arch=('i686' 'x86_64')
url="http://omninotify.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('omniorb')
makedepends=('patch' 'pkgconfig' 'coreutils')
source=(http://downloads.sourceforge.net/omninotify/omniNotify-$pkgver.tar.gz
        omninotify_2.1_64bit.patch
        omninotify_2.1_iostream.patch
        omniorb.patch)
sha256sums=('7bb0fdc7b1aeecb8e3406be5bfcc8a3701472fde7c43f805e297179b1b34cef0'
            'c11e54f412169cc98d996490eef7a50f6e8b2602fa61dcf3a09318be57b689a6'
            '65ded840369424241c77ec66143a4c466d41b8208972990d780cf45e4afd8316'
            'e4da8379006096fd2f6d57230e709126338db8bda8d6091bae7458f8f969c01c')

prepare() {
  cd "$srcdir"/omniNotify
  patch -Np1 < "$srcdir"/omninotify_2.1_64bit.patch
  patch -Np1 < "$srcdir"/omninotify_2.1_iostream.patch
  patch -Np1 < "$srcdir"/omniorb.patch
}

build() {
  cd "$srcdir"/omniNotify
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/omniNotify
  make DESTDIR="$pkgdir" install
  chmod 755 "$pkgdir"/usr "$pkgdir"/usr/bin "$pkgdir"/usr/lib "$pkgdir"/usr/include
}
