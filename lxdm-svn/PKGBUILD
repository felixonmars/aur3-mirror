# $Id:$
# Contributor: Balwinder S Dheeman <bdheeman@gmail.com>

pkgname=lxdm-svn
pkgver=2330
pkgrel=1
pkgdesc='Lightweight X11 Display Manager (part of LXDE)'
arch=('i686' 'x86_64')
url="http://blog.lxde.org/?p=531"
license=('GPL')
provides=('lxdm')
conflicts=('lxdm')
depends=('gtk2' 'xorg-server')
makedepends=('autoconf' 'automake' 'intltool' 'gcc' 'make' 'pkgconfig' 'rsync' 'subversion')
backup=('etc/lxdm/default.conf')

_svntrunk=https://lxde.svn.sourceforge.net/svnroot/lxde/trunk/lxdm
_svnmod=lxdm-svn

source=('PKGBUILD.local' 'Xsession' 'custom.desktop' 'lxdm.pam' 'lxdm.rc' 'startcustom.sh')
for p in *.patch; do
    source=(${source[@]} ${p##*/})
done

# Include local code, huh
if [ -x PKGBUILD.local ]; then
    . ./PKGBUILD.local
fi

build() {
    msg2 "Connecting to SVN server..."
    cd ${srcdir}
    if [ -d ${_svnmod}/.svn ]; then
	cd ${_svnmod} && svn up
    else
	svn co ${_svntrunk} ${_svnmod}
    fi
    msg2 "SVN checkout done or server timeout"

    msg2 "Preparing builddir..."
    cd ${srcdir}
    rm -rf ${_svnmod}-build
    rsync -av --delete --exclude '.svn*' ${_svnmod}/ ${_svnmod}-build
    cd ${_svnmod}-build
    for p in $srcdir/*.patch; do
	msg2 "Applying patch ${p##*/}"
	patch -sp1 < ${p} || return $?
    done

    msg2 "Starting the ./autogen.sh; make all install..."
    ./autogen.sh
    config_file="/etc/lxdm/default.conf"
    LDFLAGS="-Wl,-z,defs -Wl,-O2 -Wl,--as-needed" \
    CFLAGS="-DCONFIG_FILE=\\\"$config_file\\\"" \
    ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/lxdm || return 1
    make || return 1
}

package() {
    cd ${_svnmod}-build || return 1
    make DESTDIR=${pkgdir} install || return 1

    msg2 "Making it nice..."
    sed -e 's|^# arg=.*|arg=/usr/bin/X vt5 -nolisten tcp|; s|\${exec_prefix}|/usr|' \
	-i ${pkgdir}/etc/lxdm/lxdm.conf
    cp ${pkgdir}/etc/lxdm/lxdm.conf ${pkgdir}/etc/lxdm/default.conf
    mv ${pkgdir}/usr/sbin/lxdm-binary ${pkgdir}/usr/sbin/lxdm
    install -Dm755 ${srcdir}/Xsession ${pkgdir}/etc/lxdm/Xsession || return 1
    install -Dm755 ${srcdir}/custom.desktop ${pkgdir}/usr/share/xsessions/custom.desktop || return 1
    install -Dm644 ${srcdir}/lxdm.pam ${pkgdir}/etc/pam.d/lxdm || return 1
    install -Dm755 ${srcdir}/lxdm.rc ${pkgdir}/etc/rc.d/lxdm || return 1
    install -Dm755 ${srcdir}/startcustom.sh ${pkgdir}/usr/bin/startcustom || return 1
}

# vim:set ts=4 sw=4 et:
md5sums=('86ba7f04bf9a291dc827738bda7c9b4a'
         '49785674285bfed32d02516f4f769e48'
         'fa80f01323a765f5f667c7ed31aa4af3'
         '3bb03543d1e05168f394d9e35051237a'
         '35ebe5ea58406eaa1e6d51579618f551'
         'd23ae9e7e2a6948b68007e6c1744fb29'
         '7efff99b0f95bbcbdba339b14aca3039'
         'b5c4e469cab84b236d300d20cfd92608'
         'd422789783b1d3bdd09be0d49e101476'
         '833873b4708994ffc7e0b74ff70e22f2')
