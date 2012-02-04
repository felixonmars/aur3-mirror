 
# Contributor: said <atvordhosbn at gmail dot com> 

pkgname=nightmode
pkgver=0.2
pkgrel=1
pkgdesc="A kwin plugin that makes the entire screen darker."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Nightmode?content=123805"
license=('GPL')
depends=('kdebase-workspace')
source=(http://sharpley.org.uk/sites/default/files/software/nightmode/nightmode_0.2.tar.gz)
md5sums=('938e9221a7b261456eed9f7914ad73db')

build() {
    cd  $srcdir/$pkgname
    cmake . -DCMAKE_INSTALL_PREFIX=/$pkgdir/usr || return 1
    make || return 1
    make INSTALL_ROOT=$pkgdir install || return 1 
}
