# Maintainer: Oliver Giles <ohwZgilesXgmailZcom>
pkgname=libunihan
pkgver=0.5.3
pkgrel=1
pkgdesc="A C library for Unihan character database in 5NF"
arch=('i686' 'x86_64')
url="http://libunihan.sourceforge.net/"
license=('LGPL2')
depends=('glib2' 'sqlite3')
source=(
   "http://downloads.sourceforge.net/$pkgname/libUnihan-$pkgver-Source.tar.gz"
   "http://downloads.sourceforge.net/$pkgname/UnihanDb-5.1.0-7.tar.gz"
   )
md5sums=('126cc5dcbc40d765f02b290ec31deaec'
         '441d91531f1c71c2c4864feae081769e')

build() {
   cd "$srcdir/libUnihan-$pkgver-Source"
   # if you have doxygen, the cmake rules will require the installation of the
   # generated documentation. Instead of requiring doxygen, remove the offending rule
   sed 162,164d -i CMakeLists.txt
   cmake -DCMAKE_INSTALL_PREFIX=/usr

   make rebuild_cache
   make
}

package() {
   cd "$srcdir/libUnihan-$pkgver-Source"
   make DESTDIR="$pkgdir/" install
   install -D -m644 "$srcdir/UnihanDb-5.1.0-7/Unihan.db.5.1.0-7" "$pkgdir/usr/share/UnihanDb/Unihan.db.5.1.0-7"
   ln -sf Unihan.db.5.1.0-7 "$pkgdir/usr/share/UnihanDb/Unihan.db"
   install -D -m644 "$srcdir/UnihanDb-5.1.0-7/README-db" "$pkgdir/usr/share/doc/$pkgname-$pkgver/UnihanDb/README"
   install -D -m644 "$srcdir/UnihanDb-5.1.0-7/ChangeLog-db" "$pkgdir/usr/share/doc/$pkgname-$pkgver/UnihanDb/ChangeLog"
}

