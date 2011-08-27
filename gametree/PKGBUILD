# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=gametree
pkgver=011023
pkgrel=2
pkgdesc="A rebranded Cedega release - requires an archive from https://gametreedeveloper.com/ (free registration)"
arch=('i686')
url="http://gametreelinux.com/"
license=('custom')
depends=('python2' 'gtk2>=2.6' 'glade' 'pygtk' 'dbus-python')
source=(gametree-011023.tgz
        runInstaller.patch
        runGUI.patch
        gametree.patch)
md5sums=('995ec8d2d554cfd4ca16dcd1099c4859'
         'f78f99fc8c18ca612ab719bb163eef7c'
         '4991146111e5f2cee8a89dbf56568887'
         '6ab50f2f64c238ffdaa44f74e9930c0e')
options=('!strip')

package() {
  patch -f "$srcdir/usr/lib/gametree/runInstaller" runInstaller.patch
  patch -f "$srcdir/usr/bin/gametree" gametree.patch
  cp runGUI.patch "$srcdir/usr/lib/gametree"
  cp -r "$srcdir/usr" "$pkgdir"
}

# vim:set ts=2 sw=2 et:

