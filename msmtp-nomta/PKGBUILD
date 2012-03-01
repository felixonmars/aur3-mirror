#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# This is a copy of the msmtp package from [extra], except for the
# removed provides=('smtp-forwarder'), in order to allow
# simultaneous use msmtp with an MTA such as for example postfix.
#

pkgname=msmtp-nomta
pkgver=1.4.25
pkgver=1.4.27
pkgrel=1
pkgdesc="A mini smtp client (without smtp-forwarder conflict)"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://msmtp.sourceforge.net"
depends=('gnutls' 'libidn')
makedepends=('texlive-core')
conflicts=('msmtp')
install=msmtp.install
source=(http://download.sourceforge.net/sourceforge/msmtp/msmtp-${pkgver}.tar.bz2)
sha1sums=('e335745133b4729fe84c49f836b4d2fa9281e040')

build() {
  cd "${srcdir}/msmtp-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --with-ssl=gnutls
  make
  make -C doc html pdf
}

package() {
  cd "${srcdir}/msmtp-${pkgver}"
  make DESTDIR="${pkgdir}" install 
  make DESTDIR="${pkgdir}" -C doc install-html install-pdf

# Installing example configs and scripts to /usr/share/doc/msmtp
# as they are not installed by default (Debian and Gentoo do it this way)
  install -d "${pkgdir}/usr/share/doc/msmtp"
  cp -r scripts/{find_alias,msmtp-gnome-tool,msmtpqueue,msmtpq,set_sendmail} "${pkgdir}/usr/share/doc/msmtp/"
  install -D -m644 doc/*.example "${pkgdir}/usr/share/doc/msmtp/"

  install -D -m644 scripts/vim/msmtp.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/msmtp.vim"
}
