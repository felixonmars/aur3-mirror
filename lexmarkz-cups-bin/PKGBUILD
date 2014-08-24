# Maintainer: webjdm <web.jdm@gmail.com>

pkgname=lexmarkz-cups-bin
_pkgname=lexmarkz-cups
pkgver=1
pkgrel=10
pkgdesc="Lexmark Z35, Z55, Z65, Z600 and Z700 Printer Drivers for CUPS"
arch=('i686' 'x86_64')
url="http://www.lexmark.com/"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
	depends=('cups' 'lib32-krb5' 'lib32-libcups' 'lib32-gnutls' 'lib32-libstdc++5' 'lib32-sqlite3')
else
	depends=('cups') # 'libstdc++5' 'sqlite3'
fi
makedepends=('rpmextract')
conflicts=('z600' 'lexmarkz-cups' 'cjlz35le-cups' 'cups-lexmark-700')
install=lexmarkz-cups.install
source=(http://webjdm.free.fr/archlinux/${_pkgname}/${_pkgname}-RPM.tar.gz \
	'lexmark-eula.txt')
md5sums=('711821c160e81ddf58d33f204c12e0dc'
         '1cafb6e6ba400142ae23bfaff1009e3f')

build() {
  cd $srcdir/
  mkdir -p $pkgname
  mv -v *.rpm $pkgname
  cd $pkgname

  # To reduce the number of drivers replace *.rpm with
  # the explicit version/versions you need
  for i in *.rpm; do
       rpmextract.sh $i
  done
}

package() {
  cd $srcdir/${pkgname}
  
  mv usr/ $pkgdir

  cd $pkgdir
  # Finally: removing useless folders and files
  rm -Rf usr/local/z700cups
  rm -Rf usr/include
  rm -Rf usr/lib/cups/backend
  find . -name '*.la' -exec rm {} \;
  
  # Fix 32-Bit drivers for 64-Bit users
  if [ "$CARCH" = "x86_64" ]; then
	mkdir -p opt/lib32/usr/lib
	cp usr/lib/*.* opt/lib32/usr/lib
  fi
 
  # Install license
  install -D -m644 $srcdir/lexmark-eula.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
