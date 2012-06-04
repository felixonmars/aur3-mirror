# Maintainer: kozec <kozec-at-kozec-dot-com>
# Based on gimp-git package

pkgname=noxcf-gimp-git
pkgver=20120604
pkgrel=1
pkgdesc="an image editor, not an XCF editor"
arch=('i686' 'x86_64')
url="https://github.com/mskala/noxcf-gimp"
license=('GPL')
depends=('gtk2>=2.24' 'lcms>=1.16' 'libxpm>=3.5.6' 'libwmf>=0.2.8' \
         'libxmu>=1.0.3' 'librsvg>=2.16.1' 'libmng>=1.0.9' 'desktop-file-utils' \
	 'libexif>=0.6.13' 'libart-lgpl>=2.3.19' 'pygtk>=2.10.4' 'dbus-glib' 'gtk-doc' 'gegl' 'babl-git')
makedepends=('gutenprint>=5.0.0' 'intltool>=0.35.5' 'libgtkhtml>=2.6.3' \
	     'gnome-python>=2.16.2' 'poppler>=0.6' 'pkgconfig>=0.21' \
	     'libgnomeprintui>=2.18' 'alsa-lib>=1.0.0' 'libtool>=1.5' 'autoconf>=2.54' 'automake>=1.9.6' 'libxslt' 'libwebkit' 
'pango' 'gettext' 'git')
options=('!libtool' '!makeflags')
provides=('gimp')
conflicts=('gimp' 'gimp-devel')

source=('noxcf-gimp-git.install' 'linux.gpl')
install='noxcf-gimp-git.install'

_gitroot="https://github.com/mskala/noxcf-gimp.git"
_gitname="noxcf-gimp"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

export PYTHON="/usr/bin/python2"
	
	./autogen.sh --prefix=/usr --sysconfdir=/etc \
	  --enable-mp --enable-gimp-console --disable-devel-docs \
	  --enable-python --with-gif-compression=lzw \
	  --without-aa
	make || return 1

}

package() {
	cd "$srcdir/$_gitname-build"
	
	make DESTDIR=${pkgdir} install-strip || return 1
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgdir}"/usr/lib/gimp/2.0/plug-ins/*.py

	install -Dm644 ${srcdir}/linux.gpl \
		${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl
} 

md5sums=('c49a84c5333fbe0b49b49911a3da9d20'
         'bb27bc214261d36484093e857f015f38')
