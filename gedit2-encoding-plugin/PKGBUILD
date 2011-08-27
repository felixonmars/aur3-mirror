pkgname="gedit2-encoding-plugin"
pkgver=0.1
pkgrel=2
pkgdesc="Reopen file with different encoding"
url="https://bugzilla.gnome.org/show_bug.cgi?id=342918"
license=("custom")
arch=('any')
depends=('gedit<3' 'pygtk' 'python2-gconf')
source=("encoding.tar::http://bugzilla-attachments.gnome.org/attachment.cgi?id=108326")

build() {
    cd $srcdir
    install -d $pkgdir/usr/lib/gedit-2/plugins
    install -m644 encoding.gedit-plugin encodingpy.py $pkgdir/usr/lib/gedit-2/plugins
}

md5sums=('9e3aac383b7d9a14236ce9acfc38c749')
