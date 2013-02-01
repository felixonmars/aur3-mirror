# Maintainer: bigshot <bigshot at gmail dot com>
# Based on picasa pkg by yugrotavele <yugrotavele at archlinux dot us>, Laurie Clark-Michalek <bluepeppers at archlinux dot us>, escoand <escoand at freenet dot de>

pkgname=fs2xplane
pkgver=3.26
pkgrel=1
pkgdesc="Converts MS Flight Simulator 2004 and FSX add-on scenery packages to X-Plane DSF overlay scenery packages. The resulting X-Plane scenery packages work under X-Plane 8.64 and later. Global scenery for the relevant areas must also have been installed."
arch=('i686' 'x86_64')
url="http://marginal.org.uk/x-planescenery/tools.html"
license=('unknown')
depends=('python-opengl')
makedepends=('rpmextract')
source=(http://marginal.org.uk/x-planescenery/fs2xplane-3.26-1.noarch.rpm
        fs2xp
        fs2xplane)
md5sums=('50f9685b9b382d0edea28bc7b639728f'
         '1f72e099c83f9def5ae16f43ac9e3f1d'
         'e8dc8735b491ca607903a8de2b47c756')

build() {
   local fs2xplanedir=opt/fs2xplane

   # Extract the rpm
   install -d "$srcdir/fs2xplane_tmp" && cd "$srcdir/fs2xplane_tmp" || return
   rpmextract.sh "$srcdir/${source[0]##*/}" || return


   install -d "$pkgdir/$fs2xplanedir" "$pkgdir/usr/bin"

   # Copy needed files
   cp -rf "$srcdir/fs2xplane_tmp/usr/local/lib/fs2xplane"/* "$pkgdir/$fs2xplanedir"
    
   # Install executables
   install -Dm 755 "$srcdir/fs2xp" "$pkgdir/usr/bin"
   install -Dm 755 "$srcdir/fs2xplane" "$pkgdir/usr/bin"
}
