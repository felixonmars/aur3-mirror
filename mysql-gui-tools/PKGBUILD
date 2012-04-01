# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>
# Contributor: Alfredo Amatriain <geralt@gmail.com>
# Contributor: Francisco Lopes <chico.lopes@gmail.com>

pkgname=mysql-gui-tools
pkgver=5.0r14
pkgrel=6
arch=('i686' 'x86_64')
pkgdesc="Set of programs to manage and interact with a MySQL server."
url="http://www.mysql.com/products/tools/"
license=('GPL')
source=(http://ftp.sunet.se/pub/unix/databases/relational/mysql/Downloads/MySQLGUITools/$pkgname-$pkgver.tar.gz
        bad-char.patch
        mysql-gui-tools-sigc_2.1.1_api_fixes.diff
        mysql-gui-tools-5.0_p12-deprecated-gtk+-api.patch
        mysql-gui-tools-gcc43.patch
        mysql-gui-tools-schema-change-freeze.patch
        mysql-gui-tools-5.0r14-common.patch
        mysql-administrator mysql-query-browser
        is-num-field-macro.patch
        deprecated-gtk-widget-state.patch
        global-header-detection-fix.patch)
md5sums=('b8efefbf20b7264c8f3afd34424467d7'
         '4279c75bb5e6c2bfcb16c98817d55b80'
         '4625629385142862cd01d37f814d5e80'
         '33205d45329ab4fa4096b6b298a60b2c'
         '1368384dac87bc0a64adb774ab2e6cbd'
         'd2f5a0405cbf7430bffb4c5c83ae5b34'
         'e0c66b81577999392e9abfbc02f45373'
         '4d189c20835735aa91d078c26cae11c6'
         '0ccdfaa3b8405f8405fef45060130b62'
         '2b33e3008d7ef80abca79b0828ce5d70'
         '59d69215d9f38d2ceb3153290899c193'
         'c1ab3ba0922a0d72a9056646c6b2c32e')
depends=('gtkmm' 'gtkhtml' 'libmysqlclient' 'libgnome' 'libglade')
replaces=('mysql-administrator' 'mysql-query-browser')
conflicts=('mysql-administrator' 'mysql-query-browser')
provides=('mysql-gui-common' 'mysql-administrator' 'mysql-query-browser')
makedepends=('pkgconfig' 'lua' 'libxml2' 'libgnomeprint')

build() {
   cd "$srcdir/$pkgname-$pkgver"

   # Patches to make 5.0r14 compile:
   patch -Nsup1 -i "$srcdir/bad-char.patch"
   patch -Nsup1 -i "$srcdir/mysql-gui-tools-sigc_2.1.1_api_fixes.diff"
   patch -Nsup1 -i "$srcdir/mysql-gui-tools-gcc43.patch"
   patch -Nsup0 -i "$srcdir/mysql-gui-tools-5.0_p12-deprecated-gtk+-api.patch"
   patch -Nsup0 -i "$srcdir/mysql-gui-tools-schema-change-freeze.patch"
   patch -Nsup1 -i "$srcdir/mysql-gui-tools-5.0r14-common.patch"
   patch -Nsup1 -i "$srcdir/is-num-field-macro.patch"
   patch -Nsup1 -i "$srcdir/deprecated-gtk-widget-state.patch"
   patch -Nsup1 -i "$srcdir/global-header-detection-fix.patch"

   # Replacement for GTKSourceMarker:
   cd "$srcdir/$pkgname-$pkgver/query-browser/source/linux/gtksourceview/gtksourceview"
   sed -i 's/G_CONST_RETURN/const/g' gtksourcemarker.c gtksourcemarker.h

   cd "$srcdir/$pkgname-$pkgver/common"
   sh autogen.sh --prefix=/usr --datarootdir=/usr/share
   make

   ln -s "$srcdir/$pkgname-$pkgver/common" \
      "$srcdir/$pkgname-$pkgver/mysql-gui-common"

   cd "$srcdir/$pkgname-$pkgver/administrator"
   sh autogen.sh --prefix=/usr --datarootdir=/usr/share
   make

   cd "$srcdir/$pkgname-$pkgver/query-browser"
   sh autogen.sh --prefix=/usr --datarootdir=/usr/share --with-gtkhtml=libgtkhtml-3.14
   make CFLAGS="$CFLAGS -D_GNU_SOURCE"

}

package() {
   cd "$srcdir/$pkgname-$pkgver/common"
   make DESTDIR="$pkgdir" install

   cd "$srcdir/$pkgname-$pkgver/administrator"
   make DESTDIR="$pkgdir" install

   cd "$srcdir/$pkgname-$pkgver/query-browser"
   make DESTDIR="$pkgdir" install

   # Fixed startup scripts:
   install -m755 $srcdir/mysql-administrator $pkgdir/usr/bin
   install -m755 $srcdir/mysql-query-browser $pkgdir/usr/bin
}

# vim: set ft=sh expandtab ts=3 sw=3 tw=0:
