# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Vincent Szolnoky <ippytraxx@installgentoo.com>

pkgname=squirrel-sql
pkgver=3.6.0
_pkgver=3.6
pkgrel=1
pkgdesc="A graphical Java program to manage JDBC databases."
arch=("i686" "x86_64")
url="http://www.squirrelsql.org/"
license=("LGPL2")
depends=("java-runtime")
source=("http://sourceforge.net/projects/squirrel-sql/files/1-stable/${pkgver}-plainzip/squirrelsql-${_pkgver}-optional.zip"
        "squirrel-sql.sh"
        "squirrel-sql.desktop")
noextract=("download")
md5sums=('007c360173f25dc9853c1284ea002896'
         '1d049bf9ad680a50c6e336590687a5bf'
         '56bf784a820c5c904e648aa45ac37647')

package()
{
    # Install files to /opt which is better suited than /usr/share
    mkdir -p $pkgdir/opt/squirrel-sql
    mv $srcdir/squirrelsql-${_pkgver}-optional/* /$pkgdir/opt/squirrel-sql

    # Remove original installer and unecessary Windows files
    rm $pkgdir/opt/squirrel-sql/squirrel-sql.bat
    rm $pkgdir/opt/squirrel-sql/addpath.bat

    # Install binaries
    chmod 755 $pkgdir/opt/squirrel-sql/squirrel-sql.sh
    install -m 755 -D $srcdir/squirrel-sql.sh $pkgdir/usr/bin/squirrel-sql

    # Licenses seem to not be included anymore
    # Copy licenses
    #mkdir -p $pkgdir/usr/share/licenses/squirrel-sql/
    #install -m 644 $pkgdir/opt/squirrel-sql/doc/licences/* $pkgdir/usr/share/licenses/squirrel-sql/

    # Copy icon
    install -m 644 -D $pkgdir/opt/squirrel-sql/icons/acorn.ico $pkgdir/usr/share/pixmaps/acorn.ico

    # Install menu item
    install -m 644 -D $srcdir/squirrel-sql.desktop $pkgdir/usr/share/applications/squirrel-sql.desktop
}