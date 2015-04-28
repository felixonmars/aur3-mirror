# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Andrew Crerar <asc9003 [at] rit [dot] edu>
# Contributor: RKA KriK <rka_krik@mail.ru>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: hbdee <hbdee.arch@gmail.com>

pkgname=gtk3-git-ubuntu
_gitname=gtk+
pkgver=3.15.12.307.g05ecd3f
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (git version with Ubuntu patches from bzr)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('gtk-update-icon-cache' 'shared-mime-info'
         'atk' 'at-spi2-atk' 'cairo' 'colord' 'fontconfig' 
         'gdk-pixbuf2' 'json-glib' 'pango' 'rest'
          {glib2,gobject-introspection,wayland}-git 
          lib{cups,xcursor,xinerama,xrandr,xi,xcomposite,xdamage,xkbcommon})
makedepends=('gobject-introspection' 'bzr')
provides=({gtk3{,-git}{,-ubuntu},gtk-update-icon-cache{,-git}}="${pkgver}")
conflicts=('gtk3' 'gtk-update-icon-cache')
backup=('etc/gtk-3.0/settings.ini')
options=('!libtool')
install=gtk3-git.install
source=('bzr+lp:~ubuntu-desktop/gtk/ubuntugtk3'
        'git://git.gnome.org/gtk+'
        'repatch-071_fix-installation-of-HTML-images.patch'
        'repatch-ubuntu_gtk_custom_menu_items.patch'
        'settings.ini')
sha512sums=('SKIP'
            'SKIP'
            'c3dec88bc1fe45b279539087fc6d8509ecc46e5c61afbd2e4e7c91326929604f085c1f24e986059fbb905906fbbb1c04eaccbebe67ab8e67509f4d5bd386e71f'
            '869b59277849efc0556d3af37d7914f404e14b24c53d1da3f6b3eba62dd71b742857ca0d796edcf7f4cea257de0587c9a38a395c9933cc789ccb2501012b9347'
            '3ee323c287ad4354d5521f584d06149bbe6bb3c6ed4f409e7544c9ac59892a89d7b52e4b7807e6ed7e3a3e064372dc61422153153f67acb97cc371fe1d8200f2')

pkgver() {
  cd "${_gitname}"
  git describe --always | sed 's/-/./g'
}

prepare() {

  cd "$srcdir/ubuntugtk3/debian/patches/"

  while read i; do
    if [[ "${i}" =~ ^# || -z "${i}" || "${i}" == *git* ]]; then
      continue # Skip comments, newlines, and git patches
    #Apply available repatches
    elif [ -f "../../../repatch-${i}" ]; then
        msg "Updating ${i} ..." 
        patch -Ns < "../../../repatch-${i}"
    fi
  done < series

  cd "$srcdir/gtk+"

  #Apply Ubuntu patches
  while read i; do
    if [[ "${i}" =~ ^# || -z "${i}" || "${i}" == *git* ]]; then
      continue # Skip comments, newlines, and git patches
    elif [[ "${i}" == 0001-gtkprogressbar-fix-size-allocation.patch ]] || \
         [[ "${i}" == 0001-Add-style-classes-to-the-title-buttons.patch ]] || \
         [[ "${i}" == 044_tracker_fts.patch ]] || \
         [[ "${i}" == mir-backend.patch ]] || \
         [[ "${i}" == mir-backend-unmerged.patch ]] || \
         [[ "${i}" == 0001-GtkApplication-Prevent-more-crashes-around-shutdown.patch ]]; then
      continue # Skip reduntant or impossible to repair patches
    else
      msg "Applying ${i} ..."
      patch -Nsp1 < "${srcdir}/ubuntugtk3/debian/patches/${i}"
    fi
  done < "${srcdir}/ubuntugtk3/debian/patches/series"

}

build() {

  cd "${_gitname}"

  ./autogen.sh --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --disable-schemas-compile \
                --enable-{x11,broadway,wayland}-backend

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/settings.ini" "${pkgdir}/etc/gtk-3.0/settings.ini"
}

