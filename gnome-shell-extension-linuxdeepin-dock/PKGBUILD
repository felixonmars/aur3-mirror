# Contributor: xzy3186  <xzy3186 (at) gmail.com>

### PATCH OPTION
_modify="n"    #apply several changes to extension.js as well as the size of png icon.

pkgname=gnome-shell-extension-linuxdeepin-dock
_realname=deepin-gse-dock
pkgver=1.1.8
pkgrel=1
pkgdesc="A dock extension for gnome-shell used by LinuxDeepin"
arch=("i686" "x86_64")
url="http://www.linuxdeepin.com/"
license=("GPL")
depends=("gnome-shell>=3.4.0")
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-gse/${_realname}_${pkgver}_all.deb"
         "current.png"
         "hover.png"
         "press.png"
         "running.png"
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
      cp *.png ${pkgdir}/usr/share/gnome-shell/extensions/dock@linuxdeepin.com/
   fi
}

md5sums=('e4cb925504f0b482b13c034b0a31c5d0'
         'df89cd9dc5e344e7e9c7a314bb713d4c'
         'ec209aee79590deb8632ace3bf038c8f'
         '18403eb100a061c1775f0dd1944d07fd'
         '813683e5d7ae0feff5d5008274928a6f'
         '9719ef082cfd337762158c62d3df1fb4')
