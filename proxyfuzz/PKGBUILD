#Maintainer: Pi3rrot <pierre AT pi3rrot dot net>
pkgname=proxyfuzz
pkgver=0.1
pkgrel=2
pkgdesc="a man-in-the-middle non-deterministic network fuzzer written in Python"
license="GPL"
url="http://www.secforce.com/blog/tag/proxyfuzz/"
depends=('twisted')
arch=('i686' 'x86_64')
source=("http://www.secforce.com/media/tools/proxyfuzz.py.txt")
md5sums=('7bd8bcdfb7c68ea8e7e6a459b0f4fe9c')

build() {
    cd $srcdir/

    # Add interpreter definition at the beginning of the script
    echo "#!/usr/bin/python2" > proxyfuzz
    cat proxyfuzz.py.txt >> proxyfuzz
}

package() {
    cd $srcdir/
    install -D -m755 proxyfuzz $pkgdir/usr/bin/proxyfuzz
}
