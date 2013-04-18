pkgname=htstress-git
_gitname="htstress"
pkgver=v0.0.1
pkgrel=1
pkgdesc="Fast HTTP Benchmarking Tool"
arch=('i686' 'x86_64')
url="https://github.com/arut/htstress"
depends=('glibc')
license=('custom')
source=("git://github.com/arut/htstress.git")
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    # Use the tag of the last commit
    git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    ./build.sh
}

package() {
    cd $_gitname
    install -D -m755 htstress "$pkgdir"/usr/bin/htstress
    install -D -m644 README "$pkgdir"/usr/share/doc/htstress/README
}
