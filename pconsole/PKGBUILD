# Maintainer: Evaggelos Balaskas <ebalaskas AT ebalaskas DOT gr>
# Contributor: Evaggelos Balaskas <ebalaskas AT ebalaskas DOT gr>
pkgname=pconsole
arch=('i686')
pkgver=1.0
pkgrel=2
license=('GPL')
pkgdesc="is a administrative tool for working with clusters of machines"
url="http://www.heiho.net/${pkgname}"
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b0a170284c3272e2e403fc8f2ccfdd53')
install=
build() {
        cd $srcdir/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make prefix="$pkgdir/usr/" install
        chown root $pkgdir/usr/bin/pconsole ; chmod 4110 $pkgdir/usr/bin/pconsole
}
