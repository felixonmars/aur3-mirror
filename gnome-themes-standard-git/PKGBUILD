# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-themes-standard
pkgname=$_pkgname-git
pkgver=3.13.3
pkgrel=1
pkgdesc="Default themes for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL2')
depends=('cantarell-fonts' 'ttf-dejavu' 'gtk3' 'gtk-engines' 'librsvg' "gtk2>=2.24.15" "gtk3>=3.9.12")
makedepends=('intltool')
groups=('gnome')
replaces=('gnome-themes')
provides=('gnome-themes-standard')
conflicts=('gnome-themes' 'gnome-themes-standard=3.13.3')
options=('!libtool')
source=('git://git.gnome.org/gnome-themes-standard'
        '0001-Fix-the-size-of-the-title-in-the-header-bar.patch'
        '0001-Add-a-border-to-CSD-also-without-custom-titlebar.patch')
sha256sums=('SKIP'
            'e6baf41124de5727d531544e7025cade780f4906c48c1ada05d335ed63d15c94'
            'cbbdc06de9fdfcb00f935ca520a3ad01226dd9167972d87f4ac822a3a38df306')

pkgver()
{
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  cd "$srcdir/$_pkgname"
  #patch -Np1 -i "$srcdir/0001-Fix-the-size-of-the-title-in-the-header-bar.patch"
  #patch -Np1 -i "$srcdir/0001-Add-a-border-to-CSD-also-without-custom-titlebar.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
