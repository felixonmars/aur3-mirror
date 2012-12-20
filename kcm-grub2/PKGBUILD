# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=kcm-grub2
_filename_=kcmgrub2
pkgver=1.3
pkgrel=1
pkgdesc="Manages the most common settings of GRUB2"
arch=("i686" "x86_64")
url="http://kde-apps.org/content/show.php?content=137886"
license=("GPL3")
makedepends=("cmake" "automoc4")
depends=("grub-common" "kdelibs" "python2-qt" "kdebindings-python")
#options=()
source=(http://kde-apps.org/CONTENT/content-files/137886-${_filename_}.tar.gz)

build() {
	cd "${srcdir}"/${_filename_}-${pkgver}

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}"/${_filename_}-${pkgver}

	make DESTDIR="${pkgdir}" install
	
	install -D "${startdir}"/update-grub "${pkgdir}"/usr/sbin/update-grub
}

sha1sums=('3eca4c5b02c5fd0942b96c7f19397812a145363f')
