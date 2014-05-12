# Maintainer: Adam Newby <mastacheif at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>

pkgname=wahcade-bzr
_pkgname=wahcade
pkgver=152
pkgrel=1
pkgdesc="Wah!Cade, Front-end software for arcade cabinets - Development version"
arch=('any')
url="http://code.launchpad.net/~waynemou/wahcade/devel"
license=('GPL')
depends=('python2' 'bash' 'pygtk' 'python2-chardet')
optdepends=('python2-pillow: required for image rotation in layouts'
'gstreamer0.10: required for video & music playback'
'python2-pygame: required for joystick support')
makedepends=('bzr')
conflicts=('wahcade')
source=("$_pkgname::bzr+http://bazaar.launchpad.net/~waynemou/wahcade/devel")
md5sums=('SKIP')

pkgver() {
cd "$srcdir/$_pkgname"

bzr revno
}

prepare() {
cd "$srcdir/$_pkgname"

# Set scripts to run with python2
find -name '*.py' -exec sed -i 's/env python$/python2/' {} \;
sed -i 's/python/python2/g' install

# Adjust install script for installing to pkgdir
sed -e '/\/usr\/share\/applications/d' \
-e "s|PREFIX=/usr/local|PREFIX=$pkgdir/usr|" \
-e 's|cd ${DESTDIR}|cd /usr/share/${NAME}|g' \
-e 's|/usr/share/pixmaps|$PREFIX/share/pixmaps|g' \
-i install
}

package() {
cd "$srcdir/$_pkgname"

# Create directories for the install script
install -d "$pkgdir/usr/"{bin,share/pixmaps}

./install
}
