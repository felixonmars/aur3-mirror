# Maintainer: Holger Nahrstaedt

pkgname=scicoslab-bin
pkgver=4.4.1
pkgrel=2
pkgdesc="ScicosLab is a Gtk+ version of Scilab, based on the official Scilab BUILD4 distribution. It contains the newest Scicos."
arch=('i686' 'x86_64')
url="http://www.scicoslab.org/"
provides=('scicoslab=$pkgver')
conflicts=('scicoslab')
depends=('bash' 'tk85' 'gcc-libs' 'libxml2' 'vte' 'libgtkhtml' 'libwebkit')
makedepends=('deb2targz')
license=('custom')
if [ "${CARCH}" = 'i686' ]; then
  filerev=2
  source=("http://cermics.enpc.fr/~jpc/scilab-gtk-tiddly/files/scicoslab-gtk_${pkgver}-${filerev}_i386.natty.deb" \
          "http://cermics.enpc.fr/~jpc/scilab-gtk-tiddly/files/tkdnd1_1.0-1_i386.natty.deb")
  md5sums=('f1a316697f5d1c32614b8765ca1b5fb9'
           '8e35344e5212edfe06bd18dbf2f6f400')
elif [ "${CARCH}" = 'x86_64' ]; then
  filerev=1
  source=("http://cermics.enpc.fr/~jpc/scilab-gtk-tiddly/files/scicoslab-gtk_${pkgver}-${filerev}_amd64.natty.deb" \
          "http://cermics.enpc.fr/~jpc/scilab-gtk-tiddly/files/tkdnd1_1.0-1_amd64.natty.deb")

  md5sums=('6178b273c19e55ffb088bfc1b9dff352'
           '120fd6c0fbbf0b256801975ba9c93dbf')
else
  error Unknown architecture.
  exit 1
fi


build() {
cd ${srcdir}
if [ "${CARCH}" = 'i686' ]; then
  deb2targz scicoslab-gtk_${pkgver}-${filerev}_i386.natty.deb
  tar xvzf scicoslab-gtk_${pkgver}-${filerev}_i386.natty.tar.gz
  deb2targz tkdnd1_1.0-1_i386.natty.deb
  tar xvzf tkdnd1_1.0-1_i386.natty.tar.gz
  
elif [ "${CARCH}" = 'x86_64' ]; then
  deb2targz scicoslab-gtk_${pkgver}-${filerev}_amd64.natty.deb
  tar xvzf  scicoslab-gtk_${pkgver}-${filerev}_amd64.natty.tar.gz
  deb2targz tkdnd1_1.0-1_amd64.natty.deb
  tar xvzf  tkdnd1_1.0-1_amd64.natty.tar.gz
else
  error Unknown architecture.
  exit 1
fi
}
package(){
cp -r usr/ ${pkgdir}
rm -rf ${pkgdir}/usr/bin
rm -rf ${pkgdir}/usr/share/menu

mv ${pkgdir}/usr/lib/scicoslab-gtk-${pkgver} ${pkgdir}/usr/share
#rm -rf ${pkgdir}/usr/lib

rm ${pkgdir}/usr/share/applications/scicoslab.desktop
cp ${pkgdir}/usr/share/scicoslab-gtk-${pkgver}/config/scicoslab-deb.desktop ${pkgdir}/usr/share/applications/scicoslab.desktop


cd ${pkgdir}/usr/share/scicoslab-gtk-${pkgver}/
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g Path.incl
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g ./bin/BEpsf
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g ./bin/Blatexpr
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g ./bin/Blatexpr2
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g ./bin/Blatexprs
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g ./bin/Blpr
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g ./bin/scilab
cd ${pkgdir}/usr/share/
sed -i s_/usr/lib/scicoslab-gtk-${pkgver}_/usr/share/scicoslab-gtk-${pkgver}_g ./applications/scicoslab.desktop

install -d ${pkgdir}/usr/bin/
ln -sf /usr/share/scicoslab-gtk-${pkgver}/bin/scilab ${pkgdir}/usr/bin/scicoslab
ln -sf /usr/share/scicoslab-gtk-${pkgver}/bin/scilab ${pkgdir}/usr/bin/scilab-${pkgver}

install -d ${pkgdir}/usr/lib/
cd ${pkgdir}/usr/lib/
ln -sf ${pkgdir}/usr/lib/libtk8.5.so ${pkgdir}/usr/lib/libtk8.5.so.0
ln -sf ${pkgdir}/usr/lib/libtcl8.5.so ${pkgdir}/usr/lib/libtcl8.5.so.0

}

