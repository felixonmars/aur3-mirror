# $Id:$
# Contributor: Balwinder S Dheeman <bdheeman@gmail.com>

pkgname=mod_ruby-git
_realname=mod_ruby
pkgver=20091214
pkgrel=1
pkgdesc="Embeds the Ruby interpreter into Apache"
arch=('i686' 'x86_64')
url='http://www.modruby.net/'
license=('Apache')
depends=('apache>=1.3.3' 'apr>=1.0.0' 'ruby>=1.6.4')
makedepends=('rsync' 'subversion')
conflicts=(${_realname})
provides=(${_realname})
replaces=(${_realname})
backup=('etc/httpd/conf/include.d/httpd-ruby.conf')
install=${_realname}.install

_gitroot=git://github.com/shugo/mod_ruby.git
_gitname=${_realname}

source=('httpd.conf.patch')

build() {
    msg "Connecting to GIT server..."
    cd $srcdir
    if [ -d "${_gitname}/.git" ] ; then
	cd $srcdir/${_gitname}
	git pull --rebase
    else
	git clone --depth 1 ${_gitroot}
	test -d ${_gitname} && cd ${_gitname} || return $?
    fi
    msg "GIT checkout done or server timeout"

    msg "Preparing builddir..."
    rsync -av --delete --exclude '.git*' $srcdir/${_gitname}/ $srcdir/${_gitname}-build
    cd $srcdir/${_gitname}-build || return $?
    patch -p1 < $srcdir/httpd.conf.patch || return $?

    msg "Running ./configure..."
    ./configure.rb --prefix=/usr \
	--with-apr-includes=/usr/include/apr-1 \
	--with-apxs=/usr/sbin/apxs || return 1

    msg "Running make all install..."
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    msg "Making it nice..."
    install -Dm644 $srcdir/${_gitname}-build/examples/httpd.conf \
	$pkgdir/etc/httpd/conf/include.d/httpd-ruby.conf
}

# vim:set ts=4 sw=4 et:
md5sums=('22fdaa71babd7d58edd1cf92709167fd')
