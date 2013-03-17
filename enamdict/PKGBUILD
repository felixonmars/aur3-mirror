pkgname=enamdict
pkgver=20130317
pkgrel=1
pkgdesc="Japanese proper names dictionary file."
arch=('any')
url="http://www.csse.monash.edu.au/~jwb/enamdict_doc.html"
license=('CCPL:cc-by-sa-3.0')
source=('http://ftp.monash.edu.au/pub/nihongo/enamdict.zip')
sha256sums=('5910e5b067fcb41e94cba561e4851913fd67f09bb7869d3f4e51c271a68f829d')

package() {
 install -d $pkgdir/usr/share/enamdict
 install -m644 enamdict $pkgdir/usr/share/enamdict/enamdict
 install -m644 enamdict.jdx $pkgdir/usr/share/enamdict/enamdict.jdx
}
