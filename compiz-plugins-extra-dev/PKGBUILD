# Maintainer: Nathan Hulse <nat.hulse@gmail.com>

pkgname=compiz-plugins-extra-dev
pkgseries=0.9.7
pkgver=${pkgseries}.0
pkgrel=2
pkgdesc="Extra plugins for Compiz 0.9.x"
url="http://www.compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
provides=('compiz-plugins-extra')
conflicts=('compiz-plugins-extra')
depends=('compiz-core-dev' 'compiz-plugins-main-dev')
makedepends=('intltool' 'cmake')
source=("https://launchpad.net/compiz-plugins-extra/${pkgseries}/${pkgver}/+download/compiz-plugins-extra-${pkgver}.tar.bz2")
install='compiz-plugins-extra-dev.install'
md5sums=('97e8199173ae447b0e6665a8056932c4')

# GSettings backend support
GSETTINGS="on"

build() {
  cd "compiz-plugins-extra-${pkgver}"
  [[ -d build ]] || mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr                       \
    -DCOMPIZ_BUILD_WITH_RPATH=FALSE                   \
    -DCMAKE_BUILD_TYPE="Release"                      \
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
  cd "compiz-plugins-extra-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

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
