# Contributor irgal <irgal@fird.net>

pkgname=mlterm-256color
_realname=mlterm
pkgver=2.9.4
pkgrel=2
pkgdesc="Multilingual terminal emulator with 256 color support"
arch=(i686 x86_64)
license=('GPL2')
depends=('fribidi' 'gtk2' 'libsm')
makedepends=('intltool' 'librsvg' 'ncurses' 'm17n-lib' 'scim')
provides=('mlterm')
conflicts=('mlterm')
options=(!libtool)
url="http://mlterm.sourceforge.net/"
source=("http://downloads.sourceforge.net/project/$_realname/01 release/$_realname-$pkgver/$_realname-$pkgver.tar.gz"
        ${_realname}.desktop
        http://shinh.skr.jp/dat_dir/mlterm-${pkgver}_256.patch
        ${_realname}-${pkgver}_trans.patch)
md5sums=('67fc33f09da045f86b0d4ceebed76aac'
         '91f72887c0c58ba58e806bb8cc753d56'
         'a61fd61b2dc5109e1a1232d0a8d450c6'
         '8adbaad54316ac8f8ccc9363e8c3ccf6')

build() {
  cd $srcdir/$_realname-$pkgver

  msg "256 color support patch"
  patch -p1 < $srcdir/mlterm-${pkgver}_256.patch || return 1

  msg "transparent patch (background goes tiled when resize window with transparent on)"
  patch -p0 < $srcdir/${_realname}-${pkgver}_trans.patch || return 1

  # build
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/mlterm --sysconfdir=/etc --mandir=/usr/share/man \
    --enable-fribidi --enable-optimize-redrawing --enable-utmp \
    --enable-scim --enable-m17nlib --disable-static \
    --with-tools=mlconfig,mlterm-zoom,mlterm-menu,mlclient \
    --with-imagelib=gdk-pixbuf --with-type-engines=xcore,xft
  make || return 1
  make DESTDIR=${pkgdir} install
  echo 'conf_menu_path_2 = mlterm-zoom' >> ${pkgdir}/etc/mlterm/main
 # install some freedesktop.org compatibility
  install -D -m644 ${srcdir}/${_realname}.desktop \
   ${pkgdir}/usr/share/applications/${_realname}.desktop
  sed -e 's:mlterm:mlclient:' \
   < ${pkgdir}/usr/share/applications/${_realname}.desktop \
   > ${pkgdir}/usr/share/applications/mlclient.desktop
  install -D -m644 contrib/icon/${_realname}-icon.svg \
   ${pkgdir}/usr/share/pixmaps/${_realname}.svg
  install -D -m644 contrib/icon/${_realname}-icon-trans.svg \
   ${pkgdir}/usr/share/pixmaps/mlclient.svg
 # finally we render a png as fallback for not svg aware menu applications
  # Attention: always make sure you check the dimensions of the source-svg,
  # you can read the dimensions via inkscapes export funktion
  cd ${pkgdir}/usr/share/pixmaps
  rsvg -w 48 -h 38 -f png mlterm.svg mlterm.png
  rsvg -w 48 -h 38 -f png mlclient.svg mlclient.png
}
