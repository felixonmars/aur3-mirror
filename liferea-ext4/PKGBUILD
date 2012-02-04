# Maintainer: Alex Weil <ajonat at gmail dot com>

_pkgrealname=liferea
pkgname=${_pkgrealname}-ext4
pkgver=1.7.4
pkgrel=2
pkgdesc="A GTK desktop news aggregator for online news feeds and weblogs patched for ext4 filesystem to improve speed"
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net/"
license=('GPL')
depends=('gconf>=2.28.0' 'libwebkit>=1.1.11' 'libnotify>=0.4.5' 'libxslt>=1.1.24' 'sqlite3>=3.6.15' 'libunique' 'libsoup>=2.28.2' 'gtk2>=2.18.0' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'diffutils' 'intltool')
options=('!libtool' '!emptydirs')
conflicts=('liferea')
install=liferea-ext4.install
source=(http://downloads.sourceforge.net/sourceforge/${_pkgrealname}/${_pkgrealname}-${pkgver}.tar.gz getenv_sync.patch libnotify.patch)
md5sums=('69ece60acc93a58cffb66e0e4f753704'
	 'a2724ece5abef7a3c42e44dfdeab06b5')

build() {
	cd "${srcdir}/${_pkgrealname}-${pkgver}"
	patch -Np1 -i ../getenv_sync.patch || return 1
	patch -Np1 -i ../libnotify.patch || return 1
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-schemas-install || return 1
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1
	install -d "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgrealname}.schemas" \
  		     "${pkgdir}"/etc/gconf/schemas/*.schemas || return 1
	rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}

