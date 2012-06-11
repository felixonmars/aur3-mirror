pkgname=craftbukkit-plugin-spout-git
pkgver=20120611
pkgrel=1
pkgdesc="Spout plugin for CraftBukkit (git)"
arch=(any)
url="http://www.spout.org"
license=('LGPL')
depends=('craftbukkit>=1.2.5r4.0')
makedepends=('git' 'maven')
provides=('craftbukkit-plugin-spout')
conflicts=('craftbukkit-plugin-spout')
_gitroot="https://github.com/SpoutDev/SpoutPlugin.git"
_gitname="spoutplugin"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]
	then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."
	rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
	/opt/maven/bin/mvn dependency:purge-local-repository
	/opt/maven/bin/mvn package
}

package() {
	cd "$srcdir/$_gitname-build"
	mkdir -p "$pkgdir/opt/craftbukkit/plugins"
	install -m 644 "$srcdir/$_gitname-build/target/spoutplugin-dev-SNAPSHOT.jar" "$pkgdir/opt/craftbukkit/plugins"
}
