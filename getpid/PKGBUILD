# Maintainer: lspci <agm2819[[aaaa]][[tttt]]gmail[[dd]][[oo]][[tt]][[cc]][[oo]][[mm]]>
# 
# 
pkgname=getpid
pkgver=0.1.1
pkgrel=4
pkgdesc="A perl program to get the pid of user-supplied process(es). (runs as 'getpid')"
arch=('i686' 'x86_64')
url="https://bitbucket.org/agalog/releases"
license=('BSD')
groups=('')
depends=('perl>=5.10.0' 'perl-println>=0.1.3b' 'perl-unix-pid')
makedepends=('')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://bitbucket.org/agalog/releases/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('a1bc5e989c0c3ac8c7c5dd473a7722b0')


build() {
    cd "$srcdir"
    install -v -d "$pkgdir/usr/bin/"
    install -v -m 755 -D getpid "$pkgdir/usr/bin/getpid"

}

check() {
    true
}

package() {
    true
}
