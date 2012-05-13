# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: evr <evanroman at gmail>
# Contributor: Jorge Mokross <mokross@gmail.com>

pkgname=gnome-mplayer-svn
pkgver=2250
pkgrel=1
pkgdesc='A simple MPlayer GUI, development code.'
arch=('i686' 'x86_64')
url='http://gnome-mplayer.googlecode.com/'
license=('GPL')
depends=('dbus-glib' 'dconf' 'gmtk-svn' 'hicolor-icon-theme' 'libnotify'
         'mplayer')
# The package in [community] has gnome-power-manager & nautilus as makedepends
# too, but since packages from AUR are supposed to target the current system
# those deps were not included:
makedepends=('subversion')
install="$pkgname.install"
conflicts=('gnome-mplayer' 'gnome-mplayer-cvs')
provides=('gnome-mplayer')

_svntrunk=http://gnome-mplayer.googlecode.com/svn/trunk
_svnmod=gnome-mplayer

build() {
  cd "$srcdir"

  msg2 "Checking out the repository..."
  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi


  msg2 "SVN checkout done or server timeout."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  msg2 "Configuring..."
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --enable-gtk3 # Remove this option to link against gtk2.
  msg2 "Building..."
  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir/" install

  sed -i 's@Exec=gnome-mplayer %U@Exec=gnome-mplayer %F@' \
    "$pkgdir/usr/share/applications/gnome-mplayer.desktop"
}

# vim: set ft=sh ts=2 sw=2 et:
