pkgname=webcontentcontrol-git
pkgver=1.4.0
pkgrel=1
url="https://bitbucket.org/ssoulaimane/webcontentcontrol-gambas3"
pkgdesc="Parental Control GUI. WebContentControl is a frontend for dansguardian+tinyproxy+fireHOL."
arch=('any')
depends=('firehol' 'tinyproxy' 'dansguardian-dev'
         'gambas3-devel'
         'gambas3-gb-qt4'
         'gambas3-gb-form'
         'gambas3-gb-form-dialog'
         'gambas3-gb-qt4-webkit'
         'gambas3-gb-image'
        )
makedepends=('autoconf'
             'gambas3-devel'
             'gambas3-gb-qt4'
             'gambas3-gb-form'
             'gambas3-gb-form-dialog'
             'gambas3-gb-qt4-webkit'
             'gambas3-gb-image'
            )
source=("$pkgname::git+https://bitbucket.org/ssoulaimane/webcontentcontrol-gambas3")
md5sums=('SKIP')

install=webcontentcontrol.install

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    ./configure
    make
}

package() {
    cd "$pkgname"
    make install DESTDIR="$pkgdir"
}
