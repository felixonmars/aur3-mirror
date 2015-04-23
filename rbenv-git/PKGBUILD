# Submitter: Vladimir Chizhov <jagoterr@gmail.com>
# Maintainer: murchik <mixturchik@gmail.com>
pkgname=rbenv-git
pkgver=v0.4.0.r148.g5b9e4f0
pkgrel=2
pkgdesc="Simple Ruby version manager"
arch=('any')
url="https://github.com/sstephenson/rbenv"
license=('MIT')
depends=()
optdepends=('ruby-build')
conflicts=('rbenv')
install="rbenv.install"
source=("rbenv-git::git+https://github.com/sstephenson/rbenv.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$pkgdir/usr/lib/rbenv/completions"
    mkdir -p "$pkgdir/usr/lib/rbenv/libexec"

    install -m 644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
    install -m 644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname"
    install -m 644 ./completions/* "$pkgdir/usr/lib/rbenv/completions/"
    install -m 755 ./libexec/* "$pkgdir/usr/lib/rbenv/libexec/"

    ln -s /usr/lib/rbenv/libexec/rbenv "$pkgdir/usr/bin/"
}
