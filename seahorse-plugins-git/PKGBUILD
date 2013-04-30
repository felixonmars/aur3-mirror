# Maintainer: György Balló <ballogy@freestart.hu>

_pkgname=seahorse-plugins
pkgname=$_pkgname-git
pkgver=2.30.1.151.g7956b60
pkgrel=1
pkgdesc="Plugins and extensions to third party software to provide encryption capability"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Seahorse/Plugins"
license=('GPL')
depends=('gconf' 'libcryptui' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'gnome-common' 'intltool' 'gnome-doc-utils')
options=('!emptydirs' '!libtool')
install=$_pkgname.install
source=('git://git.gnome.org/seahorse-plugins')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|SEAHORSE_PLUGINS_||' -e 's|_|.|g'
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               --disable-static --disable-schemas-install --disable-scrollkeeper \
               --disable-update-mime-database --disable-applet --disable-nautilus \
               --with-gconf-schema-file-dir=/usr/share/gconf/schemas --with-gtk=3.0
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install

  # Remove seahorse-tool (now it's in seahorse-nautilus package)
  #rm "$pkgdir"/usr/bin/seahorse-tool \
   #  "$pkgdir"/usr/share/applications/seahorse-pgp-{encrypted,keys,signature}.desktop \
    # "$pkgdir"/usr/share/man/man1/seahorse-tool.1 \
     #"$pkgdir"/usr/share/seahorse-plugins/ui/seahorse-{multi-encrypt,notify,progress}.xml

}
