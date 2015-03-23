# Maintainer: SSF <punx69 at gmx dot net>

pkgname=xfce4-radio-plugin-git
pkgver=0.5.1.r75.g0ba775c
pkgrel=1
pkgdesc="Xfce panel plugin which allows you to control your V4l radio device"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-radio-plugin"
license=('BSD')
depends=('xfce4-panel' 'libxfcegui4')
provides=("xfce4-radio-plugin=$pkgver")
makedepends=('intltool' 'pkg-config' 'autoconf' 'automake' 'make' 'gcc' 'perl-xml-parser' 'xfce4-dev-tools' 'git' 'patch' 'diffutils' 'coreutils')
source=("$pkgname::git://git.xfce.org/panel-plugins/xfce4-radio-plugin#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	ver=$(git describe --long | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g')
	printf "$ver"
}

build() {
	cd "$srcdir/$pkgname"
	#patch from debian: https://tracker.debian.org/pkg/xfce4-radio-plugin
	ver=$(cat NEWS|awk 'NR==4 {print $1}'|tr -d '[a-zA-Z+§$%&/()=?]')
	if [ "$ver" = "0.5.1" ]; then
		msg "adding patch"
		cat <<\EOF > configure.patch
diff -ur configure.in.in configure.in.in
--- configure.in.in	2011-06-19 15:15:19.000000000 +0200
+++ configure.in.in	2011-09-19 15:02:11.028999986 +0200
@@ -41,6 +41,7 @@
 dnl check for i18n support
 XDT_I18N([ar ast ca cs da de el en_GB es eu fr gl hu id it ja lv nl pl pt_BR pt ru sq sv tr ug uk ur_PK ur zh_CN zh_TW ])
 
+AC_SEARCH_LIBS(sin, m)
 dnl Check for debugging support
 XDT_FEATURE_DEBUG()
EOF
		patch -p0 < configure.patch
	fi
	cd "$srcdir"/"$pkgname"
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib
	make
}

package() {
	cd "$srcdir"/"$pkgname"
	make install DESTDIR=${pkgdir}
	###make sure we remove the patched src
	rm -rf $srcdir
}
