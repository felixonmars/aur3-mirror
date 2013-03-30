# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=caudio
pkgver=2.2.0
pkgrel=2
pkgdesc="Advanced C++ wrapper around OpenAL"
arch=(i686 x86_64)
url=https://github.com/wildicv/cAudio
license=(zlib)
depends=(openal)
source=($url/archive/v2.2.0.zip)
sha256sums=('0711ad7bcbf3a012c7e6e1abba7630c26e5ef182efc802afbae4900bfc2ac7a7')
sha512sums=('f404e1ea4ce4979726bd4a44980646468e993ff5b7dd5d48561b2a64bd9f728e4498dea794466d230e86986b5dae3ae58fa1b4b0a98718734de3bc190cbce77a')

build() {
    install -d $pkgname-build/
    cd $pkgname-build/
    cmake ../cAudio-$pkgver/ \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    make -C $pkgname-build DESTDIR="$pkgdir" install
}
