# -*- shell-script -*-
# 
# Contributor: Adrian C. <anrxc sysphere.org>


pkgname=gajim-otr-hg
pkgver=11148
pkgrel=2
pkgdesc="Jabber instant messenger with OTR encryption support"
arch=("i686" "x86_64")
url="http://www.gajim.org/"
license=("GPL3")
depends=("python2" "pygtk" "python-pysqlite" "python-otr")
makedepends=("mercurial" "gettext" "intltool" "perlxml" "dbus")
optdepends=("gnupg: chat encryption using GnuPG"
            "pycrypto: end-to-end encryption support"
            "python2-pyopenssl: SSL/TLS verification of server certificates"
            "dbus-python: notification support with notification-daemon"
            "libxss: automatic status support"
            "gtkspell: spell checker support"
            "avahi: local clients autodetection"
            "dnsutils: SRV records support")
provides=("gajim")
conflicts=("gajim" "gajim-svn" "gajim-hg" "gajim-otr-bzr")
options=(!libtool)

_root="http://hg.gajim.org"
_repo="gajim"
_branch="otr"


build() {
  cd "${srcdir}"

# Source code checkout
  if [ -d "${_repo}-${_branch}" ]; then
      cd "${_repo}-${_branch}"
      make clean || echo "No rule is not fatal. Continuing."
      make distclean || echo "No rule is not fatal. Continuing."
      hg pull -b "${_branch}"
      msg "The local repository was updated."
  else
      hg clone -b "${_branch}" "${_root}/${_repo}" "${_repo}-${_branch}"
      msg "The remote repository was cloned."
      cd "${_repo}-${_branch}"
  fi

# Python v2 compatibility
  sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/env python2_' "${srcdir}/${_repo}-${_branch}/src/ipython_view.py"
  sed -i 's_^#!.*/usr/bin/env.*python$_#!/usr/bin/env python2_' "${srcdir}/${_repo}-${_branch}/src/otr_windows.py"

# Source code build
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr --enable-site-packages
  make
  make DESTDIR="${pkgdir}" install

# Object files cleanup
  find "${pkgdir}/usr/lib/python2.7/site-packages/gajim/" -name "*.pyo" | xargs rm -f
}
