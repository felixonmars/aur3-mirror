# Maintainer: Mizki Suzumori <mizki9577 at gmail dot com>
pkgname=mikutter-git
pkgver=3.1.0_alpha1_2328
pkgrel=1
epoch=1
pkgdesc="a moest mikutter client (git version)"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
#depends=('ruby-gtk2')
optdepends=('libnotify: notify support')
makedepends=('git')
provides=('mikutter')
conflicts=('mikutter' 'mikutter-svn')
source=('git://toshia.dip.jp/mikutter.git#branch=develop')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/mikutter
	ver=$(git describe --tags | sed -e 's/-/_/g')
	rev=$(git rev-list --all | wc -l)
	echo "${ver}_${rev}"
}

package() {
	mkdir $pkgdir/opt
	cp -R $srcdir/mikutter $pkgdir/opt
	rm -R $pkgdir/opt/mikutter/.git
	mkdir -p $pkgdir/usr/bin
	cat <<EOF > $pkgdir/usr/bin/mikutter
#!/bin/sh
ruby /opt/mikutter/mikutter.rb $@
EOF
	chmod a+x ${pkgdir}/usr/bin/mikutter
}

# vim:set ts=4 sw=4 ft=sh:
