# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Olivier Radisson <olivier.radisson@insa-lyon.fr>
pkgname=publiphoto
pkgver=1.0
pkgrel=0
epoch=
pkgdesc="Help you to publish your photos. Can resize, add a label and rename a group of pictures."
arch=('i686' 'x86_64')
url="http://contact.oradisson.fr"
license=('GPL')
groups=()
depends=('python>=3.3','python-gobject','python-pillow')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

git_pkg_repo=https://github.com/takuyozora/publiphoto.git
git_name=publiphoto

package() {
	cd "$srcdir/"
	
	rm -rf $git_name
	
	git clone $git_pkg_repo
	cd $git_name
  
    pwd
	
	mkdir -p "$pkgdir/usr/bin"
	mv env/publiphoto "$pkgdir/usr/bin/"
	
	mkdir -p "$pkgdir/usr/share/applications/"
	mv env/publiphoto.desktop "$pkgdir/usr/share/applications/"
	
	mkdir -p "$pkgdir/usr/share/publiphoto"
	mv src "$pkgdir/usr/share/publiphoto/"
	mv publiphoto.py "$pkgdir/usr/share/publiphoto/"
	
	cd po
	for i in *; do
		if [ -d "$i" ]; then
			echo "Locale : $i"
			mkdir -p "$pkgdir/usr/share/locale/$i/LC_MESSAGES"
			mv "$i/LC_MESSAGES/publiphoto.mo" "$pkgdir/usr/share/locale/$i/LC_MESSAGES/publiphoto.mo"
		fi
	done
	cd ../
	
	mkdir -p "$pkgdir/usr/local/share/file-manager/actions"
	mv env/nautilus/publiphoto-action.desktop "$pkgdir/usr/local/share/file-manager/actions"
}
