# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
pkgname=decibel-audio-player2
pkgver=2.50
pkgrel=1
pkgdesc="Decibel² xPlayer is a minimalistic GTK+ audio player based on GStreamer."
arch=('i686' 'x86_64')
url="http://code.google.com/p/mickyz/"
license=('GPL')
depends=('gtk2' 'libglade' 'dbus' 'dbus-python' 'python2' 'pyxdg' 'pygtk' 'python-rsvg' 'python-imaging' 'python-notify' 'cddb-py' 'mutagen')
optdepends=('gstreamer0.10-plugins: GStreamer Multimedia Plugins'
            'gstreamer0.10-python: Python bindings for GStreamer 0.10')
conflicts=('decibel-audio-player')
source=("https://dl.dropbox.com/u/4813005/decibel_${pkgver}-${pkgrel}.mickyz.deb")
sha1sums=('5ddd72341f4ab5aa0ca7ea6f59f2aee139c7c209')
install=decibel2.install

build() {  
  tar -zxf $srcdir/data.tar.gz  
}

package() {
  for file in $(grep -lr "decibel" $srcdir); do sed 's/decibel/decibel2/' -i $file; done 
  cp -r $srcdir/usr/ $pkgdir  
  mv $pkgdir/usr/share/decibel $pkgdir/usr/share/decibel2
  mv $pkgdir/usr/share/decibel2/src/decibel $pkgdir/usr/share/decibel2/src/decibel2
  mv $pkgdir/usr/bin/decibel $pkgdir/usr/bin/decibel2
  mv $pkgdir/usr/share/applications/decibel.desktop $pkgdir/usr/share/applications/decibel2.desktop
  mv $pkgdir/usr/share/locale/it/LC_MESSAGES/decibel.mo $pkgdir/usr/share/locale/it/LC_MESSAGES/decibel2.mo
  install -Dm 755 ${pkgdir}/usr/share/decibel2/pix/app48.png ${pkgdir}/usr/share/pixmaps/decibel2.png  
  for file in $(grep -Elr "(.*/python|exec.*python)" $pkgdir); do sed 's/python/python2/' -i $file; done  
}
