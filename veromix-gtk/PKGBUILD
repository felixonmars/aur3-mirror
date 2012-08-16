# Maintainer: nbvcxz < nbvcxz at o2 dot pl >

pkgname=veromix-gtk
pkgver=0.18.3
pkgrel=1
pkgdesc="A mixer for the Pulseaudio sound server (GTK version)"
url="http://code.google.com/p/veromix-plasmoid/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('pulseaudio' 'python-dbus' 'python-gobject')
conflicts=('kdeplasma-addons-applets-veromix' 'kdeplasma-addons-applets-veromix-svn' 'kdeplasma-addons-applets-veromix-git' 'veromix-git')
optdepends=('pyxdg: for additional tray icon
            pulseaudio-equalizer
            swh-plugins: equalizer and other effects support')
source=(http://veromix-plasmoid.googlecode.com/files/2012-06-14_0.18.3_veromix-gtk.tar.gz)
sha1sums=('55a92315f5d4a83668e2453010c7ffbc2303ef42')
build() {
  cd $srcdir/veromix
  
        # Common elements
        install -dm755 ${pkgdir}/usr/share/veromix || return 1
        cp -R data/* ${pkgdir}/usr/share
        cp -R {common,dbus-service} ${pkgdir}/usr/share/veromix

        # For Gnome
        cp -R gtk ${pkgdir}/usr/share/veromix
        mkdir -p ${pkgdir}/usr/bin
        echo "#!/bin/bash" > ${pkgdir}/usr/bin/veromix
        echo "cd /usr/share/veromix/gtk" >> ${pkgdir}/usr/bin/veromix
        echo "python3 main.py" >> ${pkgdir}/usr/bin/veromix
        chmod +x ${pkgdir}/usr/bin/veromix        

        # Generating bytecode
        cd $pkgdir/usr/share/veromix/gtk
        python -m compileall .
  
}
