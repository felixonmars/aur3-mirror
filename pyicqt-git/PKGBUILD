# Contributor: fill <mailbox@fillo.ru>

pkgname=pyicqt-git
pkgver=20090515
pkgrel=1
pkgdesc="icq transport for ejabberd"
url="http://code.google.com/p/pyicqt/"
license="GPL"
arch=('i686' 'x86_64')
depends=('python' 'twisted')
replaces=('pyicqt-git' 'pyicqt' 'pyicq-t-svn')
provides=('pyicqt-git' 'pyicqt' 'pyicq-t-svn')
conflicts=('pyicqt-git' 'pyicqt' 'pyicq-t-svn')
source=('pyicqt.rc')
md5sums=()

_gitroot='git://gitorious.org/pyicqt/mainline.git'
_gitname='pyicqt'

build() {
    cd $startdir/src

    msg "Connecting to GIT server..."

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
        cd $_gitname
    git branch --track unstable
    git checkout unstable
    fi

    install -d -m0755 $startdir/pkg/usr/lib/$_gitname
    install -d -m0755 $startdir/pkg/etc/ejabberd
    install -d -m0755 $startdir/pkg/var/spool/$_gitname

    cp -R ./* $startdir/pkg/usr/lib/$_gitname
    cp $startdir/pkg/usr/lib/$_gitname/config_example.xml $startdir/pkg/etc/ejabberd/$_gitname.xml 
    mv $startdir/pkg/usr/lib/$_gitname/config_example.xml $startdir/pkg/etc/ejabberd/${_gitname}_example.xml 
    ln -s /etc/ejabberd/$_gitname.xml $startdir/pkg/usr/lib/$_gitname/config.xml
    install -D -m0755 ../pyicqt.rc $startdir/pkg/etc/rc.d/$_gitname
}
