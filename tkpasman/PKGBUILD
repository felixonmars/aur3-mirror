# Contributor: Peter Slizik <peter dot slizik at gmail com>

pkgname='tkpasman'
pkgver='2.2b'
pkgrel='1'
pkgdesc='A useful and reliable personal password manager, written in Tcl/Tk.'
arch=('i686' 'x86_64')
url='http://www.xs4all.nl/~wbsoft/linux/tkpasman.html'
license=('GPL2')
depends=('tcl>=8.3' 'tk>=8.3')
optdepends=('openssl: optional encryption of the password file')
install='tkpasman.install'
source=("http://www.xs4all.nl/~wbsoft/linux/projects/TkPasMan-$pkgver.tar.gz"
        'config.patch' 'Makefile.patch')
md5sums=('192859131fb0891b8c7ac5f41876e520'
         '2f056893c46d0545ffb3383081ff6f7d'
         '55a9d86f1ae5d22089da357d759166d5')

build() {
  cd "$srcdir/TkPasMan-$pkgver"

  patch -i ../config.patch || return 1
  patch -i ../Makefile.patch || return 1

  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
