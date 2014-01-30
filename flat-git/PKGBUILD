# Maintainer: Marcus Møller <powrtoch.org>

pkgname=flat-git
pkgver=20140128
pkgrel=1
pkgdesc="FLAT is a first person ice skating combat game that was originally created for the 7 Day FPS Challenge. http://flat.jbushproductions.com"
arch=('i686' 'x86_64')
url="https://github.com/Cheeseness/FLAT"
license=('GPL')
depends=('allegro')
makedepends=('cmake'
    'make'
    'gcc')

source=($pkgname::"git+https://github.com/Cheeseness/FLAT.git"
    flat)
md5sums=('SKIP'
    'be975761a676aac299c376a42a942962')

build() {
    cd "$srcdir/$pkgname"
    cmake .
    make
}

package() {
    install -dv "${pkgdir}/opt/flat"
    install -dv "${pkgdir}/usr/bin"

    # flat
    cd "$srcdir/$pkgname/out"
    cp -rf gfx music sfx "${pkgdir}/opt/flat"

    install -Dm755 FLAT.x86* "${pkgdir}/opt/flat"
    install -Dm644 font.ttf "${pkgdir}/opt/flat"
    install -Dm644 font.txt "${pkgdir}/opt/flat"

    # launcher
    install -Dm755 "${srcdir}/flat" "${pkgdir}/usr/bin/"
}

