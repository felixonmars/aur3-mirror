# Contributor: skatiger <skatiger@gmail.com>

pkgname=stardict-gtkstatusicon
pkgver=3.0.2
pkgrel=1
pkgdesc='A powerful international dictionary written in Gtk2.'
arch=('i686' 'x86_64')
url='http://stardict.sourceforge.net/'
license=('GPL')
depends=('enchant' 'gtk2' 'libsigc++' 'libsm')
makedepends=('intltool' 'popt' 'gnome-doc-utils')
options=('!libtool' '!emptydirs')
conflicts=('stardict')

_basename="stardict"

source=("http://downloads.sourceforge.net/sourceforge/stardict/${_basename}-$pkgver.tar.bz2"
        'help-in-destdir.patch'
        'as-needed.patch'
        'gcc-46.patch'
        'gtkstatusicon.patch')
sha1sums=('301875657cd39b5f25e5933ece22936a28db1230'
          '0249d769e5cc85e183eb395b824342f8ca320f56'
          '22fca061d1be23ac79da6c0ec5fc488ae0aca9c1'
          '256bc94f481dcbfdc72433751702e4b2c094aa94'
          'e9d7eecbac3c0ed94d5739907cac144880134c97')

build()
{
	cd "$srcdir/${_basename}-$pkgver"

	# patches accepted upstream; will be in stardict>3.0.2
	patch -p1 -i ../help-in-destdir.patch
	patch -p1 -i ../as-needed.patch
	patch -p1 -i ../gcc-46.patch
    patch -p1 -i ../gtkstatusicon.patch
	automake

	./configure PKG_CONFIG=/usr/bin/pkg-config --prefix=/usr \
		--sysconfdir=/etc --mandir=/usr/share/man \
		--disable-gnome-support --disable-schemas-install \
		--disable-espeak --disable-gucharmap \
		--disable-festival --disable-updateinfo
	make
}

package() {
	cd "$srcdir/${_basename}-$pkgver"
	make DESTDIR="$pkgdir" install
}
