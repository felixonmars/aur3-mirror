# Maintainer: M0Rf30 < morf3089 at gmail dot com >

pkgname=veromix-gtk-git
pkgver=651.a319c28
pkgrel=1
pkgdesc="A mixer for the Pulseaudio sound server (GTK version)"
url="http://code.google.com/p/veromix-plasmoid/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('pulseaudio' 'pyxdg'  'python-gobject' 'python-dbus')
conflicts=('kdeplasma-addons-applets-veromix' 'kdeplasma-addons-applets-veromix-svn' 'kdeplasma-addons-applets-veromix-git' 'veromix-git')
makedepends=('git')
optdepends=('pulseaudio-equalizer'
            'swh-plugins: equalizer and other effects support')
source="veromix-plasmoid::git+https://code.google.com/p/veromix-plasmoid/"

package() {
  cd veromix-plasmoid
  # Updating Italian translation...
	cd plasma/contents/locale/it/LC_MESSAGES
	wget https://raw.github.com/M0Rf30/translations/master/veromix-plasmoid.po
	# ...and generating .mo files
	cd $srcdir/veromix-plasmoid
	make
	
	# Common elements
	install -dm755 ${pkgdir}/usr/share/veromix
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

pkgver() {
  cd veromix-plasmoid
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
