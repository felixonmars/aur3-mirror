# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=decibel3-xplayer
pkgver=3.20
pkgrel=1
pkgdesc="Decibel 3 xPlayer is a minimalistic GTK+ audio player based on GStreamer."
arch=('i686' 'x86_64')
url="http://code.google.com/p/mickyz/"
license=('GPL')
depends=('gtk2' 'libglade' 'dbus' 'dbus-python' 'python2' 'pyxdg' 'pygtk' 'python2-rsvg' 'python2-imaging' 'python2-notify' 'cddb-py' 'mutagen')
optdepends=('gstreamer0.10-plugins: GStreamer Multimedia Plugins'
            'gstreamer0.10-python: Python bindings for GStreamer 0.10')
conflicts=('decibel-audio-player' 'soundbox')
source=("https://dl.dropbox.com/u/4813005/decibel_${pkgver}-${pkgrel}.mickyz.deb")
sha1sums=('a3533a537dbb5e7a12cadfbf1d4d9342c85ddcb3')
install=decibel3.install

build() {  
  tar -zxf $srcdir/data.tar.gz  
}

package() {  
  cp -r $srcdir/usr $pkgdir
  install -Dm 755 ${pkgdir}/usr/share/decibel/pix/app48.png ${pkgdir}/usr/share/pixmaps/decibel.png
  install -Dm 755 ${srcdir}/usr/share/decibel/src/mutag ${pkgdir}/usr/bin/mutag  
  for file in $(grep -Elr "(.*/python|exec.*python)" $pkgdir); do sed 's/python/python2/' -i $file; done  
}
s 
