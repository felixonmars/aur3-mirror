# Contributor:		osily <ly50247@gmail.com>
# Maintainer: vicky91 <vickypaiers@gmail.com>
pkgname=lrcshow-x
_realname=lrcShow-X
pkgver=2.1.1
_id=103055
pkgrel=2
pkgdesc="It's a lyrics plugins written by pyqt4, supporting Amarok2, Qmmp, Audacious and other Linux Players with full dbus interface functions"
arch=('any')
url="http://www.kde-apps.org/content/show.php?content=103055"
license=('GPL')
depends=('python2-pyqt' 'python2-gobject')
source=("http://www.kde-apps.org/CONTENT/content-files/$_id-${_realname}_2_1_1.tar.bz2")

build() {
cd "${srcdir}/${_realname}"
sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python2|' \
           -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|' \
               $(find . -name '*.py')
install -d "${pkgdir}/usr/bin"
install -d "${pkgdir}/usr/share/"
cp -r "${srcdir}/${_realname}/" "${pkgdir}/usr/share/"
echo '#!/bin/bash' > ${startdir}/lrcShow-X
echo 'cd /usr/share/lrcShow-X/' >> ${startdir}/lrcShow-X
echo './lrcShow-X.py "$@" ' >> ${startdir}/lrcShow-X
echo 'exit 0' >> ${startdir}/lrcShow-X
install -D -m755 "${startdir}/lrcShow-X" "${pkgdir}/usr/bin/lrcShow-X"
rm ${startdir}/lrcShow-X
}
md5sums=('22a3c37665c853e7d637c96bfcc6bc7a')

