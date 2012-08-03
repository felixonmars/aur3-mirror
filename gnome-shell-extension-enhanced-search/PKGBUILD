# Contributor: xzy3186  <xzy3186 (at) gmail.com>

### PATCH OPTION
_modify="n"    #apply several changes to extension.js as well as the size of png icon.

pkgname=gnome-shell-extension-enhanced-search
_realname=deepin-gse-enhanced-search
pkgver=1.1.8
pkgrel=1
pkgdesc="An enhanced-search engine extension for gnome-shell used by LinuxDeepin"
arch=("i686" "x86_64")
url="http://www.linuxdeepin.com/"
license=("GPL")
depends=("gnome-shell>=3.4.0")
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-gse/${_realname}_${pkgver}_all.deb"
        "dictcn.png"
        "verycd.png"
        "pkg.png"
        "modify.patch")

build() {
   cd ${srcdir}
   ar x ${_realname}_${pkgver}_all.deb
   tar -xvzf data.tar.gz
   if [ $_modify = "y" ]; then
      msg "apply patch to modify the original extension.js"
      patch -p0 -i "${srcdir}/modify.patch"
   fi
}

package() {
   cp -r ${srcdir}/usr ${pkgdir}/usr
   if [ $_modify = "y" ]; then
      cp *.png ${pkgdir}/usr/share/gnome-shell/extensions/enhanced-search@linuxdeepin.com/
   fi
}

md5sums=('45a448cbb574737118b629ed7f3ef15d'
         '54221dc785c4c330a5cda250f6b9f84c'
         'dfe2654e518bc5a995968e777cde441c'
         'e1be2565a8930256acc9fcccabc8dd01'
         '4d8e464c48ce3dcd7f26208761c9c251')
