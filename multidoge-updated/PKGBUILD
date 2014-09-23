# Maintainer Filip Brcic < brcha at gna dot org >
# Original maintainer Alex Talker < Alextalker at openmailbox dot com >
# Contributor bitwave < aur [at] oomlu [d0t] de >
pkgname=multidoge-updated
pkgver=0.1.3
pkgrel=1
pkgdesc="Java-based DogeCoin client"
arch=('i686' 'x86_64')
url="http://multidoge.org"
license=('GPL')
conflicts=('multidoge')
provides=('multidoge')
depends=('java-runtime' 'bash')
#https://github.com/langerhans/multidoge/releases/download/v0.1.2/multidoge-0.1.2-linux.jar
source=("https://github.com/langerhans/multidoge/releases/download/v${pkgver}/multidoge-${pkgver}-linux.jar"
        multidoge
        install.properties
        multidoge.desktop
        dogecoin.png)
md5sums=('e2d4ea4596af16e746e10b3159bd0127'
         '937bebe7bdda35b2089415fbe0c79926'
         'ecb77c4f6857760ac0bb278b2771ee1c'
         'd66bfe1d4f5856dccc93e7e63d3f9f4d'
         'de465c84e7b5169b6b2aa77d4948adb6')
noextract=("multidoge-${pkgver}-linux.jar")
package() {
	msg "Install package..."
	cd ${srcdir}
	#bugfix causing the izpack installer to return an error
	java -jar multidoge-${pkgver}-linux.jar -options install.properties || echo

	install -Dm 644 tmp-install/multidoge-exe.jar ${pkgdir}/usr/share/java/multidoge/multidoge.jar
	install -Dm 755 multidoge ${pkgdir}/usr/bin/multidoge

        install -Dm 644 multidoge.desktop ${pkgdir}/usr/share/applications/multidoge.desktop
        install -Dm 644 dogecoin.png ${pkgdir}/usr/share/pixmaps/multidoge.png

	msg "Done!"
}
