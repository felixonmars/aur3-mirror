# Rafael G. Martins <rafael@rafaelmartins.com>
# Contributor: Tom K <tomk@runbox.com>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=fuseftp
pkgver=0.8
pkgrel=5
pkgdesc="FTP filesystem written in Perl, using FUSE" 
url="http://freshmeat.net/projects/fuseftp/"
arch=('i686' 'x86_64')
depends=('perl-cache' 'perl-fuse>=0.06-2' 'perl-term-readkey')
source=(http://perl.thiesen.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('b46ab484e7e975288bfdf77e8922982b')
license=('GPL')
install="fuseftp.install"
options=('!emptydirs')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	perl Makefile.PL
	make 
  }
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install

}
