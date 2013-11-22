# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=monodevelop-monogame-addin-git
pkgver=3.0.1
pkgrel=1
pkgdesc='Monodevelop addin for monogame'
arch=('x86_64' 'i386')
url='http://monogame.codeplex.com'
license=('Ms-PL')
depends=('monodevelop' 'monogame')
makedepends=('mono' 'git')
source=("${pkgname}::git+git://github.com/dellis1972/MonoGameMonoDevelopAddin.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/repo"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    xbuild XamarinStudio.MonoGame.sln
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}/usr/lib/monodevelop/AddIns"
    # TODO use install instead of cp
    cp -r "MonoDevelop.MonoGame/bin/XamarinRelease/" "${pkgdir}/usr/lib/monodevelop/AddIns/monogame-${pkgver}"
}


