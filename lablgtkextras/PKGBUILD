pkgname=lablgtkextras
pkgver=1.0
_pkgvercode=555
pkgrel=1
pkgdesc="Lablgtk-extras is a collection of libraries and modules useful when developing OCaml/LablGtk2 applications"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-extras.forge.ocamlcore.org/"
makedepends=('ocaml' 'lablgtk2' 'ocaml-config-file' 'ocaml-xml-light')
source=(https://forge.ocamlcore.org/frs/download.php/$_pkgvercode/lablgtkextras-$pkgver.tar.gz)

# uninstall libgnomeui before to avoid gnome depends
build() {
    cd "$srcdir"/lablgtkextras-$pkgver
    ./configure
    make MY_INCLUDES="-I +xml-light"
    make  DESTDIR="$pkgdir" DESDIT="$pkgdir" install
}

md5sums=('d4b8ae8b87e27854637e2733b310678c')
