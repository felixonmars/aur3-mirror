# Maintainer: murchik <mixturchik@gmail.com>
pkgname=zhudi-cli
pkgver=1.4
pkgrel=11
pkgdesc="Supporting CLI fork of a Python/GTK3+ GUI to Chinese -English-French-German dictionnaries (CEDICT, CFDICT, HanDeDict, ChE-Dicc…). It also provides pinyin and zhuyin pronunciaton as well as a sentence segmentation utility."
arch=('any')
url="https://github.com/moorchegue/Zhudi"
license=('GPL3')
depends=('python' 'python-gobject' 'pygobject-devel' 'gobject-introspection' 'pango')
conflicts=('zhudi')
install=zhudi.install
changelog=
source=(zhudi-cli::git://github.com/moorchegue/Zhudi.git)
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    git checkout $pkgver
    msg "Installation in progress…"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
