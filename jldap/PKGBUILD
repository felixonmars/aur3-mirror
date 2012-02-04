# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(jldap)
pkgver=2009.10.07
pkgrel=1
pkgdesc="LDAP Classes for Java* enable you to write applications that access, manage, and update information stored in Novell eDirectory or other LDAP-aware directories."
arch=('i686' 'x86_64')
url="http://developer.novell.com/wiki/index.php/Jldap"
license=('custom:OpenLDAP Public License')
depends=('java-runtime')
source=("http://jloxim.mimuw.edu.pl/redmine/attachments/download/22")
md5sums=('29f44a3dedb5383dda07b88e40d3c759')

build() {
  cd $srcdir/novell-$pkgname-devel-$pkgver-1unix

  sed -e 's:^LIBPATH.*:LIBPATH="/usr/share/java/jldap":' -e '16,19 d' -i bin/*[^bat]

  mkdir -p $pkgdir/usr/share/java/jldap/debug || return 1
  mkdir -p $pkgdir/usr/share/licenses/jldap || return 1
  mkdir -p $pkgdir/usr/share/doc/jldap || return 1
  mkdir -p $pkgdir/usr/bin || return 1

  cp lib/*.jar $pkgdir/usr/share/java/jldap || return 1
  cp lib_debug/*.jar $pkgdir/usr/share/java/jldap/debug || return 1
  cp COPYRIGHT LICENSE $pkgdir/usr/share/licenses/jldap || return 1
  cp -a README.txt SDK* samples $pkgdir/usr/share/doc/jldap || return 1
  cp bin/*[^bat] $pkgdir/usr/bin || return 1

}
