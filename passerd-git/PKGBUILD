pkgname=passerd-git
pkgver=20100503
pkgrel=1
pkgdesc="Twitter client works like ircd server"
url="http://github.com/ehabkost/passerd.git"
depends=('pyopenssl' 'twisted' 'python-daemon' 'twitty-twister-git' 'python-pysqlite' 'python-sqlalchemy' 'python-oauth' 'setuptools')
makedepends=('git')
license=('GPL')
arch=('i686' 'x86_64')
provides=('passerd')
source=('passerd.init')
md5sums=('f7260ff57c6bfdafe0302e4f7dd979e7')

_gitroot="http://github.com/ehabkost/passerd.git"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."

    if [ -d $srcdir/passerd ] ; then
        cd passerd && git pull origin
	git submodule update
    else
        git clone $_gitroot
	cd passerd
	git submodule init
	git submodule update
    fi

    msg "Building package.."

    python setup.py install --root=$pkgdir

    mkdir -p $pkgdir/etc/rc.d/ $pkgdir/var/lib/passerd $pkgdir/var/log
    install -D -m755 $srcdir/passerd.init $pkgdir/etc/rc.d/passerd
    touch $pkgdir/var/log/passerd.log
}

post_install() {
  useradd passerd /var/lib/passerd /bin/false
  chown passerd. -R /var/log/passerd.log
}

pre_remove() {
  userdel passerd
}

