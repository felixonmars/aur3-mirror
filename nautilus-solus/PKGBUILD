# Maintainer: Daniel Leining <daniel@the-beach.co>
# these patches were written by Ikey Doherty <ikey@solusos.com>

pkgname=nautilus-solus
_pkgname=nautilus
pkgver=3.4.2
pkgrel=1
pkgdesc="GNOME file manager with SolusOS patches"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libexif' 'gnome-desktop' 'exempi' 'gvfs' 'desktop-file-utils' 'gnome-icon-theme' 'dconf' 'libtracker-sparql' 'libnotify')
makedepends=('intltool' 'gobject-introspection')
url="http://www.gnome.org"
groups=('gnome')
options=('!libtool' '!emptydirs')
provides=('nautilus')
conflicts=('nautilus')
install=nautilus.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz
12_list-view_expand.patch
13_tracker.patch 
restore_create_launcher.patch 
14_remove_symbolic_icons.patch 
restore_gnome2_like_toolbars.patch 
fix_pathbar_naming_of_home.patch 
solus_credits.patch 
unified_toolbar.patch 
better_about_logo.patch 
better_toolbar_layout.patch 
improved_icon_support.patch)

sha256sums=('752afa41189b0b6c73dc3769cd885e184c29d6d394345ec05cd48b0004e0f452'
'b8cb5c20b2de542c54b02584a5f9257d0a38f745027f66a43157a88cd43f5ad7'
'0db16d5ee2bc7ffeb33ac498e9d51983f56831dbc2fceb7cc1ca7c22afd4224c'
'9bcf79e34164ec54f9a14ecad32b646cb6796268318db4805116131653026baa'
'52522bcb9c1fe30c52151dd4035fac2e2b5e7735f8f7ae7a1b51fccc20b1c24d'
'5c6d46c1fc7807801a3e8e042213d5edbcb4d4e639109a689edf5c098e229f93'
'8ff2d453db9ddccaaa9fadfe792e1f24836a5dc633a5a3dd630d514fcca8348b'
'b8ff4c1a586c58b5036a8eba46286c7888ffea7568ee34de31e9469c66cf301f'
'3f7f9fb421be3c7a73733514efc42d0e6783be03a38fb220cf2a9c4f591ea6c3'
'b17d6ce7379722ecd07d939947ec0a41ecd9c1f473d942dd3ae74dad2c65ffb5'
'84a590f0fa662e6d7ef8caf605c2f422a50f2ad791d66774746361978b56b5a7'
'9fac7efac0b839b57c79f3f15dc69b4f573a671a8936ed0c90d3fd5133ac1f2a'
)

build() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i $srcdir/12_list-view_expand.patch
  patch -p1 -i $srcdir/13_tracker.patch
  patch -p1 -i $srcdir/restore_create_launcher.patch
  patch -p1 -i $srcdir/14_remove_symbolic_icons.patch
  patch -p1 -i $srcdir/restore_gnome2_like_toolbars.patch
  patch -p1 -i $srcdir/fix_pathbar_naming_of_home.patch
  patch -p1 -i $srcdir/solus_credits.patch
  patch -p1 -i $srcdir/unified_toolbar.patch
  patch -p1 -i $srcdir/better_about_logo.patch
  patch -p1 -i $srcdir/better_toolbar_layout.patch
  patch -p1 -i $srcdir/improved_icon_support.patch
  
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-nst-extension \
      --disable-update-mimedb \
      --disable-packagekit \
      --disable-schemas-compile
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
