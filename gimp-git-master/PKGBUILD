pkgname=gimp-git-master
pkgver=2.7.2
pkgrel=1
arch=('i686' 'x86_64')

pkgdesc="GNU Image Manipulation Program"
license=('GPL')
url="http://www.gimp.org/"
#For changelog: http://gimptest.flamingtext.com:8080/job/gimp-distcheck/changes

depends=('gtk2>=2.10' 'lcms>=1.16' 'libxpm>=3.5.6' 'libwmf>=0.2.8' 'libxmu>=1.0.3' 'librsvg>=2.16.1' 'libmng>=1.0.9' 'desktop-file-utils' 'libexif>=0.6.13' 'libart-lgpl>=2.3.19' 'pygtk>=2.10.4' 'dbus-glib' 'gtk-doc' 'gegl-git-master' 'babl-git-master')
makedepends=('gutenprint>=5.0.0' 'intltool>=0.35.5' 'libgtkhtml>=2.6.3' 'gnome-python>=2.16.2' 'poppler>=0.6' 'pkgconfig>=0.21' 'libgnomeprintui>=2.18' 'alsa-lib>=1.0.0' 'libtool>=1.5' 'autoconf>=2.54' 'automake>=1.9.6' 'libxslt' 'libwebkit' 'pango' 'gettext' 'git' 'ppl')
provides=('gimp')
conflicts=('gimp' 'gimp-devel' 'gimp-git' 'gimp-nightly')

options=('!libtool' '!makeflags')
source=("http://db.tt/K7evfgH")
md5sums=('fee7aae1c1b66d8a235521e5488bdc4a')

build() {
	cd $srcdir/gimp-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc --enable-mp --enable-gimp-console --disable-devel-docs --enable-python --with-gif-compression=lzw --without-aa
	make || return 1
}
package(){
	cd $srcdir/gimp-$pkgver
	make DESTDIR=$pkgdir install-strip || return 1
}
