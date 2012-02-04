# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=diogenes
pkgver=3.1.6
pkgrel=3
pkgdesc="Greek and Latin dictionary and browser of the databases of ancient texts published by the Thesaurus Linguae Graecae and the Packard Humanities Institute"
arch=("i686" "x86_64")
url="http://www.dur.ac.uk/p.j.heslin/Software/Diogenes/index.php"
license=("GPL")
depends=("perl")
#depends=("perl" "xulrunner" "perl-libwww")
makedepends=()
backup=()
install=diogenes.install
source=("http://downloads.sourceforge.net/diogenes/diogenes-expert-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/diogenes/diogenes-expert-data-$pkgver.tar.bz2"
	"xulapp.tar.bz2" "diogenes.desktop" "diogenes-server.desktop" "diogenes.png")
md5sums=('e14cabae8937c949727a97d63182b4c9' '60035c73792e423a075b066151775cd8'
         '60bca837bde92e06dbf68a0a3e303385' '6a8b46c11e916636ca01dedca1318255'
         '6fe91d7ea5e843fa5a3724a7b586922d' '8a8a0ad643548cc5003a3a536ba28dc7')

build() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/pixmaps"
  mv "xulapp" "$pkgdir/usr/share/diogenes"
  mv "diogenes-$pkgver" "$pkgdir/usr/share/diogenes/perl"
  mv "Perseus_Data" "$pkgdir/usr/share/diogenes/perl/"
  install -m644 "diogenes.desktop" "$pkgdir/usr/share/applications"
  install -m644 "diogenes-server.desktop" "$pkgdir/usr/share/applications"
  install -m644 "diogenes.png" "$pkgdir/usr/share/pixmaps"
  echo -e '#!/bin/sh\nexec xulrunner /usr/share/diogenes/application.ini "$@"' >"$pkgdir/usr/bin/diogenes"
  echo -e '#!/bin/sh\nexec perl -I/usr/share/diogenes/perl /usr/share/diogenes/perl/diogenes-cli.pl "$@"' >"$pkgdir/usr/bin/dio"
  echo -e '#!/bin/sh\nexec perl -I/usr/share/diogenes/perl /usr/share/diogenes/perl/diogenes-server.pl "$@"' >"$pkgdir/usr/bin/diogenes-server"
  chmod +x "$pkgdir/usr/bin/"{diogenes,dio,diogenes-server}
  #rm -rf "$pkgdir/usr/share/diogenes/perl/CPAN/"{LWP*,HTTP*}
}

