pkgname=repacman-pt
pkgver=0.98
pkgrel=2
pkgdesc="Versao portuguesa da ferramenta que re-empacota os pacotes instalados com o pacman"
arch=('any')
url="http://archlinux.fr/repacman"
conflicts=('repacman' 'repacman-en')
license=('GPL')
_scriptname=repacman
source=("$pkgname-$pkgver.tar.gz")
md5sums=('e0a6cccb45beb639372426a5458e5cb2')

build() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 $_scriptname $pkgdir/usr/bin/
}
