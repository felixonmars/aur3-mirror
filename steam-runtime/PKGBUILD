# Maintainer: Andrew Cook <ariscop@gmail.com>
pkgname=steam-runtime
pkgver=0.0.1
pkgrel=1
pkgdesc="Steam runtime packages"
arch=(x86_64 i686)
url="https://github.com/ValveSoftware/steam-runtime"
license=('GPL')
source=('package-list' 'package-list-32')
md5sums=('ff989baab57b17ad68003822d6274eca'
         'ca4c6da1f632be2b72890f032935e4ec')

if [[ $CARCH == i686 ]]; then
    depends=(`<package-list`)
else
    depends=(`<package-list` `<package-list-32`)
fi

build() {
    return 0
}

package() {
    return 0
}
