# Maintainer: Phillip Wood <phillip.wood@dunelm.org.uk>
pkgname='gnome-typing-break-bzr'
_pkgname="brainbreak"
pkgver=2
pkgver() {
  cd "$srcdir/$_pkgname"
  bzr revno
}
pkgrel=1
epoch=
pkgdesc="The new typing break for GNOME, aka brainbreak"
arch=('x86_64' 'i686')
url="https://launchpad.net/brainbreak"
license=('GPL3')
groups=()
depends=('libnotify' 'libcanberra' 'libgee06' 'libxtst' 'gtk3')
makedepends=('vala' 'bzr' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$_pkgname.install"
changelog=
source=("${_pkgname}::bzr+http://bazaar.launchpad.net/~dylanmccall/$_pkgname/gnome-break-timer/"
        "$_pkgname.install")
noextract=()
sha256sums=('SKIP'
            'b9f8bdaa058b458951112febd3210674a78cf8cbd1fa48ef6b166ccd55603da8') 

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh --prefix=/usr --sysconfdir=/etc \
	  --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
	  --disable-static --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
