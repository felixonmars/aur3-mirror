# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Luigi Ranghetti <ggranga@gmail.com>

pkgbase=gtk3
pkgname=gtk3-ubuntu-git
_realver=3.7.7
pkgver=20130202
pkgrel=1
pkgdesc="GTK+ is a multi-platform toolkit (v3) with Ubuntu's modifications"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
install=$pkgbase.install
depends=('glib2-git' 'atk-git' 'cairo-git' 'gtk-update-icon-cache' 'libcups'
  'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
  'pango-git' 'shared-mime-info' 'colord' 'at-spi2-atk-git' 'libxkbcommon-git'
  'gdk-pixbuf2-git')
makedepends=('gobject-introspection')
provides=("$pkgbase=$_realver" "gtk3-ubuntu=$_realver" "gtk3-git=$pkgver")
conflicts=("$pkgbase")
options=('!libtool' '!docs')
backup=(etc/gtk-3.0/settings.ini)
license=('LGPL')
source=(settings.ini
        016_no_offscreen_widgets_grabbing.patch
        017_no_offscreen_device_grabbing.patch
        043_ubuntu_menu_proxy.patch
        062_ubuntu-set-grab-add.patch
        075_expose_gdkwidget_for_gtkrange.patch
        wacom.patch
        0001-do-not-apply-consumed_modifier-on-entry-modifiers.patch)
sha256sums=('c214d3dcdcadda3d642112287524ab3e526ad592b70895c9f3e3733c23701621'
            'c4a43b254b9719ac026fa6a92366bdc1d32e42fa79461ff8aaa206933b9f9c7e'
            'cb8f4eb9d10c6d8645d23812aaa7d64c14560476f19f8c779d10a546748de684'
            '69022d42a1bf683b688c8a1963fcfe59311bd697ddd74adae6e146fb3c06ffc1'
            '5a89bd63afb2d97b98eb3b7acb5a568c388aedd94af38a1106233ce033982354'
            '9ee240b355502d6ba449983f794205e6e5401c8acca2a3ce513df7f0502dc988'
            'fe92039b87651b8925f5adb2d8a3685d1a3bd5caf8c34243a0408b79f007b18b'
            'df92185aab973865a4b5389222e769aa21a2e13194e83873b272d4f57c785fcf')

_gitname="gtk+"

_gitroot="git://git.gnome.org/gtk+"
_gitbranch="master"

build() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    msg "Fetching branch $_gitbranch from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitbranch:$_gitbranch"
    msg "Checking out branch $_gitbranch..."
    git checkout "$_gitbranch"
    git reset --hard "$_gitbranch"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitbranch from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitbranch" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"

  msg "Don't let offscreen widget do grabbing (fix for ido)"
  patch -Np1 -i "$srcdir/016_no_offscreen_widgets_grabbing.patch"

  msg "Do not allow widgets in an offscreen hierarchy to take grabs (fix for ido)"
  patch -Np1 -i "$srcdir/017_no_offscreen_device_grabbing.patch"

  msg "Add Ubuntu menuproxy module (required for appmenu-gtk)"
  patch -Np1 -i "$srcdir/043_ubuntu_menu_proxy.patch"

  msg "Add ubuntu-set-grab-add signal (required for ido)"
  patch -Np1 -i "$srcdir/062_ubuntu-set-grab-add.patch"

  msg "Add gtk_range_get_event_window to get the event_window for a GtkRange (fix for ido)"
  patch -Np1 -i "$srcdir/075_expose_gdkwidget_for_gtkrange.patch"

  # Add support for the ayatana overlay scrollbars (required for overlay-scrollbar)
  # patch -Np1 -i "$srcdir/100_overlay_scrollbar_loading.patch"

  msg "Partially revert BGO#673440 in order to fix BGO#674157"
  patch -Np1 -i ../wacom.patch

  patch -Np1 -i \
    "$srcdir/0001-do-not-apply-consumed_modifier-on-entry-modifiers.patch"

  msg "autogen"
  CXX=/bin/false ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk2-dependency \
    --disable-schemas-compile \
    --enable-x11-backend --enable-wayland-backend
  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/settings.ini" "${pkgdir}/etc/gtk-3.0/settings.ini"
}
