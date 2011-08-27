# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=midillo
pkgver=0.0
pkgrel=1
pkgdesc="MIDI manipulation library and tools"
arch=('i686' 'x86_64')
url="http://kin.klever.net/midillo/"
license=('MIT')
depends=('konforka')
makedepends=('pkgconfig')
options=('!libtool')
source=("http://kin.klever.net/dist/$pkgname-$pkgver.tar.bz2"
        "midillo-0.0-gcc43.patch")
md5sums=('9121745372610cae8bcee42fecfefced'
         '16905d3f54bae8e2454b93c8e2127631')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../midillo-0.0-gcc43.patch

  ./configure --prefix=/usr --mandir=/usr/share/man \
      --with-pkgconfigdir=/usr/lib/pkgconfig
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
