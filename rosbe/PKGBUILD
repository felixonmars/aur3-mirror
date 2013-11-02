# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=rosbe
pkgver=2.1
pkgrel=1
pkgdesc="ReactOS build enviroinment"
arch=(i686 x86_64)
url="http://www.reactos.org/wiki/ReactOS_Build_Environment"
license=('MULTIPLE')
depends=('subversion' 'libidn')
options=(!strip)
source=(http://downloads.sourceforge.net/reactos/RosBE-Unix-${pkgver}.tar.bz2
	build_script.arch.patch)
md5sums=('52a17e5971e86ca84a4e79cdd3c800b2'
         '8da543b5060d328b3ded5a22aa2586c9')


prepare() {
  cd "$srcdir/RosBE-Unix-$pkgver"

  patch -p0 -i ../build_script.arch.patch
}

build() {
  cd "$srcdir/RosBE-Unix-$pkgver"

  ./RosBE-Builder.sh "$pkgdir/opt/rosbe"
}

package() {
  cd "$srcdir/RosBE-Unix-$pkgver"

  mkdir -p "${pkgdir}/opt/reactos-source"
  mkdir -p "${pkgdir}/usr/bin"
  cat <<EOF >> "${pkgdir}/usr/bin/rosbe"
#/bin/sh

if [[ -d /opt/reactos-source/base ]]; then
	/opt/rosbe/RosBE.sh /opt/reactos-source 
else
	echo "This is your 1st time running rosbe"
	echo "I will now do initial svn checkout"
	echo "Checkingout reactos core components..."

	svn co svn://svn.reactos.org/reactos/trunk/reactos /opt/reactos-source

	echo "There are also documentation, applications..."
	echo "Repos that you can checkout manually."
	echo "Take a look into ReactOS wiki to find them."

	/opt/rosbe/RosBE.sh /opt/reactos-source
fi
EOF

chmod +x "${pkgdir}/usr/bin/rosbe"
}
