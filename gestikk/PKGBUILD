# Contributor: Lisa Denia <eiffel56@gmail.com>
pkgname=gestikk
pkgver=0.6
pkgrel=1
pkgdesc="Gestikk is a simple mouse gesture recognition application for GNOME."
arch=('i686' 'x86_64')
url="http://gestikk.reichbier.de/"
license=('GPL')
depends=('python' 'python-virtkey' 'xdotool' 'gnome-python-desktop' 'pyparsing' 'pygtk' 'kiwi' 'python-notify' 'pyxdg')
source=(http://gestikk.reichbier.de/downloads/gestikk-${pkgver}.tar.gz gestikk.sh)
md5sums=('c3b4de8392241a39378760939cb7d437'
         '75420f145b554bf3da3e8e996056f792')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p ${pkgdir}/usr/share/gestikk
  mkdir -p ${pkgdir}/usr/bin
  cp -R * ${pkgdir}/usr/share/gestikk/ || return 1
  cp ${srcdir}/gestikk.sh ${pkgdir}/usr/bin/gestikk || return 1
}
