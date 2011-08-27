# Contributor: William Rea <sillywilly@gmail.com>
pkgname=nihongobenkyo
pkgver=0.3.1
pkgrel=4
pkgdesc="A japanese dictionary and learning tool"
arch=('i686' 'x86_64')
url="http://www.nihongobenkyo.org"
license=('GPL')
depends=('ruby-libglade' 'ruby-gtk2' 'libxml2' 'ruby-sqlite3' 'ruby-gettext')
makedepends=('intltool' 'pkgconfig' )
source=(http://rubyforge.org/frs/download.php/7835/$pkgname-$pkgver.tar.gz \
        $pkgname.desktop)
md5sums=('7a43fcd01994f8928ab40336c9008eaf' '101f420cbf816b924c84f7720b02d4e9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg

  mkdir -p $startdir/pkg/usr/share/pixmaps
  ln -s ../$pkgname/icons/$pkgname.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m644 ../$pkgname.desktop \
                   $startdir/pkg/usr/share/applications/$pkgname.desktop
}
