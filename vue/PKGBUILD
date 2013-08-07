#Contributor: Wang Feng <wang_feng at live dot com>

pkgname=vue
pkgver=3.2.2
pkgrel=1
pkgdesc="Visual Understanding Environment (VUE) is a tool for managing data with a focus on using digital repositories"
url="http://vue.tufts.edu/index.cfm"
depends=('java-runtime')
source=(
$pkgname
$pkgname.desktop
$pkgname.png
)
arch=('i686' 'x86_64')
license=('ECLv2')

build() {
cd ${srcdir}
wget -c http://releases.atech.tufts.edu/jenkins/job/VUE/64/deployedArtifacts/download/artifact.2/
} 

# package is required
package() {
install -d ${pkgdir}/usr/share/java/$pkgname
install -d ${pkgdir}/usr/share/applications
install -d ${pkgdir}/usr/share/pixmaps
install -d ${pkgdir}/usr/bin

install -m 644 ${srcdir}/index.html ${pkgdir}/usr/share/java/$pkgname/${pkgname}.jar
install -m 755 ${srcdir}/$pkgname ${pkgdir}/usr/bin/
install -m 644 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/
install -m 644 ${srcdir}/$pkgname.png ${pkgdir}/usr/share/pixmaps/

}

md5sums=('887c8810fd2776cffa2fab139511224e'
         '0e3e94439bf682be1e0f896ba2661863'
         '7aa2bf767063cd0e8131d0556106664e')
