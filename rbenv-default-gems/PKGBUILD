# Maintainer: Vincent Demeester <vincent@shortbrain.org>
pkgname=rbenv-default-gems
pkgver=1.0.0
pkgrel=2
pkgdesc="An rbenv plugin to automatically install gems every time you install a new version of Ruby"
arch=('any')
url="https://github.com/sstephenson/rbenv-default-gems"
license=('MIT')
depends=('rbenv')
optdepends=('ruby-build: install ruby with rbenv')
source=($url/tarball/v$pkgver)
md5sums=('3130f2b78cfb55af6a065aa33bb0a248')

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "v$pkgver"
}

package() {
    cd $srcdir

    mkdir -p $pkgdir/etc/rbenv.d/install

    install -m 644 ./etc/rbenv.d/install/default-gems.bash $pkgdir/etc/rbenv.d/install/
}
