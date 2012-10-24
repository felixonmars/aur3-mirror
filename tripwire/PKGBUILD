# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: eliott <eliott@cactuswax.net>

pkgname=tripwire
pkgver=2.4.2.2
pkgrel=1
pkgdesc="An intrusion detection system"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tripwire/"
license=('GPL')
depends=('openssl')
backup=('etc/tripwire/twpol.txt' 'etc/tripwire/twcfg.txt')
install=$pkgname.install
#options=('!makeflags')
source=(http://sourceforge.net/projects/tripwire/files/tripwire-src/tripwire-2.4.2.2/tripwire-2.4.2.2-src.tar.bz2
        twpol.txt twcfg.txt fix_ftbfs_with_gcc_4.7.patch)
sha256sums=('e09a7bdca9302e704cc62067399e0b584488f825b0e58c82ad6d54cd2e899fad'
            '4da49a185fee570e0a7bdc7acaadc0d2bf7f4c488057e93e60b2a2819807cd9d'
            '3aaa567f7a0a4efce3ac127344a9b795c5494c9d011e27a7d454d632ba3d533d'
            'f954eb3cd6e7599ab201437649aad48e7329f984c15090ecc801e151b5fd8764')

build() {
  cd ${srcdir}/$pkgname-$pkgver-src

  patch -Np1 < ../fix_ftbfs_with_gcc_4.7.patch
#build package
#  CFLAGS="$CFLAGS -fno-strict-aliasing" CXXFLAGS="$CXXFLAGS -fno-strict-aliasing" \
    ./configure --prefix=/usr --sysconfdir=/etc/tripwire
  make
}

package () {
  cd ${srcdir}/$pkgname-$pkgver-src

  # This package doesn't have a typical make install, so we do it by hand.
  #make DESTDIR=${pkgdir} install
 
#create var/lib directories
  install -d ${pkgdir}/var/lib
  install -d -m700 ${pkgdir}/var/lib/tripwire
  install -d -m700 ${pkgdir}/var/lib/tripwire/report

#install binaries
  install -d ${pkgdir}/usr/sbin
  install -m755 bin/siggen ${pkgdir}/usr/sbin/
  install -m755 bin/tripwire ${pkgdir}/usr/sbin/
  install -m755 bin/twadmin ${pkgdir}/usr/sbin/
  install -m755 bin/twprint ${pkgdir}/usr/sbin/

#copy install files for use by user after install, and fix a path
  install -d ${pkgdir}/usr/share/$pkgname
  install -m755 install/install.sh ${pkgdir}/usr/share/$pkgname/
  install -m644 install/install.cfg ${pkgdir}/usr/share/$pkgname/
  sed -i 's#./install/install.cfg#./install.cfg#' ${pkgdir}/usr/share/$pkgname/install.sh

#install man pages - FS#13766 fixed
  install -d ${pkgdir}/usr/share/man/{man4,man5,man8}
  install -m644 man/man4/*.4 ${pkgdir}/usr/share/man/man4/
  install -m644 man/man5/*.5 ${pkgdir}/usr/share/man/man5/
  install -m644 man/man8/*.8 ${pkgdir}/usr/share/man/man8/

#install configuration files
  install -d ${pkgdir}/etc/$pkgname
  install -m644 ${srcdir}/twpol.txt ${pkgdir}/etc/tripwire/twpol.txt
  install -m644 ${srcdir}/twcfg.txt ${pkgdir}/etc/tripwire/twcfg.txt
}
