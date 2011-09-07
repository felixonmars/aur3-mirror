# Contributor: Jérôme Poulin <jeromepoulin@gmail.com>

pkgname=python2-lvm-manager
pkgver=0.1
pkgrel=0
pkgdesc="PyGTK GUI application to manage LVM using python-lvm."
arch=('i686' 'x86_64')
url="http://code.google.com/p/python-lvm/"
license=('BSD')
depends=('python2' 'python2-distribute' 'python2-lvm' 'gnome-python' 'pygoocanvas')
source=(http://python-lvm.googlecode.com/files/python-lvm-manager-$pkgver.tar.gz)
md5sums=('8ae36774f2b587aff8d8c579e422638e')

build() {
    cd "$srcdir/python-lvm-manager-$pkgver/"
    # Use Gnome theme instead of Ubuntu's.
    sed -r -i -e 's:/icons/Human/:/icons/gnome/:' src/lvmman/gui/main.py
    sed -r -i -e 's:/env python:/env python2:' src/lvmman/lvm-manager.py
    python2 ./setup.py install --root="$pkgdir/" --optimize=1
}

package() {
    install -D -m755 "$srcdir/python-lvm-manager-$pkgver/src/lvmman/lvm-manager.py" "$pkgdir/usr/bin/lvm-manager.py"
}

# vim:set ts=2 sw=2 et:
