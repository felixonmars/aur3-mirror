# Submitter: Nathan Hulse <nat.hulse@gmail.com>

pkgname=compiz-plugins-extra-bzr
pkgver=10
pkgrel=4
pkgdesc="Extra plugins pack for Compiz"
url="https://launchpad.net/compiz-plugins-extra"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('compiz-plugins-main-bzr')
makedepends=('bzr' 'intltool' 'cmake')
provides=('compiz-plugins-extra')
conflicts=('compiz-plugins-extra')
install='compiz-plugins-extra-bzr.install'

# GSettings backend support
GSETTINGS="on"

_bzrtrunk=lp:compiz-plugins-extra
_bzrmod=compiz-plugins-extra

build() {
  cd "$srcdir"

  msg "Connecting to Launchpad..."
  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi
  msg "Bazaar checkout done or server timeout."

  rm -rf "$srcdir/$_bzrmod-build"
  msg "Creating build directory..."
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  mkdir "$srcdir/$_bzrmod-build"/build
  cd "$srcdir/$_bzrmod-build/build"

  msg "Running cmake..." 
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"                     \
    -DCOMPIZ_DESTDIR="${pkgdir}"                      \
    -DCOMPIZ_PLUGIN_INSTALL_TYPE="package"            \
    -DCOMPIZ_BUILD_WITH_RPATH=FALSE                   \
    -DCOMPIZ_PACKAGING_ENABLED=TRUE                   \
    -DUSE_GSETTINGS="${GSETTINGS}"                    \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=On               \
	-DCOMPIZ_DISABLE_PLUGIN_FADEDESKTOP=Off           \
	-DCOMPIZ_DISABLE_PLUGIN_MAXIMUMIZE=Off            \
	-DCOMPIZ_DISABLE_PLUGIN_NOTIFICATION=Off          \
	-DCOMPIZ_DISABLE_PLUGIN_SHELF=Off                 \
    -DCOMPIZ_DISABLE_PLUGIN_CUBEADDON=Off             \
    -DCOMPIZ_DISABLE_PLUGIN_SHOWDESKTOP=Off           \
	-DCOMPIZ_DISABLE_PLUGIN_LOGINOUT=Off              \
	-DCOMPIZ_DISABLE_PLUGIN_WALLPAPER=Off             \
	-DCOMPIZ_DISABLE_PLUGIN_GEARS=Off                 \
	-DCOMPIZ_DISABLE_PLUGIN_SPLASH=Off                \
	-DCOMPIZ_DISABLE_PLUGIN_BENCH=Off                 \
	-DCOMPIZ_DISABLE_PLUGIN_BICUBIC=Off               \
	-DCOMPIZ_DISABLE_PLUGIN_FIREPAINT=Off             \
	-DCOMPIZ_DISABLE_PLUGIN_TD=Off                    \
    -DCOMPIZ_DISABLE_PLUGIN_SHOWMOUSE=Off             \
	-DCOMPIZ_DISABLE_PLUGIN_MBLUR=Off                 \
	-DCOMPIZ_DISABLE_PLUGIN_GROUP=Off                 \
	-DCOMPIZ_DISABLE_PLUGIN_ANIMATIONADDON=Off        \
	-DCOMPIZ_DISABLE_PLUGIN_ADDHELPER=Off             \
	-DCOMPIZ_DISABLE_PLUGIN_REFLEX=Off                \
	-DCOMPIZ_DISABLE_PLUGIN_TRAILFOCUS=Off            \
	-DCOMPIZ_DISABLE_PLUGIN_WIDGET=Off                \
	-DCOMPIZ_DISABLE_PLUGIN_CRASHHANDLER=Off          \
	-DCOMPIZ_DISABLE_PLUGIN_EXTRAWM=Off               \
	-DCOMPIZ_DISABLE_PLUGIN_SCALEFILTER=Off
  make
}

package() {
  cd "$srcdir/$_bzrmod-build/build"
  make install

  # Merge the gconf schema files
  if [ -d "${pkgdir}/usr/share/gconf/schemas" ]; then    
    gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-extra.schemas.in" "{$pkgdir}"/usr/share/gconf/schemas/*.schemas
    sed -i '/<schemalist\/>/d' "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-extra.schemas.in"
    rm -f "${pkgdir}"/usr/share/gconf/schemas/*.schemas
    mv "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-extra.schemas.in" "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-extra.schemas"
  fi

  # Add the pesky gsettings schema files manually
  ls generated | grep -qm1 .gschema.xml
  if [ $? -eq 0 ]; then
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/" 
    install -m644 generated/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/" 
  fi
}
