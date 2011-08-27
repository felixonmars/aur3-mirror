# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: gothicknight <gothicknight@gmail.com>

pkgname=msnsniff
pkgver=1.1
pkgrel=4
pkgdesc="A command line tool for intercepting conversations over the MSN Messenger protocol"
arch=('i686' 'x86_64')
url="http://msnsniff.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'libpcap')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.tar.bz2 \
  $pkgname.patch)
md5sums=('72c156aa6246a30f18a5247e902d820f'
         'c34305c71e1deec84a3859253e82f4fd')

build() {
  cd "$srcdir"
  patch -Np0 -i $pkgname.patch || return 1
  make || return 1
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
