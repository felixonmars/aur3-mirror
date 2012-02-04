# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# based on a PKGBUILD of Mathias Nedrebø <mathias <at> nedrebo.org>

pkgname=emacs-tabs
pkgver=99651
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Emacs with xft and tabs support, bazaar-version from the gtk-tabs branch"
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('gconf' 'alsa-lib' 'librsvg' 'gpm' 'giflib' 'm17n-lib-cvs' 'hicolor-icon-theme')
makedepends=('bzr' 'texinfo')
options=('docs' '!emptydirs')
provides=('emacs')
conflicts=('emacs')
install=emacs.install
backup=('usr/share/applications/emacs.desktop' 'usr/share/emacs/site-lisp/subdirs.el')
source=()
md5sums=()
_bzrtrunk=http://bzr.savannah.gnu.org/r/emacs/gtk-tabs
_bzrmod=gtk-tabs

build() {
  if [[ -d $_bzrmod/.bzr ]]; then
    (cd $_bzrmod && bzr update -v && cd ..)
    msg "Local checkout updated or server timeout"
  else
    bzr co --lightweight -v $_bzrtrunk $_bzrmod
    msg "Checkout done or server timeout"
  fi
  
  msg "checkout done"
  msg "starting build ..."

  [ -d $srcdir/${_bzrmod}-build ] && rm -rf $srcdir/${_bzrmod}-build
  cp -r $srcdir/${_bzrmod} $srcdir/${_bzrmod}-build

  # Build
  cd $srcdir/${_bzrmod}-build 

  # gcc 4.5 Workaround: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43904
  CFLAGS="${CFLAGS} -fno-optimize-sibling-calls" \
    ./configure --prefix=/usr --with-xft --with-xpm --with-jpeg \
    --with-tiff --libexecdir=/usr/lib --localstatedir=/var \
    --with-gif --with-png --with-x-toolkit=gtk --with-sound \
    --with-libotf
  make bootstrap
}

package() {
  cd $srcdir/${_bzrmod}-build 
  make prefix=$pkgdir/usr libexecdir=$pkgdir/usr/lib \
    localstatedir=$pkgdir/var/lib install
  chown -R root:root $pkgdir/usr
  for _i in 16x16 24x24 32x32 48x48 128x128
  do
    mv $pkgdir/usr/share/icons/hicolor/${_i}/apps/emacs.png \
      $pkgdir/usr/share/icons/hicolor/${_i}/apps/$pkgname.png
  done
  mv $pkgdir/usr/share/icons/hicolor/scalable/apps/emacs.svg \
    $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
  mv $pkgdir/usr/share/icons/hicolor/scalable/mimetypes/emacs-document.svg \
    $pkgdir/usr/share/icons/hicolor/scalable/mimetypes/$pkgname-document.svg
}
