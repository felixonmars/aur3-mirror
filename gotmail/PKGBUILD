# Contributor: Graziano <graziano.giuliani@poste.it>

pkgname=gotmail
pkgver=0.9.0
pkgrel=2
pkgdesc="Gotmail is a perl script to download mail from hotmail.com without \
         user interaction. It is probably best run from a cron job."
url="http://sourceforge.net/projects/gotmail"
license="GPL"
arch=('i686' 'x86_64')
depends=('perl')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}-$pkgver.tar.bz2)
md5sums=(f78ea561039e542c06a900ac6e22995a)

build() {
  cd $startdir/src/$pkgname-$pkgver/
  mkdir $startdir/pkg/usr
  make install DESTDIR=$startdir/pkg \
	       MANCOMPRESS=gzip
               INSTALL="/bin/install -p"
  mkdir -p $startdir/pkg/usr/share/gotmail
  install -m 644 sample.gotmailrc gotmail4evolution $startdir/pkg/usr/share/gotmail
}
