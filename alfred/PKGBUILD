# Maintainer: Charly Caulet <charly.caulet@no-log.org>
pkgname='alfred'
pkgver='0.01'
pkgrel='2'
pkgdesc="Alfred is an home automation chatbot which facilitates interactions between users and an home-automation system."
arch=('i686' 'x86_64')
license=('GPL')
options=()
depends=('htk' 'julius' 'xpl-perl' 'speech-dispatcher' 'perl-rivescript')
url='http://alfred.csquad.org/'
#md5sums=('')

build() {
  cd ${srcdir}
  svn co -r 73 http://alfred.csquad.org/svn/trunk ${pkgname}
  cd ${pkgname}
  perl Makefile.PL PREFIX=${pkgdir}/usr
  make
  make test
  make install
}
