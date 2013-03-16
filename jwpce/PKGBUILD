pkgname=jwpce
pkgver=3.50
pkgrel=1
pkgdesc="A free Japanese Word Processor."
arch=('any')
url="http://www.physics.ucla.edu/~grosenth/jwpce.html"
license=('GPL')
depends=('edict' 'wine' 'xdg-utils')
makedepends=('icoutils' 'imagemagick')
optdepends=('enamdict: Japanese proper names')
install=$pkgname.install
source=('jwpce'
        'jwpce.desktop'
        'http://www.physics.ucla.edu/~grosenth/jwpcemin.zip'
        'http://www.physics.ucla.edu/~grosenth/jwpcemax.zip')
sha256sums=('771ff381499cc86cff87eff351cc91e242c9a0d6b4793a99e3439353f97351d3'
            '64b71b2c3fec135b32956b6992c7842e77a188a40ad2bff9b233f0d5e1bde2c5'
            '5386d37fcfab2311eba3bae9f5409d9399c083f53729ac4eb3a104dd42d0340e'
            'bd65f1c9f42be8fba8b694783f94e9c74c12039e8471bb7260d488786d59f42a')

build() {
 wrestool -x -n 880 jwpce.exe > 880.ico
 convert 880.ico 880.png

 wrestool -x -n 882 jwpce.exe > 882.ico
 convert 882.ico 882.png
}

package() {
 install -d $pkgdir/usr/share/jwpce/
 install -m644 classical $pkgdir/usr/share/jwpce/classical
 install -m644 k16x16.f00 $pkgdir/usr/share/jwpce/k16x16.f00
 install -m644 k24x24.f00 $pkgdir/usr/share/jwpce/k24x24.f00
 install -m644 k48x48.f00 $pkgdir/usr/share/jwpce/k48x48.f00
 install -m644 kanjinfo.dat $pkgdir/usr/share/jwpce/kanjinfo.dat
 install -m644 radical.dat $pkgdir/usr/share/jwpce/radical.dat
 install -m644 stroke.dat $pkgdir/usr/share/jwpce/stroke.dat
 install -m644 wnn.dat $pkgdir/usr/share/jwpce/wnn.dat
 install -m644 wnn.dix $pkgdir/usr/share/jwpce/wnn.dix

 ln -s /usr/share/edict/edict $pkgdir/usr/share/jwpce/edict
 ln -s /usr/share/edict/edict.jdx $pkgdir/usr/share/jwpce/edict.jdx
 ln -s /usr/share/enamdict/enamdict $pkgdir/usr/share/jwpce/enamdict
 ln -s /usr/share/enamdict/enamdict.jdx $pkgdir/usr/share/jwpce/enamdict.jdx

 install -m755 jwpce.exe $pkgdir/usr/share/jwpce/jwpce.exe

 install -Dm755 jwpce $pkgdir/usr/bin/jwpce

 install -Dm644 jwpce.desktop $pkgdir/usr/share/applications/jwpce.desktop
 install -Dm644 880-0.png $pkgdir/usr/share/icons/hicolor/32x32/apps/jwpce.png
 install -Dm644 880-1.png $pkgdir/usr/share/icons/hicolor/16x16/apps/jwpce.png
 install -Dm644 882-0.png $pkgdir/usr/share/icons/HighContrast/32x32/apps/jwpce.png
 install -Dm644 882-1.png $pkgdir/usr/share/icons/HighContrast/16x16/apps/jwpce.png
}
