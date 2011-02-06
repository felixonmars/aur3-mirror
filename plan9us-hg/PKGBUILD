# $Id:$
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=plan9us-hg
pkgver=3169
pkgrel=2
pkgdesc="Plan 9 from User Space, aka plan9port, apps and services from Plan 9 on Unix-like systems"
arch=('i686' 'x86_64')
url='http://swtch.com/plan9port/'
license=('custom')
depends=('x-server')
conflicts=('plan9port-hg' 'plan9port-cvs' 'plan9port')
replaces=('plan9port-hg' 'plan9port-cvs' 'plan9port')
provides=('plan9us' 'plan9port')
makedepends=('mercurial' 'rsync')
options=('emptydirs' '!strip')

_hgroot=http://bitbucket.org/rsc
_hgrepo=plan9port

source=('LICENSE.patch' 'bclock.c' 'clock.c' 'etc_profile.d_plan9.csh' 'etc_profile.d_plan9.sh')

build() {
    cd "$srcdir"
    msg "Connecting to HG server..."
    if [ -d ${_hgrepo}/.hg ] ; then
	cd ${_hgrepo} && hg pull -u
	msg2 "The local files are updated"
    else
	hg clone ${_hgroot}/${_hgrepo}/ ${_hgrepo}
    fi
    msg "HG checkout done or server timeout"

    msg "Preparing builddir..."
    rsync -a --delete --exclude '.cvs*' --exclude '.hg*' $srcdir/${_hgrepo}/ $srcdir/${_hgrepo}-build
    cp $startdir/bclock.c $srcdir/${_hgrepo}-build/src/cmd
    cp $startdir/clock.c $srcdir/${_hgrepo}-build/src/cmd
    cd $srcdir/${_hgrepo}-build
    msg "Starting ./INSTALL..."
    ./INSTALL -b

    msg "Making it nice..."
    install -Dm755 $srcdir/etc_profile.d_plan9.csh $pkgdir/etc/profile.d/plan9.csh
    install -Dm755 $srcdir/etc_profile.d_plan9.sh $pkgdir/etc/profile.d/plan9.sh
    mkdir -p $pkgdir/usr/local
    cp -r $srcdir/${_hgrepo}-build $pkgdir/usr/local/plan9
    mkdir -p $pkgdir/usr/local/plan9/bin/aux
    ln -fs ../getflags $pkgdir/usr/local/plan9/bin/aux/getflags
    ln -fs ../usage $pkgdir/usr/local/plan9/bin/aux/usage
    rm -rf $pkgdir/usr/local/plan9/dist
    rm -rf $pkgdir/usr/local/plan9/lib/CVS*
    chmod 644 $pkgdir/usr/local/plan9/lib/*
    chmod 644 $pkgdir/usr/local/plan9/man/man{1,3,4,5,6,7,8,9}/*
    rm -f $pkgdir/usr/local/plan9/man/{mkfile,mkindex,secindex}
    rm -f $pkgdir/usr/local/plan9/unix/man/{ex.man,fixurls,mkfile}
    chmod 1777 $pkgdir/usr/local/plan9/mail/queue
    rm -rf $pkgdir/usr/local/plan9/unix/make
    rm -f $pkgdir/usr/local/plan9/unix/*.h $pkgdir/usr/local/plan9/unix/mkfile*
    rm -f $pkgdir/usr/local/plan9/{INSTALL,Makefile,README}
    rm -f $pkgdir/usr/local/plan9/config* $pkgdir/usr/local/plan9/install.*
    find $pkgdir/usr/local/plan9 -name '.placeholder' -exec rm {} ';'
    mkdir -p $pkgdir/usr/share/doc/${pkgname}
    mv $pkgdir/usr/local/plan9/{CHANGES,CONTRIBUTORS,TODO} $pkgdir/usr/share/doc/${pkgname}
    mkdir -p $pkgdir/usr/share/licenses/${pkgname}
    patch -d $pkgdir/usr/local/plan9 -p3 < $startdir/LICENSE.patch
    ln -fs /usr/local/plan9/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=4 sw=4 et:
md5sums=('5814c6953499b39262c8218bd42c5710'
         '39a19803b65b9fcae4ed1ef5e65837f4'
         '0822020fead0bc7134db59433e9ab7ca'
         '232722253aefe1ce40ba7bae77a16847'
         '2e0d299d3fedf41adf06ff225d18f3e9')
