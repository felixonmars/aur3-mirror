# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=ircd-hybrid-serv
_shortname=hybserv
pkgver=1.9.4
pkgrel=7
arch=("i686" "x86_64")
pkgdesc="Hybserv2 IRC services for ircd-hybrid server"
url="http://www.hybserv.net"
license=("GPL")
depends=("glibc" "ircd-hybrid")
backup=("etc/ircd-hybrid/hybserv/hybserv.conf"
        "etc/ircd-hybrid/hybserv/settings.conf"
        "etc/ircd-hybrid/hybserv/glines.conf"
        "etc/ircd-hybrid/hybserv/jupes.conf"
        "etc/ircd-hybrid/hybserv/logon.news"
        "etc/ircd-hybrid/hybserv/motd.dcc"
        "etc/ircd-hybrid/hybserv/motd.global")
install="${pkgname}.install"
source=("https://github.com/dkorunic/${_shortname}2/archive/REL_1_9_4.tar.gz"
        "configure-path.patch"
        "makefile-fixes.patch"
        "settings-defaults.patch"
        "settings-setpath.patch"
        "${pkgname}.conf"
        "${pkgname}.rc"
        "${pkgname}.service")
md5sums=("bb76bc32dbe80a13dd7d210c03984e19"
         "d87abf82e4b612166646fb920aaeecf0"
         "059afe5e32c59b3ccc2fadedbe5f7ee0"
         "742a7beae58a3a6e5918d7c7235d6159"
         "25b1c8dd9700d79ba28282d154c65f32"
         "95787fbf5edd46bfeb48c893d44a32e1"
         "61a6a1b67c432a1382429b9701ddd984"
         "bfdb1e692f1b6bc6cf34f709e15b4f27")


prepare() {
# Get rid of complicated directory structure
  cd "${srcdir}"
  mv "${_shortname}2-REL_1_9_4" "${_shortname}"


# User compile time patches
  cd "${srcdir}/${_shortname}"
  patch -Np1 -i ${srcdir}/configure-path.patch
  patch -Np1 -i ${srcdir}/makefile-fixes.patch
  patch -Np1 -i ${srcdir}/settings-defaults.patch
  patch -Np1 -i ${srcdir}/settings-setpath.patch
}


build() {
  cd "${srcdir}/${_shortname}"

# User compile time options
  _nicklen=16
  _topiclen=364


# Configure Hybserv
  ./configure \
      --prefix=/usr \
      --with-nicklen=${_nicklen} \
      --with-topiclen=${_topiclen} \
      --bindir=/usr/bin \
      --sysconfdir=/etc/ircd-hybrid \
      --localstatedir=/var/log \
      --mandir=/usr/share/man

# Build Hybserv
  make
}


package () {
  cd "${srcdir}/${_shortname}"

  make DESTDIR="${pkgdir}" install


# Install Hybserv extra binaries
  ln -fs /usr/bin/hybserv ${pkgdir}/usr/bin/showchans
  ln -fs /usr/bin/hybserv ${pkgdir}/usr/bin/shownicks

# Install Hybserv manual pages
  install -D -m 0644 ${srcdir}/${_shortname}/doc/hybserv.8 ${pkgdir}/usr/share/man/man8/hybserv.8
  install -D -m 0644 ${srcdir}/${_shortname}/doc/showchans.8 ${pkgdir}/usr/share/man/man8/showchans.8
  install -D -m 0644 ${srcdir}/${_shortname}/doc/shownicks.8 ${pkgdir}/usr/share/man/man8/shownicks.8

# Install Hybserv configuration
  install -m 0660 ${srcdir}/${pkgname}.conf ${pkgdir}/etc/ircd-hybrid/${_shortname}/${_shortname}.conf
  install -m 0644 ${srcdir}/${_shortname}/bin/logon.news ${pkgdir}/etc/ircd-hybrid/${_shortname}/logon.news
  chmod 0660 ${pkgdir}/etc/ircd-hybrid/${_shortname}/*

# Install Arch Linux init script
  install -D -m 0755 ${srcdir}/${pkgname}.rc ${pkgdir}/etc/rc.d/${pkgname}

# Install systemd service file
  install -D -m 0644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service


# Clean up
# - remove Hybserv obsolete binaries
  rm ${pkgdir}/usr/bin/encrypt* ${pkgdir}/usr/bin/finddupe ${pkgdir}/usr/bin/servchk

# - remove Hybserv Debianized scripts, and redudant tools
  rm ${pkgdir}/usr/bin/cleandb ${pkgdir}/usr/bin/fixalvl ${pkgdir}/usr/bin/mkpasswd

# - remove manual pages from general purpose documentation
  rm ${pkgdir}/usr/share/doc/${pkgname}/*.8

# - remove empty directories provided by other packages
  rmdir --ignore-fail-on-non-empty -p ${pkgdir}/var/log/ircd
}
