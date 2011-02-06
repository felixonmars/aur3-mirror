# Maintainer: Bernd Prünster <bernd.pruenster@gmail.com>
pkgname=latexila-beta
_pkgname=latexila
provides=('latexila')
pkgver=1.99.1
pkgrel=1
pkgdesc="LaTeXila, a LaTeX editor designed for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://latexila.sourceforge.net"
license=("GPL")
depends=('rubber' 'hicolor-icon-theme' 'gsettings-desktop-schemas-git' 'gtksourceview2')
makedepends=(cmake)
source=("https://github.com/downloads/swilmet/latexila/${_pkgname}-${pkgver}.tar.gz")
md5sums=(32b1dc92dc4014cf868e6e12db552969)

build() {
        cd ${srcdir}/${_pkgname}-${pkgver}

        cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
        make  || return 1
        make DESTDIR="${pkgdir}/" install || return 1


    mkdir -p "$pkgdir"/usr/share/{applications,pixmaps}
    install -Dm644 data/images/app/icon48.png \
            "$pkgdir"/usr/share/pixmaps/$_pkgname.png || return 1
    install -m644 data/$_pkgname.desktop \
            "$pkgdir"/usr/share/applications/ || return 1
}
