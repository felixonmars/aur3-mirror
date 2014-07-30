# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=emacs-tuareg-mode
pkgver=2.0.8
pkgrel=1
pkgdesc="Emacs tuareg mode for ocaml"
arch=(any)
url=https://forge.ocamlcore.org/projects/tuareg/
license=(GPL2)
depends=(emacs)
DLAGENTS=('https::/usr/bin/curl -fkLC - --retry 3 --retry-delay 3 -o %o %u')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/ocaml/tuareg/releases/download/$pkgver/tuareg-$pkgver.tar.gz)
sha256sums=('13da95153d6d50ef697878c45d81302340f97a42ab14112c61b8c6b0e891512c')
sha512sums=('c9e268eb550fd36614e6632335b623a0916d64dd84a0259fd83c6f08e3138196d3871bc7664d6debe62732d4459130ef1e9271b24982138ff69d90442d031990')

build() {
    make -C tuareg-$pkgver/
}

package() {
    cd tuareg-$pkgver/
    for i in *.el{,c}; do
        install -Dm644 $i "$pkgdir"/usr/share/emacs/site-lisp/tuareg/$i
    done
    install -Dm644 README.md "$pkgdir"/usr/share/doc/tuareg/README.md
}
