pkgname=edict
pkgver=20140729
pkgrel=1
pkgdesc="A Japanese-English Dictionary file."
arch=('any')
url="http://www.csse.monash.edu.au/~jwb/edict.html"
license=('CCPL:cc-by-sa-3.0')
source=('http://ftp.monash.edu.au/pub/nihongo/edict.zip')
sha256sums=('SKIP')

pkgver() {
 head -n 1 edict | tail -c 12 | sed -e 's/-//g' -e 's/\///'
}

package() {
 install -d $pkgdir/usr/share/edict/
 install -m644 edict $pkgdir/usr/share/edict/edict
 install -m644 edict.jdx $pkgdir/usr/share/edict/edict.jdx
}
