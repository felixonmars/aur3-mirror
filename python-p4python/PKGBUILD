# Maintainer: Brett Bates <brett@bmb.io>
pkgname=python-p4python
pkgver=2014.2.962887
pkgrel=3
pkgdesc="Python api for Perforce SCM"
arch=('i686' 'x86_64')
url="http://www.perforce.com"
license=('custom:p4python')
options=('!emptydirs')
checkdepends=('p4d')
source=(ftp://ftp.perforce.com/perforce/r14.2/bin.tools/p4python.tgz 
        ftp://ftp.perforce.com/perforce/r14.2/bin.linux26${CARCH/i6/x}/p4api.tgz
        LICENSE)

[ "$CARCH" = "i686" ] && \
    sha256sums=('4101bd6c5d8811e18c5fe9aef75710bc3b4fcfc25818cad0cc308d6a48842414'
                '10fbfe9c19c9c2fc0710a1c76870b04fb17f0643f8a34d4a1d264cd2860d6ed2'
                'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

[ "$CARCH" = "x86_64" ] && \
 sha256sums=('4101bd6c5d8811e18c5fe9aef75710bc3b4fcfc25818cad0cc308d6a48842414'
             '67dab61ec357e09eda46f8ff5c70ef0aa794dd7f6bf4f0fd1eade6a3af20bf84'
             'c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32')

check(){
    cd "$srcdir/p4python-$pkgver"
    python p4test.py
}

build(){ 
    cd "$srcdir/p4python-$pkgver"
    python setup.py build --apidir "$srcdir/$(find $srcdir -name 'p4api-*' -type d -printf '%f')"
}

package(){
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    cd "$srcdir/p4python-$pkgver"
    python setup.py install --root="$pkgdir/" --apidir "$srcdir/$(find $srcdir -name 'p4api-*' -type d -printf '%f')"
}
