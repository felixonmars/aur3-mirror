# Maintainer: Iip Umar Rifai <iip.umar.rifai@gmail.com>
pkgname=hdroidgui-git
pkgver=20150419
pkgrel=1
pkgdesc="Android GUI framework for Harbour"
arch=('i686' 'x86_64')
url="http://kresin.ru/en/hdroid.html"
license=('GPL')
groups=('devel')
depends=()
makedepends=('gcc' 'git' 'jdk7-openjdk' 'android-sdk' 'android-sdk-platform-tools' 'android-tools' 'android-ndk' 'harbour-git')
optdepends=()
provides=('hdroidgui')
conflicts=('hdroidgui')
replaces=()
backup=()
options=('staticlibs')
changelog=
source=(https://github.com/alkresin/HDroidGUI/archive/master.zip)
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/HDroidGUI-master"
	chmod +x ./buildall.sh
	chmod +x ./clear.sh
	chmod +x ./comp.sh
	chmod +x ./ndkbuild.sh
	chmod +x ./setenv.sh
	sed -i 's/\(ANDROID_HOME\s*=\s*\).*$/\1\/opt\/android-sdk/' setenv.sh
	sed -i 's/\(BUILD_TOOLS\s*=\s*\).*$/\1\$ANDROID_HOME\/build-tools\/22.0.1/' setenv.sh
	sed -i 's/\(NDK_HOME\s*=\s*\).*$/\1\/opt\/android-ndk/' setenv.sh
	sed -i 's/\(ANDROID_JAR\s*=\s*\).*$/\1\$ANDROID_HOME\/platforms\/android-22\/android.jar/' setenv.sh
	sed -i 's/\(HRB_BIN\s*=\s*\).*$/\1\/usr\/bin/' setenv.sh
	sed -i 's/\(HRB_INC\s*=\s*\).*$/\1\/include/' setenv.sh
	sed -i "s/read -n1/#read -n1/g" comp.sh
	sed -i "s/\/prebuilt\/linux-x86\//\/prebuilt\/linux-$CARCH\//g" ndkbuild.sh
	#echo "$CARCH"
	./buildall.sh
}

package() {
  cd "$srcdir/HDroidGUI-master"
  install -d "$pkgdir/opt/HDroidGUI"
  cp -r . "$pkgdir/opt/HDroidGUI"
  #find . -type f -not -iname '*/.o' -exec cp '{}' "/$pkgdir/opt/HDroidGUI/{}" ';'
}

