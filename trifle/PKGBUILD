pkgname='trifle'
pkgver='2.0.1'
pkgrel=1
pkgdesc='Google Reader for GNOME'
url='https://github.com/simukis/Feeds'
license=('GPL2')
arch=('any')
depends=('python' 'python-lxml' 'python-gobject' 'libsecret' 'gtk3' 'libwebkit3' 'libnotify')
install='trifle.install'
source=("https://github.com/simukis/Feeds/archive/"$pkgver".zip")
md5sums=('cf2d3d42f8b13e4819f7028edc46a2f7')

build() {
    cd $srcdir/Feeds-$pkgver/
    python setup.py build
}

package() {
    cd $srcdir/Feeds-$pkgver/
    python setup.py install --prefix=$pkgdir/usr/
    rm $pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled
}

