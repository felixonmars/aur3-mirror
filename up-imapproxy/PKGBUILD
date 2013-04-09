# Maintainer: dreieck
# Contributor: Roberto Alsina

pkgname=up-imapproxy
pkgver=1.2.7
pkgrel=1
pkgdesc="An IMAP proxy server"
url="http://www.imapproxy.org/"
license=("GPL")
depends=('tcp_wrappers' 'openssl')
makedepends=('openssl')
provides=("imapproxy=${pkgver}" "squirrelmail-imap_proxy=${pkgver}")
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')

source=("http://sourceforge.net/projects/squirrelmail/files/imap_proxy/${pkgver}/squirrelmail-imap_proxy-${pkgver}.tar.bz2" imapproxy.init imapproxy.runit)

md5sums=('c46524414a2375310557686e723bd120'
         '6e09a7f86728e51aa5c16c039d202525'
         '44a49061a1702047c71c36d646103180')

sha1sums=('58fed946eb61b9a42ac7d9f16abe10278268d3ee'
          'a6be83fd5d1cac93f2c2fd80bc0d82166ab5e451'
          '34fcb0a63369e09899a595148a0810125b53ac91')

_extractdir="${srcdir}/squirrelmail-imap_proxy-${pkgver}"


build() {
  cd "${_extractdir}"
  
  ./configure --prefix="${pkgdir}" --with-openssl
  make || return 1
}

package() {
  cd "${_extractdir}"
  make rpm_prefix="${pkgdir}" install || return 1
  
  install -d "${pkgdir}/etc/rc.d"
  install -m 0644 scripts/imapproxy.conf "${pkgdir}/etc"
  install -m 0755 ../imapproxy.init "${pkgdir}/etc/rc.d/imapproxy"

  
  chown root.root "${pkgdir}/sbin"/*
  install -d "${pkgdir}/etc/sv/imapproxy"
  install -m0755 ../imapproxy.runit "${pkgdir}/etc/sv/imapproxy/run"
  
}

