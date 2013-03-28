# Maintainer: Vincent Demeester <vincent@shortbrain.org>
pkgname=rbenv-vars
pkgver=1.2.0
pkgrel=1
pkgdesc="An rbenv plugin that safely sets global and per-project environment variables."
arch=('any')
url="https://github.com/sstephenson/rbenv-vars"
license=('MIT')
depends=('rbenv')
source=($url/tarball/v$pkgver)
md5sums=('1711d6c003a2ae73ce80b3bf800e511e')

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "v$pkgver"
}

package() {
    cd $srcdir

    mkdir -p $pkgdir/usr/lib/rbenv/libexec
    mkdir -p $pkgdir/etc/rbenv.d/exec

    install -m 755 ./bin/rbenv-vars $pkgdir/usr/lib/rbenv/libexec/
    install -m 644 ./etc/rbenv.d/exec/rbenv-vars.bash $pkgdir/etc/rbenv.d/exec/
}
