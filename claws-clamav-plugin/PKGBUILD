# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
pkgname=claws-clamav-plugin
pkgver=3.5
pkgrel=1
pkgdesc="This plugin provides the clamav antivirus plugin"
arch=('i686' 'x86_64')
url="http://www.thewildbeast.co.uk/claws_mail_plugins/"
license=('GPL2')
depends=('claws-mail' 'clamav' 'gtk2')
source=(http://www.thewildbeast.co.uk/claws_mail_plugins/clamav-plugin-$pkgver.tar.gz
        clamav-gpl.patch)
md5sums=('369d40c6a58e52af67c21eb2b1c7580c'
         '9c35d02e0647db4f764c514ebae18e9d')

build() {
  cd "$startdir/src/clamav-plugin-$pkgver/"
  patch -Np0 -i ../clamav-gpl.patch || return 1

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
