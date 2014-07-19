# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Glen Oakley <goakley123@gmail.com>

pkgname=terralang-git
pkgrel=1
pkgver=722.b3209e0
pkgdesc='A low-level counterpart to Lua'
arch=('i686' 'x86_64')
url='http://terralang.org/'
license=('MIT')
depends=('clang' 'gcc-libs' 'llvm' 'luajit')
makedepends=('git' 'clang')
source=('git+https://github.com/zdevito/terra.git')
md5sums=('SKIP')

pkgver () {
    cd terra
    printf '%s.%s' "$(git rev-list --count HEAD )" "$(git rev-parse --short HEAD)"
}

build() {
    cd terra
    make
}

package() {
    cd terra
    install -d "${pkgdir}/usr/"{,bin,share/licenses,lib/terra,include/terra}

    install -Dm755 terra "${pkgdir}/usr/bin/terra"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -m755 -t "${pkgdir}/usr/lib/terra" build/*.o build/*.a
    install -m644 -t "${pkgdir}/usr/include/terra" build/*.h src/*.h
}
