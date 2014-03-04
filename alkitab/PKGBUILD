# Contributor: gnud <ach.gnud@gmail.com>
# Maintainer: The Ringmaster <theringmaster@archlinux.us>
pkgname=alkitab
pkgver=2.9.1
pkgrel=1
pkgdesc="Bible study software"
arch=('i686' 'x86_64')
license=('custom')
depends=('java-runtime')
url="http://www.kiyut.com/products/alkitab/developer"
source=(
        http://www.kiyut.com/products/${pkgname}/${pkgname}.zip
        http://www.kiyut.com/products/${pkgname}/LICENSE-${pkgname}.txt
        patch.alkitab)
md5sums=(
         'dec3f05d9f97d13fde7163d34552ea1c' 
         '17dbdd02bead49be73f5f731b48c01f0'
         'b73935c33e992c9b5f3f75fef56a268c')

build() {
cd ${srcdir}

#create installation template
echo "INSTALL_PATH=${pkgdir}/opt/${pkgname}" > template
java -jar setup.jar -options template

#set up system wide book configuration
#this path is added to the per-user-config in the modified launcher script
install -d ${pkgdir}/opt/${pkgname}/books
#for some weird reason (aka installer bug),
#the books dont pick up the path set via the template
cp -R \$UserPathPanelVariable/* ${pkgdir}/opt/${pkgname}/books

#patch startup file to insert book directory
patch ../pkg/opt/alkitab/bin/alkitab patch.alkitab

# copy license file
install -Dm644 ${srcdir}/LICENSE-${pkgname}.txt \
${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-${pkgname}.txt

 #set up symlink for launcher
install -d ${pkgdir}/usr/bin
cd ${pkgdir}/usr/bin
ln -s ../../opt/${pkgname}/bin/${pkgname} ${pkgname}
}
