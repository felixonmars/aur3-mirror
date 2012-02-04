pkgname=vmware-server-console
pkgver=1.0.10
pkgrel=1
pkgdesc="Remote console for VMware Server"
arch=('i686' 'x86_64')
url="http://www.vmware.com/products/server/"
license=('custom')
depends=('glibmm' 'libgnomecanvas' 'librsvg' 'libxt' 'libxtst' 'libstdc++5' 'perl')
options=('!strip' '!libtool')
install=vmware-server-console.install
source=(http://download3.vmware.com/software/vmserver/VMware-mui-${pkgver}-203137.tar.gz
        vmware-server-console.desktop)
md5sums=('0f01e9bdeee3fa2aa84f87f66b69dc83'
         'd5f9319812fffe7bd832a64e1f333231')

build() {
  cd "$srcdir/vmware-mui-distrib/console-distrib"
  tar xzf VMware-server-console-${pkgver}-203137.tar.gz || return 1

  cd "$srcdir/vmware-mui-distrib/console-distrib/vmware-server-console-distrib"

  # Install binary files
  mkdir -p "$pkgdir/usr/bin" || return 1
  install -m755 bin/* "$pkgdir/usr/bin" || return 1

  # Install libs
  mkdir -p "$pkgdir/usr/lib/vmware-server-console" || return 1
  cp -a lib/* "$pkgdir/usr/lib/vmware-server-console" || return 1
  chmod -R u+w "$pkgdir/usr/lib/vmware-server-console" || return 1

  # Install configuration files
  install -D -m755 etc/installer.sh "$pkgdir/etc/vmware-server-console/installer.sh" || return 1

  # Install man page
  install -D -m644 man/man1/vmware-server-console.1.gz \
    "$pkgdir/usr/share/man/man1/vmware-server-console.1.gz" || return 1

  # Install license
  mkdir -p "$pkgdir/usr/share/licenses/vmware-server-console" || return 1
  install -m644 doc/{EULA,open_source_licenses.txt} \
    "$pkgdir/usr/share/licenses/vmware-server-console" || return 1

  # Install desktop file
  install -D -m644 doc/icon48x48.png \
    "$pkgdir/usr/share/pixmaps/vmware-server-console.png" || return 1
  install -D -m644 "$srcdir/vmware-server-console.desktop" \
    "$pkgdir/usr/share/applications/vmware-server-console.desktop" || return 1
}

