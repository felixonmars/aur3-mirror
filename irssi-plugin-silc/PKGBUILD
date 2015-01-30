# Maintainer: Bryce Chidester <bryce@cobryce.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=irssi-plugin-silc
pkgver=1.1.11
pkgrel=1
pkgdesc="SILCNet plugin for irssi."
url="http://silcnet.org"
depends=('irssi' 'silc-toolkit' \
         'glib2' 'openssl' \
         'perl' 'perl-file-mmagic' 'perl-io-stringy' 'perl-mime-tools')
makedepends=('gcc')
arch=('i686' 'x86_64')
license=('GPL2')
source=("https://downloads.sourceforge.net/project/silc/silc/client/sources/silc-client-${pkgver}.tar.bz2")
md5sums=('cd47e57d61e7acf38d4283e6e98f2625')

build() {
  cd "${srcdir}/silc-client-${pkgver}"

  ./configure --prefix=/usr \
              --enable-ipv6 \
              --enable-shared \
              --sysconfdir=/etc \
              --with-perl-lib=vendor \
              --with-silc-plugin \
              --without-silc-includes
  make
}

package() {
  cd "${srcdir}/silc-client-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Remove extraneous perl indexes files
  find "${pkgdir}/usr/lib/" -name perllocal.pod -delete
  find "${pkgdir}/usr/lib/" -name .packlist     -delete
  
  # The man page installed is for silc-client
  rm -fr "${pkgdir}/usr/share/man/"
  
  # The silc.conf file installed is for silc-client
  rm -fr "${pkgdir}/etc/"
  
  # These are the docs for silc-client
  rm -fr "${pkgdir}/usr/share/doc/silc-client/"
  
  # More silc-client extraneous files
  rm -fr "${pkgdir}/usr/share/irssi/themes/"
}
