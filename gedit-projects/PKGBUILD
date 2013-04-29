# Contributor: matmo < matmoser at wu dot ac dot at >

pkgname="gedit-projects"
pkgver=1.1.1
pkgrel=2
pkgdesc="Manage projects in gedit"
url="https://launchpad.net/gedit-projects"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gedit>=3.8.1')
install="$pkgname.install"
source=("https://launchpadlibrarian.net/127673726/gedit-projects-$pkgver.tar.gz")
md5sums=('5cba036b1ffe17c20bb958e230824a3b')

build() {
    cd "$pkgname-$pkgver"
    sed -i 's|python|python3|g' projects.plugin
    sed -i 's|print e|print(e)|g' projects/config.py
}

package() {
    cd "$pkgname-$pkgver"
    # create target dir
    install -dm 755 $pkgdir/usr/lib/gedit/plugins
    # copy plugin meta file
    install -m 644  projects.plugin $pkgdir/usr/lib/gedit/plugins
    # copy everything else to target dir
    cp -r projects $pkgdir/usr/lib/gedit/plugins/

    install -dm 755 $pkgdir/usr/share/glib-2.0/schemas
    cp *.gschema.xml $pkgdir/usr/share/glib-2.0/schemas/
}

