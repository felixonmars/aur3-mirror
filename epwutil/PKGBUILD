# Maintainer: Mark Quinn <mmq.arch@dekinai.com>

pkgname=epwutil
pkgver=1.1
_debver=1.1-8.1
pkgrel=1
pkgdesc="Utilities that can deal with EB/EPWING format books, including catdump, bookinfo, and squeeze."
arch=('i686' 'x86_64')
# http://ebsnap.lkj.jp/
url="http://openlab.ring.gr.jp/edict/"
license=('custom')

# http://ebsnap.lkj.jp/ebutils-1.2pre-20030906.tar.gz
source=(http://openlab.ring.gr.jp/edict/epwutil/epwutil-1.1.tar.gz
        http://patch-tracker.debian.org/patch/series/dl/epwutil/$_debver/10-getline-function.patch
	LICENSE)
md5sums=('afb59f9c549edbc5580172c42f1d2ae2'
         'be73ea79e205e736806e0c5d81031def'
         '5b194f607ef106319f489539ebb22201')

build() {
  cd epwutil-$pkgver
  patch -Np1 -i "$srcdir/10-getline-function.patch"
  make -f makefile.unx
  iconv -f eucjp -t utf8 catdump.man > catdump.1
  iconv -f eucjp -t utf8 bookinfo.man > bookinfo.1
  iconv -f eucjp -t utf8 squeeze.man > squeeze.1
  iconv -f eucjp -t utf8 epwutil.doc > epwutil.utf8.txt
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd epwutil-$pkgver
  install -Dm644 epwutil.utf8.txt "$pkgdir/usr/share/doc/$pkgname/epwutil.utf8.txt"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 catdump bookinfo "$pkgdir/usr/bin/"
  # Install squeeze to epwutil-squeeze to avoid conflict with other squeezes
  install -m755 squeeze "$pkgdir/usr/bin/epwutil-squeeze"
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m644 catdump.1 bookinfo.1 squeeze.1 "$pkgdir/usr/share/man/man1/" 
}
