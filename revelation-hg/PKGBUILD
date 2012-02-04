# Contributor: Spider.007 / Sjon <archlinux.org@spider007.net>

pkgname=revelation-hg
pkgver=556
pkgrel=2
pkgdesc="Password manager for the GNOME 2 desktop"
arch=(i686 x86_64)
license=('GPL')
makedepends=('mercurial' 'intltool')
conflicts=('revelation')
depends=('gnome-python-desktop>=2.28.0' 'pycrypto>=2.0.1-3' 'gnome-panel>=2.28.0' 'cracklib' 'desktop-file-utils' 'hicolor-icon-theme' 'python2' ' dbus-python')
install=revelation.install
url="http://oss.codepoet.no/revelation/"

_hgroot="https://bitbucket.org/erikg"
_hgrepo=revelation

build() {
  if `pacman -Qi packer &>/dev/null`
  then
    echo Cannot build when packer is installed, please uninstall and re-install afterwards
	exit 3
  fi

  cp -R $srcdir/$_hgrepo $startdir/src/$_hgrepo-build
  cd $startdir/src/$_hgrepo-build

  ./autogen.sh
  sed -i -e 's/gnome-python-extras/gnome-python-desktop/g' configure

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/revelation \
      --localstatedir=/var \
      --disable-mime-update --disable-desktop-update \
      --with-python-include=/usr/include/python2.7
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    $pkgdir/usr/bin/revelation \
    $pkgdir/usr/lib/python2.7/site-packages/revelation/bundle/PBKDFv2.py

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain revelation ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
