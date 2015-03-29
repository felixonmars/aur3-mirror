# Maintainer: Doug Smith <savantdashtechnopathatcyberdashwizarddotcom>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=midish
pkgver=1.0.6
pkgrel=3
pkgdesc="shell-like MIDI sequencer/filter"
arch=('i686' 'x86_64')
url="http://www.midish.org"
license=('BSD')
depends=('sh' 'alsa-lib' 'readline' 'ncurses')
conflicts=('midish-dev-snapshot')
source=(http://www.midish.org/${pkgname}-${pkgver}.tar.gz license.txt)
md5sums=('e8d770a0c5f68089b4632f1874a6538f' 
	 '8384b1c817111310ae7cef3c4853a639')

build() {
 cd "${srcdir}/${pkgname}-${pkgver}"
 ./configure --prefix=/usr --mandir=/usr/share/man
 make
 }

package(){
 cd "${srcdir}/${pkgname}-${pkgver}"
 make DESTDIR="${pkgdir}" install

 #License text extracted from the manual.
 install -D -m644 ../../license.txt \
 	"${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
 }
