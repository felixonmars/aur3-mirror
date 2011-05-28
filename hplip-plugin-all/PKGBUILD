# Maintainer: PyroPeter <googlemail.com@abi1789>

pkgname=hplip-plugin-all
pkgname2=hplip
pkgver=3.11.5
pkgrel=1
pkgdesc="Binary plugin for HPs hplip printer driver library"
arch=('i686' 'x86_64')
url="http://hplipopensource.com/"
license=('unknown: proprietary')
makedepends=(python2 pygobject dbus-python)
depends=('hplip-all='$pkgver)
source=("http://www.openprinting.org/download/printdriver/auxfiles/HP/plugins/hplip-$pkgver-plugin.run")
md5sums=('33427017d5bb934e723601dc2796e6d8')

# http://hplip.sourceforge.net/plugin.conf

package() {
  cd "$srcdir/"

  if [ -w /etc/hp/hplip.conf ]; then
    echo "You should not make this package as root!!111!1"
    return 1
  fi

  # untargziping the makeself selfextracting archive
  sh hplip-$pkgver-plugin.run --tar xvf

  sed -i 's!$HOMEDIR!'$pkgdir'/usr/share/hplip!g' plugin.spec
  sed -i 's!$RULESDIR!'$pkgdir'/etc/udev/rules.d!g' plugin.spec

  sed -i 's!if mode == INTERACTIVE_MODE:!installPlugin()\nsys.exit(0)\n\0!' \
      plugin_install.py
  sed -i 's!sys.exit(1)!raise!' \
      plugin_install.py

  python2 plugin_install.py

  while IFS= read -r -d '' link; do
    linkdir="`dirname $link`"
    linkdir="`readlink -e $linkdir`"
    linktarget="`readlink -e $link`"
    relpath="`python2 -c 'import sys,os.path; print os.path.relpath(sys.argv[1],sys.argv[2])' $linktarget $linkdir`"
    ln -sf "$relpath" "$link"
  done < <(find "$pkgdir" -type l -print0)
}
