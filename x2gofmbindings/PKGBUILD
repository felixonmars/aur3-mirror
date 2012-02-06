# Maintainer: Milan Knížek <knizek@volny.cz>
pkgname=x2gofmbindings
_pkgname=x2golxdebindings
pkgver=1.0.1.1
pkgrel=1
pkgdesc="X2GO File Manager bindings provides automation for opening shared directories in default file manager. It does not work for KDE/GNOME/LXDE."
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL')
depends=('xdg-utils' 'perl')
options=(emptydirs)
install=$pkgname.install
groups=('x2go' 'alts')
source=("http://code.x2go.org/releases/source/${_pkgname}/${_pkgname}_${pkgver}.tar.gz")
md5sums=('efb894ab745e2ac96c9444fc8003146e')

build() {
  cd "${srcdir}/${_pkgname}_${pkgver}"
  # x2golxdebindings is hardcoded for PCManFM, we can use xdg-open instead
  # Of course, this makes it an unofficial package...
  sed -i -e 's@"pcmanfm @"xdg-open @' x2gopcmanfm/x2gopcmanfm
  sed -i -e 's@\-lxde@@g' \
         -e 's@x2gopcmanfm@x2gofm@g' share/applications/x2gopcmanfm.desktop
  sed -i -e 's@\-lxde@@g' \
         -e 's@^ *</mime\-type@  <generic-icon name="folder-remote"/>\n  </mime\-type@g' \
         share/mime/packages/sshfs-x2go-lxde.xml
cat > README << 'EOM'
This is a heavily modified x2golxdebindings package:

x renamed to x2gofm
x uses xdg-open command to use default file manager as per user's preference
x it should work in non-LXDE/GNOME/KDE environments

Do not seek for support at x2go project!
EOM
}

package() {
  cd "${srcdir}/${_pkgname}_${pkgver}"

  install -D -m 755 "x2gopcmanfm/x2gopcmanfm" "$pkgdir/usr/bin/x2gofm"
  
  install -d -m 755 "$pkgdir/usr/share/mime/packages"
  install -m 644 "share/mime/packages/sshfs-x2go-lxde.xml" \
                 "$pkgdir/usr/share/mime/packages/sshfs-x2go-fm.xml"

  install -d -m 755 "$pkgdir/usr/share/applications"
  install -m 644 "share/applications/x2gopcmanfm.desktop" \
                 "$pkgdir/usr/share/applications/x2gofm.desktop"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "debian/changelog" "${pkgdir}/usr/share/doc/${pkgname}/changelog.DEBIAN"
  install -m 644 "debian/copyright" "${pkgdir}/usr/share/doc/${pkgname}/copyright.DEBIAN"
  install -m 644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"

  install -m 755 -d "${pkgdir}/usr/share/x2go/versions"
  install -m 644 "VERSION.x2golxdebindings" "${pkgdir}/usr/share/x2go/versions/VERSION.x2gofm"
}

