pkgname=emesene2
pkgver=2.11.5
pkgrel=1
pkgdesc="An OS independent MSN Messenger client writed in python and GTK"
arch=('i686' 'x86_64')
url="http://www.emesene.org/"
license=('PSF' 'GPL' 'LGPL2')
depends=('python2' 'pygtk' 'python-dnspython' 'pylint' 'python-notify' 'openssl' 'papyon' 'python-imaging' 'dbus-python')
optdepends=('pywebkitgtk: for alternative conversation window' 
            'xmpppy: for gtalk and facebook chat support')
conflicts=('emesene2-git')

source=('emesene2.run' 'emesene2.desktop' 'https://github.com/emesene/emesene/tarball/v2.11.5')

md5sums=('d80dd3733bac314306d4e605880c13b0'
         'a4bfcf1b89018a3aad09f11367589e3b'
         '658d0c9c96f5632cada6b66cc5a48b4f')

build() {
  cd "$srcdir"
    
  cd emesene-emesene*
  cd emesene
  
  sed -i '/import e3dummy/d' emesene.py

  # Copying files
  mkdir -p $pkgdir/usr/{bin,share/${pkgname}}
  cp -r * $pkgdir/usr/share/${pkgname}
  rm -rf $pkgdir/usr/share/${pkgname}/docs
  
  # install startup file
  install -Dm755 $srcdir/emesene2.run $pkgdir/usr/bin/${pkgname}
  
  # install pixmap
  install -Dm644 themes/images/default/logo.png $pkgdir/usr/share/pixmaps/${pkgname}.png
  
  # install desktop file
  install -Dm644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

} 
