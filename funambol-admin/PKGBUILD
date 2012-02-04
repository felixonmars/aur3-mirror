# Contributor: Nazarov Pavel <nazarov.pn@gmail.com>

pkgname=funambol-admin
pkgver=10.0.0
pkgbranch=10
pkgrel=1
pkgdesc="Funambol Administration Tool for Funambol Data Synchronization Server"
arch=('i686' 'x86_64')
url="https://www.forge.funambol.org/download/"
license=('AGPL3')
depends=('openjdk6')
source=(http://sourceforge.net/projects/funambol/files/admin-tool/v${pkgbranch}/${pkgname}-${pkgver}.tgz
	funambol-admin
	funambol-admin.desktop)
md5sums=('1dc2b88250a5a594f2287ad3a09f1d4f'
	'f122df0e8a10536dce2ec3e2ae1c26fc'
	'003cdb1f2975c0d6deb47245f3ccaf0f')

build() {
install_dir="opt/${pkgname}"

cd ${srcdir}/Funambol/admin/

  for dir in "docs" "etc" "funamboladmin" "platform6"
  do
    install -d $pkgdir/$install_dir/$dir/
    cp -r ./$dir/* $pkgdir/$install_dir/$dir/
  done

  install -D -m 755 ${srcdir}/funambol-admin $pkgdir/usr/bin/funambol-admin
  install -D -m 755 ./bin/funamboladmin $pkgdir/$install_dir/bin/funamboladmin
  install -D -m 644 ./LICENSE.txt $pkgdir/$install_dir/
  install -D -m 644 ./Readme.unix.txt $pkgdir/$install_dir/

  install -d $pkgdir/usr/share/pixmaps/$pkgname/
  install -D -m 644 ./icons/* $pkgdir/usr/share/pixmaps/$pkgname/
  install -D -m 644 ${srcdir}/funambol-admin.desktop $pkgdir/usr/share/applications/$pkgname.desktop

cd ${pkgdir}

  sed -i 's/default_userdir=".\/user"/default_userdir=`echo $XDG_CONFIG_HOME`\/funambol-admin/' $install_dir/etc/funamboladmin.conf

  # there is no another way to write this config by funambol :(
  chmod 777 $pkgdir/$install_dir/bin/
}

