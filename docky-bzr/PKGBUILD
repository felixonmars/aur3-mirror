# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Alessio 'Bl@ster' Biancalana <dottorblaster at archlinux dot us>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=docky-bzr
pkgver=1855
pkgrel=2
pkgdesc="Full fledged dock application that makes opening common applications and managing windows easier and quicker"
url="http://wiki.go-docky.com/"
arch=('any')
license=('GPL3')
depends=('gconf-sharp' 'libgnome-desktop-sharp' 'gnome-keyring-sharp' 'mono-addins' 'notify-sharp' 'rsvg2-sharp' 'wnck-sharp' 'hicolor-icon-theme' 'xdg-utils' 'gkeyfile-sharp')
makedepends=('bzr' 'intltool' 'libgnome-sharp' 'gio-sharp' 'autoconf')
install=$pkgname.install
source=('bzr+lp:docky'
        'configure.patch')
md5sums=('SKIP'
         'd9fe81a389c2f24a01ebd5ab4a3cf46f')

_bzrtrunk=lp:docky

pkgver(){
    cd ${srcdir}/docky
    bzr version-info|grep 'revno:'|cut -d ' ' -f2
}

build() {
  cd ${srcdir}/docky
  patch configure.ac ${srcdir}/configure.patch
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/docky"
  make DESTDIR="$pkgdir" install
}
