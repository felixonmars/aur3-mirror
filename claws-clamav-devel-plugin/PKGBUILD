# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Mantainer:   Marco Maso <demind@gmail.com>
pkgname=claws-clamav-devel-plugin
pkgver=3.5
pkgrel=3
pkgdesc="This plugin provides the clamav-devel antivirus plugin"
arch=('i686' 'x86_64')
url="http://www.thewildbeast.co.uk/claws_mail_plugins/"
license=('GPL2')
depends=('claws-mail' 'clamav-devel' 'gtk2')
source=(http://www.thewildbeast.co.uk/claws_mail_plugins/clamav-plugin-$pkgver.tar.gz
        clamav-gpl.patch)
md5sums=('369d40c6a58e52af67c21eb2b1c7580c'
         'cf481aae70756cde68dc6542ef5e465a')

build() {
  cd "$startdir/src/clamav-plugin-$pkgver/"
  patch -Np0 -i ../clamav-gpl.patch || return 1

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

