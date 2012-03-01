# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>

pkgname=ntp-dev
pkgver=4.2.7.p262
_realver=4.2.7p262
pkgrel=1
pkgdesc="Network Time Protocol reference implementation"
arch=("i686" "x86_64")
url="http://www.ntp.org/"
license=("custom")
depends=("openssl" "readline" "libcap" "avahi" "libedit" "net-snmp" "libevent")
makedepends=("perl-html-parser")
provides=("${pkgname%-dev}")
conflicts=("${pkgname%-dev}" "openntpd")
backup=("etc/ntp.conf" "etc/conf.d/ntpd.conf")
options=()
install=install
source=("http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/${pkgname}/${pkgname}-${_realver}.tar.gz"
        "ntpd"
        "ntpdate"
        "ntp.conf"
        "ntpd.conf"
        "logrotate.d"
        "install"
        "html2man.patch")
sha1sums=("fae615581c1d52dd92f0df4ce5b94d1fc881324e"
          "a945853d32b9e9cc17faa71f213baeb02afb9471"
          "4c2085980eff78aca5e144805808804d1ff93ff2"
          "5705e5cb5de4823f3a79ff3c7cc8adaa4e740e81"
          "0ce45cf7572c56408db8fdb4b477bf30ca711ee6"
          "4f76f7f9ffc8315ff9924f793f272d4f6939b816"
          "16f1741f8f2f319a52f7ab66d41c81d2b93e8fb8"
          "33b345aaab1e6e149fa05151a606de918c62906e")


build() {
  cd "${srcdir}/${pkgname}-${_realver}"

  patch -p1 -i "${srcdir}/html2man.patch"

  ./configure \
    --prefix=/usr \
    --without-rpath \
    --enable-linux-caps \

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_realver}"

  make DESTDIR="${pkgdir}" install

  rmdir "${pkgdir}"/usr/{lib,libexec,sbin}
  install -d -o 87 -g 87 "${pkgdir}"/var/lib/ntp
  install -Dm755 ../ntpd "${pkgdir}"/etc/rc.d/ntpd
  install -Dm755 ../ntpdate "${pkgdir}"/etc/rc.d/ntpdate
  install -Dm644 ../ntp.conf "${pkgdir}"/etc/ntp.conf
  install -Dm644 ../ntpd.conf "${pkgdir}"/etc/conf.d/ntpd.conf
  install -Dm644 ../logrotate.d "${pkgdir}"/etc/logrotate.d/ntpd
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname%-dev}/LICENSE"

  # manual pages are now automatically created and installed by autogen/make
  # however the transition from html2man is incomplete so not all man pages are yet built
  # in the meantime the files created by each build system conflict with each other
  #cd html
  #../scripts/html2man
  #install -d "${pkgdir}"/usr/share/man
  #mv man/man* "${pkgdir}"/usr/share/man
  rmdir "${pkgdir}"/usr/share/man/man8
}

# vim:set ts=2 sw=2 et:
