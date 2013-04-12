# Maintainer: Chris Down <chris@chrisdown.name>

pkgname="yturl"
pkgver=1.14.0
pkgrel=2
pkgdesc="Get direct media URLs to YouTube videos"
url="http://github.com/cdown/yturl"
arch=( "any" )
license=( "MIT" )
if type -p python2 &>/dev/null && ! type -p python &>/dev/null; then
    _use_python_2=1
    depends=( "python2" )
else
    _use_python_2=0
    depends=( "python" )
fi

source=(
    "https://github.com/cdown/yturl/archive/v${pkgver}.zip"
)
md5sums=('76be42cc33a69a1a5a3d179b3dba1601')

package() {
    if (( _use_python_2 )); then
        sed -i '1s|^.*$|#!/usr/bin/env python2|g' "$srcdir/$pkgname-$pkgver/yturl"
    fi

    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/yturl" \
        "$pkgdir/usr/bin/yturl"
}
