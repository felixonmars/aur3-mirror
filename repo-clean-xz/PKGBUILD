# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: Andrey Demidov <andrey.demidov@gmail.com>

pkgname=repo-clean-xz
pkgver=0.1.4
pkgrel=1
pkgdesc="Clean utility for Pacman repository (with xz patch)"
arch=(i686 x86_64)
url=https://github.com/luolimao/$pkgname
license=(GPL3)
depends=(boost)
makedepends=(scons)
source=(https://github.com/downloads/luolimao/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('79824dd29ad7bc92a5a17513d0b66684ce9a9b74a5ce4d4927fc3b0c0d008ed3')
sha512sums=('c290f7fbed4c4463716d1b6f8a4e1ec6ed429d928005eaef052a0495995d8f45c8384c1a7921117a2c8da393ebcff3cf53cf89485cf628c0f011bff58807e9aa')

build() {
    cd $pkgname-$pkgver/
    scons
}

package() {
    cp -rf $pkgname-$pkgver/dist/ "$pkgdir"/usr/
}
