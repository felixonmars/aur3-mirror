# Contributor: Tim Karreman <tim@karreman.net>

pkgname=claws-tnef-plugin
pkgver=0.2.2
pkgrel=1
pkgdesc="This plugin provides direct support for tnef encoded attachments."
url="http://www.claws-mail.org/plugins.php"
depends=('libytnef' 'gtk2')
license=('GPL')
arch=('i686' 'x86_64')
source=(http://www.claws-mail.org/downloads/plugins/tnef_parse-${pkgver}.tar.gz)
md5sums=('e525fa3084855d5174d1a7c562110f44')
options=('!libtool')

build() {
  cd $startdir/src/tnef_parse-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}
