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
    'adminer-skins-ng9'
    'adminer-skins-pilot'
    'adminer-skins-kahi'
    'adminer-skins-cvicebni-ubor'
    'adminer-skins-jukin'
)

pkgver=20120918
pkgrel=1
pkgdesc='Adminer skins'
url='http://www.adminer.org'
arch=('any')
license=('Apache License, Version 2.0')
depends=('adminer')
provides=('adminer-skin')
conflicts=('adminer-skin')
makedepends=()
optdepends=()

source=(
    'hever.css::https://raw.github.com/vrana/adminer/master/designs/hever/adminer.css'
    'brade.css::https://raw.github.com/vrana/adminer/master/designs/brade/adminer.css'
    'haeckel.css::https://raw.github.com/vrana/adminer/master/designs/haeckel/adminer.css'
    'pokorny.css::https://raw.github.com/vrana/adminer/master/designs/pokorny/adminer.css'
    'paranoiq.css::https://raw.github.com/vrana/adminer/master/designs/paranoiq/adminer.css'
    'bueltge.css::https://raw.github.com/vrana/adminer/master/designs/bueltge/adminer.css'
    'konya.css::https://raw.github.com/vrana/adminer/master/designs/konya/adminer.css'
    'ng9.css::https://raw.github.com/vrana/adminer/master/designs/ng9/adminer.css'
    'pilot.css::https://raw.github.com/vrana/adminer/master/designs/pilot/adminer.css'
    'kahi.css::https://raw.github.com/vrana/adminer/master/designs/kahi/adminer.css'
    'cvicebni-ubor.css::https://raw.github.com/vrana/adminer/master/designs/cvicebni-ubor/adminer.css'
    'jukin.css::https://raw.github.com/vrana/adminer/master/designs/jukin/adminer.css'
)

md5sums=('8582848fdb2b459ae96b7f392093be48'
         '9da6b73dfa3bb538b253676e14c50d1e'
         '0077baa49eef35467a8c770a44ce40e8'
         '79cdfdd79bc42e597121b6adf8cc26f3'
         'aa030a380ca2dca615d01856a333e4d8'
         '1520661c238a8460170afa0b49ad894a'
         '0e4e5cbcfe4528e44ba62e34df1e0324'
         '6c69bf9a12232832d99cf508f2eb8b7f'
         '0429c1df7811e6730e5e5e81f6a3dc10'
         '379d27d158530d478dc68e144c3004c4'
         '34227ef300208595674f421639dace53'
         'f1857afe4b6f71dfbc354a9535f63ec5')

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

package_adminer-skins-ng9() {
    _copy_css ng9
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
    true
}

build() {
    true
}
