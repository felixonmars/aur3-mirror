# Maintainer: <kfgz at interia dot pl>

pkgname=smbc-cvs
pkgver=1.2.3
pkgrel=1
pkgdesc="Ncurses samba protocol browser"
arch=('i686' 'x86_64')
#url="http://smbc.airm.net/pl/index.php"
url="http://sourceforge.net/projects/smbc/"
license=('GPL')
depends=('smbclient' 'ncurses')
source=(http://kfgz.mydevil.net/smbc-2005-11-01_07-16.tgz)
md5sums=('fd07d4ace789e6515c6f3ec22d9bae4f')

build() {
  cd "${srcdir}/smbc-2005-11-01_07-16/src"
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" winpopup.c
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" fnet.c
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" smb-pack.c
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" smb-pack.h
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" smbc.c 
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" dulist.c
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" find-index-manage.c
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" bookmarks.c
  sed -i "s|libsmbclient.h|samba-4.0/libsmbclient.h|g" ttlist.c
  cd "${srcdir}/smbc-2005-11-01_07-16"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/smbc-2005-11-01_07-16"
  make DESTDIR="${pkgdir}" install
}
