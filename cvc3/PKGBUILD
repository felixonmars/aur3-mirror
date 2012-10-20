
# Contributor: Paolo Herms

pkgname=cvc3
pkgver=2.4.1
pkgrel=1
pkgdesc="An automatic theorem prover"
arch=(i686 x86_64)
url="http://www.cs.nyu.edu/acsys/cvc3/"
license=('custom')
source=("http://www.cs.nyu.edu/acsys/cvc3/releases/$pkgver/cvc3-$pkgver.tar.gz")
md5sums=('9b082b0e8c80e1459e9653de044e0d6e')

build() {
    cd "$srcdir"/cvc3-$pkgver
    ./configure --prefix=/usr
    make
    make prefix="$pkgdir"/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/cvc3/LICENCE
    
}
