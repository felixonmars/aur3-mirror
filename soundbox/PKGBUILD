# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=soundbox
pkgver=4.00
pkgrel=2
_pkgrealrel=1
pkgdesc="SoundBox is a minimalistic GTK+ player based on GStreamer."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/SoundBox?content=149419"
license=('GPL')
depends=('gtk2' 'libglade' 'dbus' 'dbus-python' 'python2' 'pyxdg' 'pygtk' 'python-rsvg' 'python-imaging' 'python-notify' 'cddb-py' 'mutagen' 'gstreamer0.10-python')
optdepends=('python-gdata: YouTube Videos Support' 
            'python-gudev-git: Support for playing DVD'
            'gstreamer0.10-python: Python bindings for GStreamer 0.10'
            'libvisual: audio visualisation and audio visualisation plugins'
            'ttf-droid: handheld device font with extensive style and language support')
conflicts=('mediabox' 'decibel3-xplayer')
source=("http://opendesktop.org/CONTENT/content-files/149419-${pkgname}_${pkgver}-${_pkgrealrel}~mickyz.deb")         
md5sums=('34bc430d5ecc3a70672f830695bc8e87')
install=soundbox.install

build() {  
  tar -zxf $srcdir/data.tar.gz  
}

package() {  
  cp -r $srcdir/usr/ $pkgdir  
  install -Dm 755 ${pkgdir}/usr/share/${pkgname}/pix/app48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  sed 's/python/python2/' -i ${pkgdir}/usr/bin/${pkgname}
}
