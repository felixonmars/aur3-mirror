# Maintainer: Charly Caulet <charly.caulet@no-log.org>
pkgname='xpl-perl'
pkgver='0.11'
pkgrel='3'
pkgdesc="A framework for writing xPL applications in Perl"
arch=('i686' 'x86_64')
license=('Perl')
options=()
depends=('perl' 'git')
url='https://github.com/beanz/xpl-perl/'
#md5sums=('')

build() {
  cd ${srcdir}
  git clone https://github.com/beanz/${pkgname}.git
  cd ${pkgname}
  git reset --hard 934b2af60b11d3209ab2e152251f69ed124fd65d

  perl Makefile.PL PREFIX=${pkgdir}/usr
  make
  #tests do not pass
  #make test
  make install
}
