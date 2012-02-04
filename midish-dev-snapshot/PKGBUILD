# Maintainer: Egor Sanin <egordotsaninatgmaildotcom>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=midish-dev-snapshot
_pkgsrcname=midish
pkgver=20111201
pkgrel=1
pkgdesc="shell-like MIDI sequencer/filter"
arch=('i686' 'x86_64')
url="http://caoua.org/midish"
license=('BSD')
depends=('sh' 'alsa-lib' 'readline' 'ncurses')
provides=('midish=1.0.6')
conflicts=('midish')
source=(http://caoua.org/midish/${_pkgsrcname}.tar.gz license.txt)
md5sums=('db28b0cc5459c8de88eff787032a0182'
	 '8384b1c817111310ae7cef3c4853a639')

build() {
 cd "${srcdir}/${_pkgsrcname}"
 ./configure --prefix=/usr --mandir=/usr/share/man
 make
 }

package(){
 cd "${srcdir}/${_pkgsrcname}"
 make DESTDIR="${pkgdir}" install

 #License text extracted from the manual.
 #We put it in licenses/midish even though package
 #name is different.
 install -D -m644 ../../license.txt \
 	"${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
 }
