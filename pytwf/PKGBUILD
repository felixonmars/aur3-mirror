# Contributor: twa022 <twa022@gmail.com>

pkgname=pytwf
pkgver=1.0.2
pkgrel=2
pkgdesc="Python rewrite of The Widget Factory(twf), a theme preview application for GTK2."
url="http://www.gtk-apps.org/content/show.php/PyTWF?content=102024"
depends=('libglade' 'cairo' 'pygtk' 'python2')
source=("http://www.gtk-apps.org/CONTENT/content-files/102024-PyTWF.tar.bz2")
md5sums=('0ce3f791fe6a396fca3f24b9c4adb207')
arch=('any')
license=('BSD')

build() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/pytwf
	mkdir -p ${pkgdir}/usr/bin
	sed -i 's:twf.builder:/usr/share/pytwf/twf.builder:' PyTWF.py
	install -m755 PyTWF.py ${pkgdir}/usr/share/pytwf/
	install -m644 twf.builder ${pkgdir}/usr/share/pytwf/
	
	cat > pytwf << __EOF__
#!/bin/bash

python2 -u /usr/share/pytwf/PyTWF.py
__EOF__
	
	install -m755 pytwf ${pkgdir}/usr/bin/
}
