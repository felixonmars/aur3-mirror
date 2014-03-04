# Maintainer: Your Name <youremail@domain.com>
pkgname=slipstream-mod-manager-git
pkgver=155.9d4a12e
pkgrel=1
pkgdesc="Slipstream is a mod manager for the game FasterThanLight (FTL), making it easy to install multiple mods at the same time and, later, revert to vanilla gameplay."
arch=("any")
url="https://github.com/Vhati/Slipstream-Mod-Manager"
license=('GPL')
depends=("java-runtime")
makedepends=("java-environment" "maven" "git")
checkdepends=()
source=("sm::git+https://github.com/Vhati/Slipstream-Mod-Manager.git")

#prepare() {
#	cd "$srcdir/sm"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$srcdir/sm"
        mvn clean package
#	./configure --prefix=/usr
#	make

}

#check() {
#	cd "$srcdir/$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$srcdir/sm"
	install -d "$pkgdir/usr/share/java/slipstream-mod-manager"
        install "target/modman.jar" "$pkgdir/usr/share/java/slipstream-mod-manager"

        # allow users in group games to drop mods and config there
        install -g games -d -m775 "$pkgdir/usr/share/java/slipstream-mod-manager/files/"
        install -g games -d -m775 "$pkgdir/usr/share/java/slipstream-mod-manager/files/mods"
        for i in "skel_common/mods/"*; do
                install "$i" "$pkgdir/usr/share/java/slipstream-mod-manager/files/mods"
        done
        install -g games -d -m775 "$pkgdir/usr/share/java/slipstream-mod-manager/files/backup"

        
        # ACTUALLY get the absolute path
        sed -i "s/dirname/realpath/g" "skel_unix/modman-cli.sh"
        sed -i 's#cd "${maindir}";#cd "$(dirname ${maindir})/files"#g' "skel_unix/modman-cli.sh"
        
        # use java from java_home
        sed -i 's;^java -jar ;"$JAVA_HOME/bin/java" -jar ../;g' "skel_unix/modman-cli.sh"

        for i in "skel_unix/"*; do
                install "$i" "$pkgdir/usr/share/java/slipstream-mod-manager/"
        done

        install -d "$pkgdir/usr/bin"
        ln -s /usr/share/java/slipstream-mod-manager/modman-cli.sh "$pkgdir/usr/bin/slipstream-mod-manager"
}

pkgver() {
  cd "$srcdir/sm"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP')
