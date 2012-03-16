# Contributor: thorsten w. <p@thorsten-wissmann.de>
# heavily inspired by the tp_smapi PKGBUILD

# make the AUR parser think the following lines are comments
# to bypass the buggy parser check
[[ "#" ]] && _kernext=${_kernext:-}
[[ "#" ]] && _kernver=${_kernver:-$(uname -r)}
[[ "#" ]] && _extramodules=$(readlink -f "/lib/modules/$_kernver/extramodules" | sed 's#^/lib/modules/##')
[[ "#" ]] && _kernver=$(< /lib/modules/$_extramodules/version)

_pkgname=promethean-activboard
pkgname=$_pkgname-git$_kernext
pkgver=20120316
pkgrel=1
pkgdesc="Kernel module and utils for the promethean activboard"
[[ -n $_kernext ]] && pkgdesc+=" (for linux$_kernext)"
arch=('i686' 'x86_64')
url="http://git.informatik.uni-erlangen.de/?p=re06huxa/promethean-activboard"
license=('GPL')
depends=( "linux$_kernext" )
makedepends=("linux$_kernext-headers")
install=$_pkgname.install
provides=( )
backup=( )
source=( )
md5sums=( )
_gitroot="git://git.informatik.uni-erlangen.de/re06huxa/promethean-activboard"
_gitname="$_pkgname"

build() {
    cd $srcdir
    echo "Fetching source from GIT"
    if ! [ -d "$_gitname" ] ; then
        # if git dir does not exist yet
        # then clone git repo
        git clone "$_gitroot" || return 1
        cd "$_gitname"
    else
        # else pull sources
        cd "$_gitname" && git pull origin || return 1
    fi
    # compile
    msg "Compiling kernel module..."
    cd $srcdir/$_gitname
    make || return 1
}

package() {
    cd $srcdir/$_gitname/
    # FIXME: It seems $(KVER) is not passed over to the make modules_install
    # for the linux-kernel/ subtree. But it is only a problem if you want to
    # build the module another kernel than the running one
    make KVER="$_kernver" DESTDIR="$pkgdir" install

    cd "$pkgdir/lib/modules/"
    mv "$_kernver/extra" "$_extramodules"
    rmdir "$_kernver"

    # compress kernel modules
    find "$pkgdir" -name "*.ko" -exec gzip -9 {} +

    # update kernel version in install file
    sed -ri "s/^(extramodules=).*$/\1$_extramodules/" "$startdir/$_pkgname.install"

    # install callibration tool
    cd $srcdir/$_gitname/loadcalibdata/
    targetdir=$pkgdir/usr/bin/
    mkdir -p $targetdir
    install -m 755 loadcalibdata $targetdir/promethean-loadcalibdata
}

