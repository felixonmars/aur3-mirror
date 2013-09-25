# Maintainer: Artur Wrona <arturwrona91@gmail.com>

pkgname=insync-beta
pkgver=0.10.11
pkgrel=1
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://support.insynchq.com/forums/discussion/2208/new-insync-version-1-0-22-with-do-not-convert-feature-headless-app"
license=('custom:insync')
options=(!strip)

depends=('xdg-utils' 'glibc' 'gobject-introspection')
optdepends=('insync-beta-ubuntu: file-manager integration for GNOME'
'insync-beta-cinnamon: file-manager integration for Cinnamon'
'insync-beta-kde: file-manager integration for KDE'
'insync-beta-xfce: file-manager integration for XFCE'
'insync-beta-mate: file-manager integration for MATE'
)

arch=('i686' 'x86_64')
if [ "$CARCH" = 'i686' ]; then
   source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_i386.deb")
   sha256sums=('9ce5a25b9292b37208fb8b02793a78af95205b7c6a9135e6aaa93b5dd7469768')
elif [ "$CARCH" = "x86_64" ]; then
   source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_amd64.deb")
   sha256sums=('93a052b18aa41710f060304d4d9bb062b261a539a4f1125449e1cdb49ac46caf')
fi
noextract=("${pkgname}-${pkgver}.deb")

source=("${source[@]}"
        "insync.service")

sha256sums=("${sha256sums[@]}"
            "0e302d4f1ce95a3838381094817b542505b8b9fe024aa01cca227d6184bb1f92")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir

   cd $pkgdir
   for file in $(grep -R "/usr/bin/python" . | cut -f1 -d :)
   do
      sed -i "s|usr/bin/python$|usr/bin/python2|g" $file
   done
   mkdir -p ${pkgdir}/usr/lib/systemd/system
   sed "s/_OPTION/ start/g" ${srcdir}/insync.service >${pkgdir}/usr/lib/systemd/system/insync@.service
}
