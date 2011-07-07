# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Former maintainers: Moritz Wilhelmy <crap@wzff.de>, Nick Campbell <s0ma AT theangryfist DOT net>
pkgname=spectrum-git
pkgver=20110707
pkgrel=1
pkgdesc="XMPP libpurple transport/gateway."
arch=('i686' 'x86_64')
url="http://spectrum.im"
license=('GPL')
depends=('gloox' 'libev' 'libpurple' 'poco' 'python2')
makedepends=('git' 'cmake')
optdepends=('mysql: MySQL database backend support'
            'postgresql-libs: PostgreSQL database backend support'
            'sqlite3: SQLite database backend support'
            'libpurple-minimal: lightweight build of libpurple (no gstreamer or X11...)'
            'imagemagick: support for avatars synchronization with legacy networks'

            # Protocols plugins
            'mbpurple-svn: microblogging services support (like Twitter or identi.ca/StatusNet)'
            'msn-pecan: a different implementation of the MSN protocol for libpurple'
            'pidgin-facebookchat: Facebook support, with more features than Facebook XMPP server'
            'pidgin-sipe: SIPE protocol support'
)
backup=('etc/conf.d/spectrum')
source=('logrotate.spectrum')
md5sums=('4f9cbfe3878fe5f4137d1bb5acc9e850')

install='spectrum.install'

_gitroot="git://github.com/hanzz/spectrum.git"
_gitname="spectrum"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make

  cd spectrumctl
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_gitname}-build"

  # Various needed folders -- correct permissions are set in spectrum.install
  install -d "${pkgdir}/etc/spectrum"
  install -d "${pkgdir}/var/log/spectrum"
  install -d "${pkgdir}/var/run/spectrum"
  install -d "${pkgdir}/var/lib/spectrum"

  # Install binaries and Python control script
  make DESTDIR="${pkgdir}" install

  cd spectrumctl
  python2 setup.py install --root="${pkgdir}"

  # Install initscript and logrotate config
  install -Dm755 "${srcdir}/${_gitname}-build/initscripts/archlinux/spectrum-rc.d"   "${pkgdir}/etc/rc.d/spectrum"
  install -Dm644 "${srcdir}/${_gitname}-build/initscripts/archlinux/spectrum-conf.d" "${pkgdir}/etc/conf.d/spectrum"
  install -Dm644 "${srcdir}/logrotate.spectrum"                                      "${pkgdir}/etc/logrotate.d/spectrum"

  # Patch to use python2
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" "${pkgdir}/usr/bin/spectrumctl"
}
