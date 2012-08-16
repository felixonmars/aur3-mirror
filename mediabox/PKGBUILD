# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=mediabox
pkgver=2.88
pkgrel=1
pkgdesc="MediaBox is a minimalistic GTK+ player based on GStreamer."
arch=('i686' 'x86_64')
url="http://gtk-apps.org/content/show.php/MediaBox+Reloaded?content=151673"
license=('GPL')
depends=('gtk2' 'libglade' 'dbus' 'dbus-python' 'python2' 'pyxdg' 'pygtk' 'python-rsvg' 'python-imaging' 'python-notify' 'cddb-py' 'mutagen' 'gstreamer0.10-python')
optdepends=('libvisual-plugins: Plugins for libvisual' 
            'python-gudev-git: Support for playing DVD'
            'gstreamer0.10-plugins: Gstreamer multimidia plugins')           
source=("http://gtk-apps.org/CONTENT/content-files/153094-${pkgname}_${pkgver}-0~trunk.7z"
        "Makefile.patch")
sha1sums=('3e09dbb2d37e850e05ababae455915594f40a7ce'
          '16df05813bb143464736496c67fdc56071ee5a7c')

build() {
    cd ${pkgname}_${pkgver}-0~trunk || return 1     
    patch -Np0 < ${srcdir}/Makefile.patch
    for file in $(grep -Elr "(.*/python|exec.*python)" $srcdir); do sed 's/python/python2/' -i $file; done
}

package() {
    cd ${pkgname}_${pkgver}-0~trunk || return 1
    make USRDIR=${pkgdir}/usr install || return 1        
}
