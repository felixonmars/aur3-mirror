# $Id: PKGBUILD,v 1.5 2006/05/28 07:24:21 ganja_guru Exp $
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>
pkgname=mgm
pkgver=1.1
pkgrel=2
pkgdesc="The Moaning Goat Meter"
arch=(i686 x86_64)
license=('custom:public domain')
depends=('glibc' 'perl' 'perltk')
source=(http://linuxmafia.com/mgm/mgm-$pkgver.tgz)
md5sums=('a32df322895fc1828b831de4a231f770')
url="http://linuxmafia.com/mgm/"

build() {
   cd $startdir/src/mgm-1.1.cvs.20020221/modules/linux
   mkdir -p $startdir/pkg/opt/ $startdir/pkg/usr/bin
   cp -a $startdir/src/mgm-1.1.cvs.20020221 $startdir/pkg/opt
   mv $startdir/pkg/opt/mgm-1.1.cvs.20020221 $startdir/pkg/opt/mgm
   ln -s /opt/mgm/mgm $startdir/pkg/usr/bin/mgm
   install -D -m644 ../../LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
