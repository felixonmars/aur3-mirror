# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>


pkgname=gcap
pkgver=0.1.1
pkgrel=1
pkgdesc='Command line tool for downloading Youtube closed captions'
arch=('any')
url='http://code.google.com/p/gcap/'
license=('GPL3')
depends=('perl>=5.10.1' 'perl-xml-dom' 'perl-getopt-argvfile')
source=("http://gcap.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('7b32bf23998d30f5363cfb10918dd4ee')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  perl Makefile.PL INSTALL_BASE=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" INST_MAN1DIR="${pkgdir}/usr/share/man/man1" MAN1EXT="1p.gz" install
  
  rm -r "${pkgdir}/usr/man"
  rm "${pkgdir}/usr/share/man/man1/.exists"
}

# vim:set ts=2 sw=2 et:
