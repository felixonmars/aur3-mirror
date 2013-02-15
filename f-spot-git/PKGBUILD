# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>

pkgname=f-spot-git
pkgver=20130215
pkgrel=1
pkgdesc="A personal photo management program for GNOME - Development version"
url="http://www.gnome.org/projects/f-spot/"
license="GPL"
depends=('mono-addins' 'gnome-sharp' 'ndesk-dbus-glib' 'lcms' 'gnome-keyring-sharp' 'flickrnet' 'libgphoto2' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'libunique' 'gnome-desktop2')
makedepends=('git' 'intltool' 'gettext' 'gnome-common' 'gnome-doc-utils' taglib-sharp  gtk-sharp-beans)
arch=('i686' 'x86_64')
provides=('f-spot')
conflicts=('f-spot')
options=('!libtool')
install=f-spot-git.install

_gitroot="git://git.gnome.org/f-spot"
_gitname="f-spot"

build() {
  export MONO_SHARED_DIR="${srcdir}"/.wabi
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  # https://bugzilla.gnome.org/show_bug.cgi?id=693891
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
  # https://bugzilla.gnome.org/show_bug.cgi?id=693892
  sed -i 's#$(libdir)/f-spot#$(DESTDIR)$(libdir)/f-spot#' Makefile.am
  
  #
  # BUILD
  #
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-scrollkeeper --disable-schemas-install \
              --enable-release --with-vendor-build-id=ArchLinux
  make
}

package() {
  cd "$srcdir"/$_gitname-build
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}"/usr/share/gconf/schemas
  gconf-merge-schema "${pkgdir}"/usr/share/gconf/schemas/${pkgname}.schemas \
            --domain f-spot "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}
