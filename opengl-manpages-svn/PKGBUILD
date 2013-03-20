pkgname=opengl-manpages-svn
pkgver=20076
pkgrel=1
pkgdesc="OpenGL Reference Pages converted to manpages"
provides=(opengl-manpages)
license=('custom')
arch=(any)
url="https://www.opengl.org/sdk/docs/man/"
makedepends=('subversion' 'libxslt' 'docbook-xsl' 'docbook-mathml' 'w3c-mathml2' 'sed')
source=(LICENSE SGI-FreeSoftwareLicenseB OpenPublicationLicense)
noextract=()
md5sums=('5fc9b93540b47782c64095176204c7e3'
         '1ac705a20a0b78c7c00512507bee5cec'
         'e2c59eccf33187f4605e116bdf3a8ffb')

_svntrunk=https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/docs/man4
_svnmod=man4

build() {
	cd "$srcdir"
	msg "Connecting to SVN server...."

	if [[ -d "$_svnmod/.svn" ]]; then
		(cd "$_svnmod" && svn up)
	else
		svn co --username anonymous --password anonymous "$_svntrunk" --config-dir ./ "$_svnmod"
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_svnmod-build"
	svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	sed -i 's@xsl/current/xhtml@xsl/current/manpages@' xhtml/opengl-man.xsl
	make ROOT=.
	sed -i 's@\[FIXME: author\]@Khronos Group@g' xhtml/*
	sed -i 's@\[FIXME: source\]@Khronos Group@g' xhtml/*
	sed -i 's@\[FIXME: manual\]@OpenGL Reference Pages@g' xhtml/*
}

package() {
	cd "$srcdir/$_svnmod-build"
	mkdir -p "$pkgdir/usr/share/man/man3"
	mv xhtml/*.3G "$pkgdir/usr/share/man/man3"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/SGI-FreeSoftwareLicenseB" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/OpenPublicationLicense" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
