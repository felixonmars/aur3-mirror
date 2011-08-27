# Contributor: Michael Basil <michael@ashtonbrsc.co.uk>
pkgname=google-appengine-wx-launcher-svn
pkgver=7
pkgrel=1
pkgdesc="GUI launcher for Google App Engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/google-appengine-wx-launcher/"
license=('Apache')
groups=()
depends=(google-appengine-python wxpython)
makedepends=(subversion)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(profile.google-appengine-wx-launcher-svn google-appengine-wx-launcher-svn.desktop google-appengine-wx-launcher-svn.install)
noextract=()
md5sums=('c0711ab5c0bf70394c849e4852e2d533'
         '0c19d1e5e427e3fadcec2f15facedfb0'
         'd3769cb6770948ae753edcefb8938377')

_svntrunk=http://google-appengine-wx-launcher.googlecode.com/svn/trunk/
_svnmod=google-appengine-wx-launcher-svn

build() {
msg "Starting SVN checkout..."
  cd ${srcdir}
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
msg "SVN checkout done or server timeout"

chmod +x google-appengine-wx-launcher-svn/GoogleAppEngineLauncher.py

cd "$startdir/src"
mkdir -p $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt} || return 1
cp -R ${pkgname}/ "$startdir/pkg/opt/$pkgname"
find ${pkgdir} -name ".svn" -type d -exec rm -fr {} +

install -D -m755 profile.google-appengine-wx-launcher-svn "$startdir/pkg/etc/profile.d/google-appengine-wx-launcher-svn.sh"
install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/ || return 1
install -m644 $srcdir/$pkgname/images/AppEngine.png $pkgdir/usr/share/pixmaps/${pkgname}-icon.png || return 1


}
