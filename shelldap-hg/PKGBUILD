# Maintainer: Liganic <liganic-aur@gmx.net>
pkgname=shelldap-hg
pkgver=13
pkgrel=2
pkgdesc="A handy shell-like interface for browsing LDAP servers and editing their content."
arch=('any')
url="http://projects.martini.nu/shelldap"
license=('GPL')
depends=('perl-yaml-syck' 'perl-term-readkey' 'perl-term-shell' 'perl-ldap' 'perl-digest-md5' 'perl-algorithm-diff' 'perl-term-readline-gnu' 'perl-io-socket-ssl')
makedepends=('mercurial' 'awk' 'sed')
provides=($pkgname)

_hgroot="http://code.martini.nu/shelldap"
_hgrepo="shelldap"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

	# The Makefile is a bit weird
	export _version=$(awk '/VERSION/ { print $4 }' shelldap | tr -d \'\;)
	make
	tar xzpf shelldap-$_version.tar.gz
}

package() {
  cd "$srcdir/$_hgrepo-build"

	# As stated above there is no real make
	local _docpath="$pkgdir/usr/share/doc/$pkgname-$_version/"
	mkdir -p $_docpath
	cp shelldap-$_version/{ChangeLog,README} $_docpath
	mkdir -p "$pkgdir"/usr/bin/
	cp shelldap-$_version/shelldap "$pkgdir"/usr/bin/
} 
