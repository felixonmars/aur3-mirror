# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=whichwayisup
pkgver=0.7.9
pkgrel=7
pkgdesc="Which Way Is Up is a traditional and challenging 2D platformer game with a slight rotational twist."
arch=('any')
url="http://hectigo.net/puskutraktori/whichwayisup/"
license=('GPL')
depends=('python2-pygame' 'python2')
makedepends=('unzip')
source=(http://www.oletus.fi/static/whichwayisup/whichwayisup_b079.zip 'whichwayisup.desktop')
md5sums=('cb6eba6f87ed6b420163e62f4ebfa4b9'
         'bc06182b8310276ec92b479f0437af66')

build() {
	cd ${srcdir}/$pkgname
	mkdir -p $pkgdir/usr/{bin,share/{$pkgname,applications}}
	cp -r run_game.py lib data $pkgdir/usr/share/$pkgname
	echo -e "#!/bin/bash\n\npython2 /usr/share/whichwayisup/run_game.py" >> $pkgdir/usr/bin/whichwayisup
	sed "s/\#\! \/usr\/bin\/env python/\#\!\/usr\/bin\/env python2/" -i ${pkgdir}/usr/share/whichwayisup/run_game.py
	chmod 755 $pkgdir/usr/bin/whichwayisup
	install -m755 -D ${srcdir}/whichwayisup.desktop $pkgdir/usr/share/applications
}
