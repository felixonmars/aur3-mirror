# Maintainer: Isaac Aggrey <isaac.aggrey@gmail.com>
# Contributor: Joël Porquet <joel@porquet.org>

pkgname=dircolors-solarized-git
pkgver=r122.c1779cd
pkgrel=1
pkgdesc="Solarized colors for dircolors"
arch=('any')
url="https://github.com/seebi/dircolors-solarized"
license=('MIT')
makedepends=('git')

source=("${pkgname}::git://github.com/seebi/dircolors-solarized.git")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}

    install -d $pkgdir/usr/share/dircolors

    install -m 644 dircolors.256dark $pkgdir/usr/share/dircolors/
    install -m 644 dircolors.ansi-dark $pkgdir/usr/share/dircolors/
    install -m 644 dircolors.ansi-light $pkgdir/usr/share/dircolors/
    install -m 644 dircolors.ansi-universal $pkgdir/usr/share/dircolors/
}

install=dircolors-solarized-git.install
