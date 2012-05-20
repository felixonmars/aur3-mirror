# Maintainer: tlm <13thSlayer@gmail.com>
pkgname=ffs
pkgver="5.0.1189"
pkgrel=1
pkgdesc="A free (as in beer) file splitter"
arch=(i686 x86_64)
url="http://filesplitter.org"
depends=(wine)
license=nonfree
source=("http://www.filesplitter.org/Free-File-Splitter-v${pkgver}.exe")
md5sums=('db2ee7e48ebb9079d30375799fae5a0c')
function build {
	echo "Generating launcher script at /usr/bin/ffs"
	mkdir -p ${pkgdir}/usr/bin
	cat > "${pkgdir}/usr/bin/ffs" <<EOF
	cd /usr/share/${pkgname}/
	# export WINEPREFIX="~/.ffs" # Uncomment for a custom wineprefix
	exec wine Free-File-Splitter-v${pkgver}.exe
EOF
	chmod 755 ${pkgdir}/usr/bin/ffs
}
function package {
	mkdir -p ${pkgdir}/usr/share/ffs/
	install -m755 ${srcdir}/Free-File-Splitter-v${pkgver}.exe ${pkgdir}/usr/share/ffs/
}
