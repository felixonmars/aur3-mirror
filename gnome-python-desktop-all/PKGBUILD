# Contributor: mathieui AT mathieui dot net

pkgname=gnome-python-desktop-all
_pkgname=gnome-python-desktop
pkgver=2.30.0
pkgrel=1
pkgdesc="Gnome Python interfaces for libraries not part of the core platform with python-metacity enabled"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gnome-desktop>=2.30.0' 'gnome-python>=2.28.0')
options=('!libtool')
makedepends=('intltool' 'pkgconfig' 'gnome-media>=2.30.0' 'gnome-panel>=2.30.0' 'gtksourceview>=1.8.5' 'libgnomeprintui>=2.18.5' 'libgtop>=2.28.1' 'totem-plparser>=2.30.0' 'evince' 'bug-buddy>=2.30.0' 'brasero>=2.30.0')
optdepends=('gnome-media' 'gnome-panel' 'gtksourceview' 'libgnomeprintui' 'libgtop' 'totem-plparser' 'evince' 'bug-buddy' 'brasero')
url="http://www.gnome.org"
provides=('python-metacity')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/2.30/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('db997a3c81967d6dc7210dd83e06f18ac6417f804f672e42f15a1d68af371f49')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./waf configure --prefix=/usr --enable-metacity|| return 1
  ./waf build ${MAKEFLAGS} || return 1
  ./waf install --destdir="${pkgdir}" || return 1
  install -m644 gnomeprint/art.defs "${pkgdir}/usr/share/pygtk/2.0/defs/" || return 1
}
