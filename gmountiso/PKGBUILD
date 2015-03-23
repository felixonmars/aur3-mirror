# Maintainer: Dan Serban
# Contributor: zowki

pkgname=gmountiso
pkgver=0.4.1
pkgrel=1
pkgdesc="A small tool for mounting images as virtual CDs/DVDs (a frontend for mount)"
arch=('any')
url="https://launchpad.net/gmount-iso"
license=('GPLv2')
depends=('libglade' 'python2' 'pygtk')
source=("https://launchpad.net/gmount-iso/trunk/0.4.1/+download/gmountiso_0.4.1.tar.gz")
md5sums=('39cb39667e9714c835c74bd2818a89ca')

package()
{
    cd "$srcdir/gmount-iso"
    mkdir -p $pkgdir/usr/share/{applications,gmountiso,pixmaps}
    cp -r locale $pkgdir/usr/share/
    cp gmount-iso.desktop $pkgdir/usr/share/applications/
    cp {gmount-iso.glade,Gmount-iso.py} $pkgdir/usr/share/gmountiso/
    cp Ico_gmount.png $pkgdir/usr/share/pixmaps/
    sed -i 's# /usr/bin/env python$#/usr/bin/python2#' $pkgdir/usr/share/gmountiso/Gmount-iso.py
}
