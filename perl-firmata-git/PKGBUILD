# Contributor: Alexander Kazarin <boiler@co.ru>

pkgname='perl-firmata-git'
pkgver='20101130'
pkgrel='1'
pkgdesc="Perl implementation of the Firmata client"
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/amimoto/perl-firmata/'
depends=('perl' 'perl-device-serialport')
makedepends=('git')
_gitroot=("https://github.com/amimoto/perl-firmata.git")
_gitname=("perl-firmata")

build() {
  cd ${srcdir}

  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/perl5/site_perl
  cp -r ${srcdir}/${_gitname}/lib/* ${pkgdir}/usr/lib/perl5/site_perl/
  mkdir -p ${pkgdir}/usr/share/${_gitname}
  cp -r ${srcdir}/${_gitname}/examples ${pkgdir}/usr/share/${_gitname}/
  cp -r ${srcdir}/${_gitname}/presentation ${pkgdir}/usr/share/${_gitname}/
}

