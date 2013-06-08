# Maintainer: Xavier Mehrenberger xavier.mehrenberger at gmail..com
pkgname=cntlm-svn
pkgver=320
pkgrel=4
license=('GPL2')
pkgdesc='NTLM, NTLM2SR, NTLMv2 authenticating HTTP proxy - SVN version'
arch=('i686' 'x86_64')
url='http://cntlm.sourceforge.net'
conflicts=('cntlm')
makedepends=('subversion' 'make' 'gcc' 'tar')
depends=('glibc')
backup=('etc/cntlm.conf')
install=
source=(${pkgname}.service)
sha512sums=('c3c0df8eb0ae3171e36e3b256022226e260dade7229654d60a79780419a4296c59e0e44c7ca9a08d044824fe9c4f56ec257a8abbd1dc1a929fe3667c06791cab')

_svntrunk=http://svn.awk.cz/cntlm/trunk
_svnmod=cntlm

build() {
	cd "$srcdir"
	msg "Connecting to SVN server...."

	if [[ -d "$_svnmod/.svn" ]]; then
		(cd "$_svnmod" && svn up -r "$pkgver")
	else
		svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	#
	# BUILD HERE
	#
	./configure --prefix=/usr
  # DESTDIR and BINDIR are recommeded in the README file for make, but not used
	make DESTDIR="$pkgdir/" BINDIR="$pkgdir/usr/bin"
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir/" BINDIR="$pkgdir/usr/bin" install
	echo $srcdir
	install -Dm755 $srcdir/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}

# vim:set ts=2 sw=2 et:
