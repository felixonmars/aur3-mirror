# Submitter: Dmitriy Simbiriatin <slpiv@mail.ru>
# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=elegant-gnome
pkgver=1.0
pkgrel=1
pkgdesc="This is a project that provides an automatic configuration of your GNOME desktop just in one click, with the backup and restoring support."
arch=(i686 x86_64)
url="http://gnome-look.org/content/show.php/Elegant+Gnome+Pack?content=127826"
license=('GPL3')
depends=('zenity' 'gtk-engine-murrine' 'ttf-droid' 'gksu')
optdepends=('nautilus-elementary-bzr: for the best look')
makedepends=('pkgconfig')
source=(http://arquivos.somdomato.com/dl/elegant-gnome-1.0.tar.gz)
md5sums=('5edd373a9873a1c7f4f36be665cd858a')

build() {
    cd $srcdir/$pkgname-$pkgver
    make archlinux || return 1
    make DESTDIR=$pkgdir install
}

