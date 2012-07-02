# Maintainer: Dreieck <fbecker(at(mail.zih -- dot -- tu-dresden.de>
# Contributor: Diogo Leal <diogo@diogoleal.com>
# Contributor: Jan Fader <jan.fader@web.de>

pkgname=openswan-ipsectoolscompat
pkgver=2.6.38
pkgrel=3
pkgdesc="Open Source implementation of IPsec for the Linux operating system. Compatible with parallel installation with the package 'ipsec-tools'."
url="http://www.openswan.org"
license=('GPL' 'custom')
arch=('i686' 'x86_64')
depends=('iproute2>=2.6.8' 'gmp' 'perl')
makedepends=('flex' 'bison')
provides=("openswan=${pkgver}" "ipsec-openswan=${pkgver}")
conflicts=('openswan' 'ipsec-openswan')

backup=(etc/ipsec.conf \
        etc/ipsec.d/policies/{block,clear,clear-or-private,private,private-or-clear})
source=(http://download.openswan.org/openswan/openswan-$pkgver.tar.gz
        openswan.rc.d
        compile.patch)

md5sums=('13073eb5314b83a31be88e4117e8bbcd'
         '950eeb36c153209787c51a0a49f290e9'
         '5540437bb334873da646e21ac9caa963')


build() {
  # Create /etc/rc.d for init script, and license directory
  mkdir -p $pkgdir/{etc/rc.d,usr/share/licenses/openswan}

  cd $srcdir/openswan-$pkgver
  patch -p1 -i $srcdir/compile.patch

  # Change install paths to Arch defaults
  sed -i 's|/usr/local|/usr|;s|libexec/ipsec|lib/openswan|' Makefile.inc

  make USE_XAUTH=true USE_OBJDIR=true programs || return 1
  make DESTDIR=$pkgdir install

  # Change permissions in /var
  chmod 755 $pkgdir/var/run/pluto
  
  # Copy License
  cp LICENSE $pkgdir/usr/share/licenses/openswan
  
  # Install init script
  install -Dm755 ../openswan.rc.d $pkgdir/etc/rc.d/openswan
  # To be compatible with the package 'ipsec-tools'.
  mv "${pkgdir}/etc/rc.d/ipsec" "${pkgdir}/etc/rc.d/ipsec-openswan"

  # fix manpages
  mv $pkgdir/usr/man $pkgdir/usr/share/
  

}

