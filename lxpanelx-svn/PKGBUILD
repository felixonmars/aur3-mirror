# Maintainer:Vadim Ushakov < igeekless@gmail.com >
pkgname=lxpanelx-svn
pkgver=668
pkgrel=1
pkgdesc="Lightweight X11 desktop panel, based on lxpanel."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lxpanelx/"
license=('GPL')
depends=('alsa-lib' 'gtk2>=2.12.0' 'lxmenu-data' \
	 'menu-cache')
makedepends=('autoconf' 'automake' 'gcc' 'intltool' 'libtool' \
	     'make' 'pkgconfig' 'subversion')
options=('!libtool')
provides=('lxpanelx')
conflicts=('lxpanelx')
source=('svn+http://lxpanelx.googlecode.com/svn/trunk/')
md5sums=('SKIP')

_svnname='trunk'

#_svntrunk="http://lxpanelx.googlecode.com/svn/trunk/"
#_svnmod="lxpanelx"

pkgver() {
  cd "$SRCDEST/$_svnname"
  svnversion | tr -d [A-z]
}

build() {
  cd ${_svnname}

  msg "Starting make..."
  #####

  # Disable the building of man
  #sed -i -e 's:po man:po:' Makefile.am || return 1
  #sed -i -e 's:man/Makefile::' configure.ac || return 1

  # Generating building system
  #./autogen.sh || return 1

  ./configure --prefix=/usr \
              --libexec=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static \
              --disable-maintainer-mode \
              --enable-silent-rules

  make || return 1
}

package() {
  cd ${_svnname}
  make DESTDIR=${pkgdir} install || return 1
}
