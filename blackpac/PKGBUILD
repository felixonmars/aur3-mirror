# Maintainer: IgnorantGuru <ignorantguru@gmx.com>
# This PKGBUILD will download and build the latest version
pkgname=blackpac
# pkgver will be changed dynamically in build() to latest version
pkgver=1.0.1
pkgrel=4
pkgdesc="Maintains a list of blacklisted packages and allows their removal despite dependencies"
PACKAGER="IgnorantGuru <ignorantguru@gmx.com>"
arch=(any)
depends=()
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
source=("http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh")
#md5sums=(`wget -O - http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh | md5sum | head -c 32`)
md5sums=('ab77873b3253f25ebdb0d1db36fc4e79')

build() {
    _autover=`grep -m 1 "$pkgname version [[:digit:]]" ${startdir}/$pkgname.sh | sed 's/^.* version \([[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\).*/\1/'`
    if [ "$_autover" != "" ] && [ "$_autover" != "$pkgver" ]; then
        # link to keep yaourt happy
        ln -s $pkgname-$_autover-$pkgrel-any.pkg.tar.gz ${startdir}/$pkgname-$pkgver-$pkgrel-any.pkg.tar.gz 
        eval "pkgver=$_autover"
    fi
    cd ${startdir}/pkg || return 1
    mkdir -p usr/bin || return 1
    cd usr/bin || return 1
    cp ${startdir}/$pkgname.sh ./$pkgname
    chmod +x $pkgname
}

package() {
    cp ${startdir}/$pkgname.sh /usr/bin/$pkgname
    chmod +x /usr/bin/$pkgname
}
