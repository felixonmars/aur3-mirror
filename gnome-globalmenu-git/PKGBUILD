# Maintainer: Felix Bier <flx.bier@googlemail.com>

pkgname=gnome-globalmenu-git
pkgver=20111021
pkgrel=1
pkgdesc="OSX/Unity-style global menu for GTK applications in the GNOME Shell"
arch=('i686' 'x86_64')
url=http://code.google.com/p/gnome2-globalmenu/
license=('GPL2')
depends=('gnome-shell')
makedepends=('git' 'intltool' 'vala')
conflicts=('gnome-globalmenu')
provides=('gnome-globalmenu')
install="$pkgname.install"

_gitroot="git://github.com/gnome-globalmenu/gnome-globalmenu.git"
_gitname="gnome-globalmenu"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server"

  if [[ -d $_gitname ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname" && git checkout gnome-3
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  autoreconf \
  --force \
  --install \
  --verbose

  ./autogen.sh \
  --prefix=/usr \
  --sysconfdir=/etc \
  --libexecdir=/usr/lib

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make \
  DESTDIR=${pkgdir} \
  GTK2_MODULES_DIR=/usr/lib/gtk-2.0/modules \
  GTK3_MODULES_DIR=/usr/lib/gtk-3.0/modules \
  GLIB_COMPILE_SCHEMAS=/bin/true \
  install

  install -m755 -d "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/$_gitname-build/globalmenu.sh" "${pkgdir}/etc/profile.d/"

  ln -sfv libglobalmenu-gtk2.so "${pkgdir}/usr/lib/gtk-2.0/modules/libglobalmenu-gtk.so"

  # Adjust gnome-shell version number for extra breakage
  SHELLVERSION=$(gnome-shell --version | cut -d ' ' -f 3)

  sed -i s/version\":\ \\[\"[0-9].[0-9].[0-9]/version\":\ [\"$SHELLVERSION/ \
  ${pkgdir}/usr/share/gnome-shell/extensions/GlobalMenu@globalmenu.org/metadata.json
}

