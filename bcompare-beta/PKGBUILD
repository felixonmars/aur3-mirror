# Maintainer: Tom Kwok <contact@tomkwok.com>
# Contributor: Magician <magician21 ett lycos daht com>
# Contributor: Petrovo https://aur.archlinux.org/account.php?Action=AccountInfo&ID=33361
# Contributor: Pierre-François Gomez https://aur.archlinux.org/account/pef/
# Original PKGBUILD file from:
# - https://bbs.archlinux.org/viewtopic.php?pid=757428#p757428
# - http://www.scootersoftware.com/vbulletin/showpost.php?s=3c1f289bc76655230b49f440dbe17b53&p=26449&postcount=7

pkgname=bcompare-beta
_pkgname=bcompare
pkgver=4.0.2.19186
pkgrel=1
pkgdesc="Beyond Compare 4: Compare, sync, and merge files and folders"
arch=('i686' 'x86_64')
url="http://www.scootersoftware.com"
license=('custom')
groups=('utility')
makedepends=('sed')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=("http://www.scootersoftware.com/${_pkgname}-${pkgver}.tar.gz")
md5sums=(SKIP)
options=('!strip') # Do not strip binaries because it breaks them down
optdepends=()
backup=()

#Set up platform-specific variables
_LIB_DIR='lib'
_PKG_TYPE=''
if test "$CARCH" == x86_64; then
    _LIB_DIR='lib32'
    _PKG_TYPE='lib32-'
fi
depends+=(${_PKG_TYPE}glibc ${_PKG_TYPE}expat ${_PKG_TYPE}fontconfig ${_PKG_TYPE}freetype2
    ${_PKG_TYPE}gcc-libs ${_PKG_TYPE}libice ${_PKG_TYPE}libsm ${_PKG_TYPE}libstdc++5
    ${_PKG_TYPE}libxcb ${_PKG_TYPE}libx11 ${_PKG_TYPE}libxau ${_PKG_TYPE}libxcursor ${_PKG_TYPE}libxext
    ${_PKG_TYPE}libxfixes ${_PKG_TYPE}libxft ${_PKG_TYPE}libxinerama ${_PKG_TYPE}libxrandr
    ${_PKG_TYPE}libxrender ${_PKG_TYPE}zlib)

package() {

    # Prepare the directory skeleton needed for install.sh
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/doc"
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/lib/thunarx-2/"
    mkdir -p "${pkgdir}/usr/lib/nautilus/extensions-3.0/"

    # Set up service menus
    echo -n "Do you want to install KDE service menus globally? [Y/n] "
    read key
    if [ "$key" != "n" -a "$key" != "N" ]; then
        echo -n "Including KDE service menus in the package..."
        mkdir -p "${pkgdir}/usr/lib/kde4"
        mkdir -p "${pkgdir}/usr/share/kde4/services/"
        echo " Done!"
    else
     echo "KDE service menus will NOT be included in the package."
    fi

    # Apply some fixes on install.sh before run it
    cd ${_pkgname}-${pkgver}
    sed -i 's|/usr/|${PREFIX}/usr/|g' install.sh
    ./install.sh --prefix="${pkgdir}"

    # Move some directories to usr
    cd "${pkgdir}"
    if [ -d usr/${_LIB_DIR} ]; then
        mv usr/${_LIB_DIR}/* ${_LIB_DIR}
    fi 
    mv bin ${_LIB_DIR} usr/

    # Fix wrong path
    sed -i "s|"${pkgdir}"|/usr|g" usr/bin/bcompare

    #Clean unneded files
    pushd usr/${_LIB_DIR}/beyondcompare/ > /dev/null
    rm -f uninstall.sh RPM-GPG-KEY-scootersoftware scootersoftware.repo kde_context_menu
    mv help "${pkgdir}/usr/share/doc/beyondcompare"
    mv README "${pkgdir}/usr/share/doc/beyondcompare/"
    rm -rf ext
    popd > /dev/null

    # Clean some mime files
    pushd usr/share > /dev/null
    mv mime/packages .
    rm -rf mime/*
    mv packages mime/
    popd > /dev/null

}
