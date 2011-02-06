# Maintainer: Buddy
# Contributor: Buddy

pkgname=vdr-1.7
pkgname_ext=vdr
pkgver=1.7.14
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The video disk recorder (VDR) - 1.7.x development release"
url="http://www.tvdr.de/"
license=('GPL2')
depends=('fontconfig' 'gettext' 'libjpeg' 'perl' 'runvdr-extreme')
optdepends=('lirc: To use a remote control'
            'runvdr-extreme: An alternative runvdr script'
            'vdrsymbols-ttf: Symbols that some VDR plugins and patches use')
backup=('etc/vdr/channels.conf'
        'etc/vdr/diseqc.conf'
        'etc/vdr/keymacros.conf'
        'etc/vdr/sources.conf'
        'etc/vdr/svdrphosts.conf')
options=(!emptydirs)
install=${pkgname_ext}.install
source=(ftp://ftp.tvdr.de/vdr/Developer/${pkgname_ext}-${pkgver}.tar.bz2
        Make.config
        vdr-shutdown.sh)

md5sums=('2901bba014fb34ba5c92767f8f12af50'
	 'e1b132e62353788e10b2ab482e8f3523'
	 '6426eac608143bacbf7233c15af86193')

build() {
  cd ${srcdir}/${pkgname_ext}-${pkgver}

  # Update lirc socket location in man page
  sed -i "s|/dev/lircd|/var/run/lirc/lircd|g" vdr.1 || return 1

  # VDR directory environment (Make.config):
  # MANDIR       = /usr/share/man
  # BINDIR       = /usr/bin
  # LOCDIR       = /usr/share/locale
  # PLUGINLIBDIR = /usr/lib/vdr
  # VIDEODIR     = /var/spool/video
  # CONFDIR      = /etc/vdr
  # Also:
  # VDR_USER = vdr

  install -d -m755 ${pkgdir}/etc/rc.d/ || return 1
  install -d -m755 ${pkgdir}/usr/bin/ || return 1
  install -d -m755 ${pkgdir}/usr/include/vdr/include || return 1
  install -d -m755 ${pkgdir}/usr/include/vdr/libsi || return 1
  install -d -m755 ${pkgdir}/usr/share/doc/${pkgname_ext} || return 1

  cp ${startdir}/Make.config Make.config || return 1


  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Install Make.config and vdr header files
  install -m644 Make.config ${pkgdir}/usr/include/vdr || return 1
  install -m644 *.h ${pkgdir}/usr/include/vdr || return 1
  install -m644 libsi/*.h ${pkgdir}/usr/include/vdr/libsi || return 1
  ln -sf .. ${pkgdir}/usr/include/vdr/include/vdr || return 1
  ln -sf ../libsi ${pkgdir}/usr/include/vdr/include/libsi || return 1

  # Install shutdown script
  install -m755 ${startdir}/vdr-shutdown.sh ${pkgdir}/usr/bin/vdr-shutdown.sh || return 1

  # Install documents
  for _document in channels.conf* *.template CONTRIBUTORS HISTORY INSTALL MANUAL PLUGINS.html README* UPDATE*; do
    install -m644 ${_document} ${pkgdir}/usr/share/doc/${pkgname_ext} || return 1
  done
}

