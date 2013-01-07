# Maintainer: lspci <agm2819[[aaaa]][[tttt]]gmail[[dd]][[oo]][[tt]][[cc]][[oo]][[mm]]>
# 
# 
pkgname=show
pkgver=0.04
pkgrel=1
pkgdesc="a program that tries to help you keep track of filesystem changes in the currrent dir"
arch=('i686' 'x86_64')
url="https://bitbucket.org/agalog/releases/src"
license=('BSD')
groups=('')
depends=('grep' 'perl' 'bash' 'sed')
makedepends=('')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://bitbucket.org/agalog/releases/downloads/$pkgname-$pkgver-$pkgrel.tar.gz")
md5sums=('4fd298a8efe43b2953a892389baf6fde')


build() {
#    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/$pkgname/lib/"
}

check() {
    cd "$srcdir"
    if [[ -f "$pkgname" ]]; then
	true;
    else
	false;
    fi
    if [[ -f "like.plx" ]]; then
	true;
    else
	false;
    fi
}

package() {
    cd "$srcdir"
    install -m 755 show "$pkgdir/usr/bin/"
    install -m 755 like.plx "$pkgdir/usr/share/$pkgname/lib"
}
