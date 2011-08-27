# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=copher
pkgver=0.2.0
pkgrel=2
pkgdesc="Automates management of projects on sourceforge"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/copher/"
license=('GPL2')
depends=('perl' 'perl-www-mechanize')
source=(http://downloads.sourceforge.net/copher/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2ffc10a8c7904d25267f44179e01bf6d') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d ${pkgdir}/usr/{bin,share/{man/man1,${pkgname}}}
  install copher.pl ${pkgdir}/usr/bin/copher
  install copher.1 ${pkgdir}/usr/share/man/man1/
  install copherrc.example ${pkgdir}/usr/share/${pkgname}/
}
