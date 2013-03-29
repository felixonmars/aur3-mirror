# Maintainer: M0Rf30
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>
pkgname=liquidsoap-full
pkgver=1.1.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Liquidsoap is the audio stream generator of the Savonet project, notably used for generating the stream of netradios"
url="http://savonet.sourceforge.net/"
install=liquidsoap.install
depends=('ocaml' 'ocaml-pcre' 'perl-xml-dom' 'libxml-perl' 'ocaml-camomile' 'ocaml-magic' 'ocaml-dtools' 'ocaml-duppy' 
'ocaml-findlib' 'gstreamer' 'gst-plugins-base-libs' 'frei0r-plugins')
source=(http://downloads.sourceforge.net/project/savonet/liquidsoap/$pkgver/liquidsoap-$pkgver-full.tar.bz2
        'PACKAGES'   )


build() {
  
  cp $srcdir/PACKAGES $srcdir/liquidsoap-$pkgver-full

  cd "$srcdir/liquidsoap-$pkgver-full"
  ./bootstrap 
  ./configure --prefix=/usr  --localstatedir=/var --sysconfdir=/etc --with-user=liquidsoap --with-group=liquidsoap
  make || return 1
  make DESTDIR="$pkgdir/" datadir="$pkgdir/usr/share/" mandir="$pkgdir/usr/share/man/"  localstatedir="$pkgdir/var"  bindir="$pkgdir/usr/bin/"  libdir="$pkgdir/usr/lib/" sysconfdir="$pkgdir/etc/"  install

  
}

md5sums=('037cc52265872c4084634c5fab0ad254'
         '873d1d9a3329c5f29d7605cb6d061f8e')
