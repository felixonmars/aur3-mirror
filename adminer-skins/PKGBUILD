# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Zsolt Udvari - uzsolt <udvzsolt X gmail X com>

_name=adminer-skins
pkgname=$_name

true && pkgname=(
    'adminer-skins'
    'adminer-skins-hever'
    'adminer-skins-brade'
    'adminer-skins-haeckel'
    'adminer-skins-pokorny'
    'adminer-skins-paranoiq'
    'adminer-skins-bueltge'
    'adminer-skins-konya'
    'adminer-skins-pilot'
    'adminer-skins-kahi'
    'adminer-skins-cvicebni-ubor'
    'adminer-skins-jukin'
)

pkgver=20120422
pkgrel=1
url='http://www.adminer.org'
arch=('any')
license=('Apache License, Version 2.0')
depends=('adminer')
makedepends=()
optdepends=()

_default_skin=hever

source=(
    'hever.css::https://raw.github.com/vrana/adminer/master/designs/hever/adminer.css'
    'brade.css::https://raw.github.com/vrana/adminer/master/designs/brade/adminer.css'
    'haeckel.css::https://raw.github.com/vrana/adminer/master/designs/haeckel/adminer.css'
    'pokorny.css::https://raw.github.com/vrana/adminer/master/designs/pokorny/adminer.css'
    'paranoiq.css::https://raw.github.com/vrana/adminer/master/designs/paranoiq/adminer.css'
    'bueltge.css::https://raw.github.com/vrana/adminer/master/designs/bueltge/adminer.css'
    'konya.css::https://raw.github.com/vrana/adminer/master/designs/konya/adminer.css'
    'pilot.css::https://raw.github.com/vrana/adminer/master/designs/pilot/adminer.css'
    'kahi.css::https://raw.github.com/vrana/adminer/master/designs/kahi/adminer.css'
    'cvicebni-ubor.css::https://raw.github.com/vrana/adminer/master/designs/cvicebni-ubor/adminer.css'
    'jukin.css::https://raw.github.com/vrana/adminer/master/designs/jukin/adminer.css'
)

md5sums=('9c425f04eac407fe98bb1ac608ddbc21'
         '90fe4e7c6f7db301646ffecffd54dc7c'
         '3a94b8317954815b7f83391b124c4ae1'
         '9a580e87b47da1881ce4ff1bd7bd5238'
         'aa030a380ca2dca615d01856a333e4d8'
         '1804a0b68b360a1a0e4b80dac51e04a3'
         'c1e77bc6fa74da505affad2ef9fb9f01'
         '0429c1df7811e6730e5e5e81f6a3dc10'
         '379d27d158530d478dc68e144c3004c4'
         '34227ef300208595674f421639dace53'
         'f1857afe4b6f71dfbc354a9535f63ec5'
)

_copy_css() {
    install -d $pkgdir/usr/share/webapps/adminer
    cp ${1}.css $pkgdir/usr/share/webapps/adminer/adminer.css
}

package_adminer-skins-hever() {
    _copy_css hever
}

package_adminer-skins-brade() {
    _copy_css brade
}

package_adminer-skins-haeckel() {
    _copy_css haeckel
}

package_adminer-skins-pokorny() {
    _copy_css pokorny
}

package_adminer-skins-paranoiq() {
    _copy_css paranoiq
}

package_adminer-skins-bueltge() {
    _copy_css bueltge
}

package_adminer-skins-konya() {
    _copy_css konya
}

package_adminer-skins-pilot() {
    _copy_css pilot
}

package_adminer-skins-kahi() {
    _copy_css kahi
}

package_adminer-skins-cvicebni-ubor() {
    _copy_css cvicebni-ubor
}

package_adminer-skins-jukin() {
    _copy_css jukin
}

package_adminer-skins() {
    pkgdesc='Adminer skins'
    _copy_css $_default_skin
}

build() {
    true
}
