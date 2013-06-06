# Maintainer: Benjamin Bukowski <benjamin.bukowski@gmail.com>
# Contributor: Johannes Löthberg <demizide@gmail.com>

pkgname=atftp
_pkgver=0.7
_patchver=11
pkgver=${_pkgver}.${_patchver}
pkgrel=2
pkgdesc="a client/server implementation of the TFTP protocol that implements RFCs 1350, 2090, 2347, 2348, and 2349"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/atftp/"
license=('GPL')
depends=('pcre' 'readline')
conflicts=('netkit-tftp')
replaces=('netkit-tftp')
backup=("etc/conf.d/atftpd")
source=("http://ftp.debian.org/debian/pool/main/a/atftp/atftp_${_pkgver}.dfsg.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/a/atftp/atftp_${_pkgver}.dfsg-${_patchver}.diff.gz"
        "atftpd.service" "atftpd.conf")
md5sums=('aa269044a6f992eca78fee2f6119643c'
         '1636f199bf32c754a7bf34a5c647d138'
         '668ba8066f665adc2ed938c088e1ed17'
         '28efb8468be3f4891b0ad5e5d67bc443')

build() {
  cd ${srcdir}/${pkgname}-${_pkgver}.dfsg
 
  patch -p1 -i "${srcdir}/${pkgname}_${_pkgver}.dfsg-${_patchver}.diff"

  ./configure --prefix=/usr --mandir=/usr/share/man --sbindir=/usr/bin \
              --enable-libreadline --disable-libwrap
  make
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}.dfsg
  make DESTDIR=${pkgdir} install

  install -Dm755 ${srcdir}/atftpd.service ${pkgdir}/usr/lib/systemd/system/atftpd.service
  install -Dm644 ${srcdir}/atftpd.conf ${pkgdir}/etc/conf.d/atftpd
  install -dm775 --group=nobody ${pkgdir}/var/tftpboot 

  # remove in.tftpd link as it conflicts with extra/tftp-hpa
  rm "${pkgdir}/usr/share/man/man8/in.tftpd.8"
  rm "${pkgdir}/usr/bin/in.tftpd"
}
