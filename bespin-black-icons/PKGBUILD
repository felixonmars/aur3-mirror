# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=bespin-black-icons
pkgver=1085
pkgrel=1
pkgdesc="Bespin Black Icon Theme for KDE4"
arch=('i686' 'x86_64')
url='http://kde-look.org/content/show.php/Bespin?content=63928'
license=(LGPL)
depends=()
source=("http://dl.dropbox.com/u/6810192/Bespin-Black.tar.gz")
md5sums=('1b33269f86983009ed5248d0532a2d48')



build() {
    cd $srcdir

    install -d $pkgdir/usr/share/icons/Bespin-Black


# Install the data
    cp -r $srcdir/Bespin-Black/* $pkgdir/usr/share/icons/Bespin-Black

}
