# Maintainer: Kevin Cox  <kevincox.ca@gmail.com>
# Contributor: dongfengweixiao  <dongfengweixiao "at" gmail {dot} com>

pkgname=dassault-systemes-draftsight
pkgver=2012.1.1177
pkgrel=2
pkgdesc="Free CAD software for your DWG files."
arch=(any)
url="http://www.3ds.com/products/draftsight/download-draftsight/"
source=('http://dl-ak.solidworks.com/nonsecure/draftsight/beta4/draftSight.deb' 'dassault-systemes_draftsight.desktop')
license=(Commercial)
conflicts=('draftsight')
install=draftsight.install

_pkgprefix=opt/dassault-systemes/draftsight

depends=(
    fontconfig
    gcc-libs
    glib2
    glibc
    libcups
    libgl
    libice
    libsm
    libx11
    libxext
    libxrender
    libxt
    mesa
    nas
	qt
    util-linux
    zlib
)

# Build and replace dependency list for x86_64
if [[ "$CARCH" == 'x86_64' ]]; then
    for i in ${depends[@]}
    do
        _depends_64+=("lib32-$i")
    done
    depends=("${_depends_64[@]}")
fi

package() {
    msg "Extracting the draftsight package"
    ar -xv draftSight.deb
    tar -xzvf data.tar.gz
    tar -xzvf control.tar.gz
    msg2 "Done extracting!"

    msg "Preparing install"
    install -d "$pkgdir"/{opt,var,usr/share/applications}
    mv -v opt/dassault-systemes "$pkgdir"/opt
    mv -v var/opt "$pkgdir"/var
    mv -v license* "$pkgdir"/var/opt/dassault-systemes/draftsight/licence
    msg2 "Done preparing!"

    msg "Actual installation"
    mkdir -p "${pkgdir}"/etc/profile.d
    echo "export PATH=\$PATH:/${_pkgprefix}/bin" > $pkgdir/etc/profile.d/$pkgname.sh
    chmod 755 "${pkgdir}"/etc/profile.d/$pkgname.sh
    rm -rf "${pkgdir}"/opt/dassault-systemes/draftsight/mime/dassault-systemes_draftsight.desktop
    mv -v "${srcdir}"/dassault-systemes_draftsight.desktop "${pkgdir}"/opt/dassault-systemes/draftsight/mime/dassault-systemes_draftsight.desktop
    cp "${pkgdir}"/opt/dassault-systemes/draftsight/mime/dassault-systemes_draftsight.desktop "${pkgdir}"/usr/share/applications/dassault-systemes_draftsight.desktop
    chmod 755 "${pkgdir}"/usr/share/applications/dassault-systemes_draftsight.desktop
    install -D "${pkgdir}"/opt/dassault-systemes/draftsight/Eula/english/eula.htm "${pkgdir}"/usr/share/licenses/draftsight/eula.htm
}
    msg2 "Installation finished!"

md5sums=('6f737dfae32949e10b9eac873e24e1e8'
         'ff20324ee641c7b08b02c9de58fcb35f')
