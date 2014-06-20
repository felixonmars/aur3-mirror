# Maintainer: Stephen Blythe <stephen@urwick.co.uk>
pkgname=python2-pifacenetctl
pkgver=0.2.1
pkgrel=2
pkgdesc="Raspberry Pi and PiFace headless network manager"
url="https://github.com/shblythe/python2-pifacenetctl"
depends=('python2'
         'python2-netctl'
)
makedepends=('python2-distribute' )
license=('GPL3')
arch=('any')
source=(
        'pifacenetctl.service'
        "https://pypi.python.org/packages/source/p/pifacenetctl/pifacenetctl-$pkgver.zip"
)
md5sums=(
         '9acf9521677398e4f86907e696530f72'
         '404235e49c0a1e24e357d6f6c2bff455'
)

build() {
    cd $srcdir/pifacenetctl-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir
    install -m 755 -d "$pkgdir/usr/lib/systemd/system"
    install -m 644 -t "$pkgdir/usr/lib/systemd/system" pifacenetctl.service
    cd pifacenetctl-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
