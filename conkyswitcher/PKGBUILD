# Maintainer: Manuel Morales
pkgname=conkyswitcher
pkgver=1.3
pkgrel=2.2
pkgdesc="Conky .conkyrc-file real time switcher"
arch=('any')
url="http://www.facebook.com/androz513"
license=('GPL')
depends=('conky')
provides=('conkywonky')

build() {
wget http://dl.dropbox.com/u/41172131/conkyWonky
chmod +x conkyWonky
}

package() {
sudo mv conkyWonky /usr/bin/conkyWonky
}
