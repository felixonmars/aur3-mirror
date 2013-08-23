# Maintainer: Aaron Lindsay <aaron@aclindsay.com>

# Name of the Software your PKGBUILD will install - should be unique. See PKGBUILD#pkgname
pkgname=seafile

# The version number for the software
pkgver=1.8.1

#The release number for the arch package, as fixes are added to the PKGBUILD, the release number will increase
pkgrel=3

# The description of the package, should be about 80 characters long (one line)
pkgdesc="Seafile is an open-source Dropbox replacement."

# The type of processor this software can build and work on. See PKGBUILD#arch
arch=('i686' 'x86_64')

# The official website for the software your PKGBUILD will install
url="http://seafile.com"

# The License that the software is released under. See PKGBUILD#license
license=('GPLv3')

# Packages that your software needs to run. If the dependancy requires a minimum version number use the >= operator
depends=('glib2>=2.28' 'libevent>=2.0' 'curl' 'util-linux' 'intltool>=0.40' 'sqlite>=3.7' 'libmysqlclient>=5.5' 'gtk2>=2.24' 'python2-mako' 'python2-webpy' 'python2-simplejson' 'python2-imaging' 'python2-chardet' 'python2-pip' 'python2-virtualenv' 'libnotify' 'gunicorn' 'python2-djblets' 'ccnet>=1.3.5' 'libsearpc>=1.1.0' 'libevhtp')

# Packages that must be installed to build the software, but at not necessary to run it
makedepends=('pacman>=4.1')

# Optional packages that extend the software's functionality
optdepends=()

# List of Package names that this PKGBUILD provides. Put modified packages that will be installed here.
provides=()

conflicts=('django' 'django-rest-framework')

# Change the default behavior of makepkg see PKGBUILD#options
options=

install=seafile.install

source=("https://seafile.googlecode.com/files/seafile-1.8.1.tar.gz"
	"seafile-admin.patch"
	"tools_Makefile.am.patch"
	"seafile.install")
sha256sums=('b08d4a79ef26023e49e5882d88d6e8d918dbb3e0ea17694fea1d593b493c8f81'
	'0d9578b85c00f3087a19f227b29c3fda13e83d093d024c68c1df5575d30d56dc'
	'3afb6b0ce902215d4b4f119e1094b2b84b2ec39e4ba8bd29d40fd7b5cdf4fa0c'
	'360fca7cbe7d5d7afd393d3e5a878630cf10e6ca5d2de48f5e8c2618dab64ce5')

prepare () {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i $srcdir/seafile-admin.patch
	patch -p1 -i $srcdir/tools_Makefile.am.patch
}

build () {
	cd "$srcdir/$pkgname-$pkgver"
	aclocal
	automake --add-missing
	./configure --enable-server --enable-httpserver --prefix=/usr PYTHON=/usr/bin/python2
	make -j1
	make -C monitor
	make -C python/seaserv
}

package () {
	#install library and header files
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	make -C monitor DESTDIR="$pkgdir/" install
	make -C python/seaserv DESTDIR="$pkgdir/" install
}
