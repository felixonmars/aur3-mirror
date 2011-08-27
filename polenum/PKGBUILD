# Contributor: DigitalPathogen <aur@InfoSecResearchLabs.co.uk>

pkgname=polenum
pkgver=0.2
pkgrel=1
pkgdesc="a python script to extract the password policy information from a windows machine."
arch=('i686' 'x86_64')
url="http://labs.portcullis.co.uk/application/polenum/"
license=('CUSTOM')
depends=('impacket' 'python')
source=(http://labs.portcullis.co.uk/download/$pkgname-$pkgver.tar.bz2)
md5sums=('4101c2acfa5442bd75418afaa405624d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m 0755 -o root -g root polenum.py ${pkgdir}/usr/bin/polenum.py
  install -D -m 0644 -o root -g root LICENSE ${pkgdir}/usr/share/licenses/polenum/LICENSE

}

# vim:set ts=2 sw=2 et:
