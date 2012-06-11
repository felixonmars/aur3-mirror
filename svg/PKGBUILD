_name=SVG
pkgname=svg
_ver=1.1
pkgver=${_ver}+edition2
pkgrel=1
pkgdesc="Scalable Vector Graphics specification in HTML format"
arch=(any)
url="http://www.w3.org/Graphics/${_name}"
license=(custom:"W3C document license")
options=(docs)
_file="REC-$_name${_ver//.}-20110816"
source+=("http://www.w3.org/TR/2011/$_file/$_file.zip")
noextract+=("$_file.zip")
md5sums+=(961a793d90c2868c95e10937f6ec3b87)
makedepends=(unzip)

package() {
    local TREE="$pkgdir/usr/share/doc"
    install -d "$TREE"
    cd "$TREE"
    unzip "$srcdir/$_file.zip"
    mv "$_file" "$pkgname"
}
