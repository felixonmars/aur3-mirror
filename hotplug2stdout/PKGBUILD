# Maintainer: kfgz <kfgz at interia pl>

pkgname=hotplug2stdout
pkgver=1.2.1
pkgrel=1
pkgdesc="Tool for reading kernel uevents to stdout."
arch=('i686' 'x86_64')
url="http://www.bellut.net/projects.html"
license=('other')
_md5sum=9d485571e66543a1e4a1eeb832a5b272

build() {
  cd "${startdir}"
  if [ -e ${pkgname}-${pkgver}.tar.gz ]; then
    if [ ${_md5sum} != `md5sum ${pkgname}-${pkgver}.pet | awk '{print $1}'` ]; then error "Md5sum is incorrect!" && exit; fi
    ln -sf "${startdir}"/${pkgname}-${pkgver}.tar.gz "${srcdir}"/${pkgname}-${pkgver}.tar.gz
    cd "${srcdir}"
    tar -xzf "${srcdir}"/${pkgname}-${pkgver}.tar.gz
  else
    wget --user=puppy --password=linux http://bkhome.org/sources/alphabetical/h/${pkgname}-${pkgver}.tar.gz
    if [ ${_md5sum} != `md5sum ${pkgname}-${pkgver}.pet | awk '{print $1}'` ]; then error "Md5sum is incorrect!" && exit; fi
    ln -sf "${startdir}"/${pkgname}-${pkgver}.tar.gz "${srcdir}"/${pkgname}-${pkgver}.tar.gz
    cd "${srcdir}"
    tar -xzf "${srcdir}"/${pkgname}-${pkgver}.tar.gz
  fi
  cd "${srcdir}"/${pkgname}-${pkgver}
  gcc -o hotplug2stdout hotplug2stdout.c
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -d -m755 "${pkgdir}"/usr/bin
  install -m755 ${pkgname} "${pkgdir}"/usr/bin/
  install -m755 cddetect_quick "${pkgdir}"/usr/bin/
}
