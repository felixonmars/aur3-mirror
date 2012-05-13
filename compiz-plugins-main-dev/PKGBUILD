# Maintainer: Nathan Hulse <nat.hulse@gmail.com>

pkgname=compiz-plugins-main-dev
pkgseries=0.9.7
pkgver=${pkgseries}.2
pkgrel=2
pkgdesc="Main plugin package for Compiz"
url="https://launchpad.net/compiz-plugins-main"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
provides=('compiz-plugins-main')
conflicts=('compiz-plugins-main')
depends=('compiz-core-dev')
groups=('compiz-dev')
makedepends=('intltool' 'cmake')
source=("https://launchpad.net/compiz-plugins-main/${pkgseries}/${pkgver}/+download/compiz-plugins-main-${pkgver}.tar.bz2")
install='compiz-plugins-main-dev.install'
md5sums=(
  '0c24e78eb769cb86c48ce34734c1212b'
)

# GSettings backend support
GSETTINGS="on"

build() {
	cd "compiz-plugins-main-${pkgver}"
	[[ -d build ]] || mkdir build
	cd build
	cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"                     \
    -DCMAKE_BUILD_TYPE="Release"                      \
    -DCOMPIZ_BUILD_WITH_RPATH=FALSE                   \
    -DUSE_GSETTINGS="${GSETTINGS}"                    \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=On               \
	  -DCOMPIZ_DISABLE_PLUGIN_COLORFILTER=Off           \
		-DCOMPIZ_DISABLE_PLUGIN_WORKAROUNDS=Off           \
		-DCOMPIZ_DISABLE_PLUGIN_TEXT=Off                  \
		-DCOMPIZ_DISABLE_PLUGIN_SCALEADDON=Off            \
		-DCOMPIZ_DISABLE_PLUGIN_MOUSEPOLL=Off             \
		-DCOMPIZ_DISABLE_PLUGIN_MAG=Off                   \
		-DCOMPIZ_DISABLE_PLUGIN_TITLEINFO=Off             \
		-DCOMPIZ_DISABLE_PLUGIN_SHIFT=Off                 \
		-DCOMPIZ_DISABLE_PLUGIN_SESSION=Off               \
		-DCOMPIZ_DISABLE_PLUGIN_ANIMATION=Off             \
		-DCOMPIZ_DISABLE_PLUGIN_EXPO=Off                  \
		-DCOMPIZ_DISABLE_PLUGIN_SNAP=Off                  \
		-DCOMPIZ_DISABLE_PLUGIN_RING=Off                  \
		-DCOMPIZ_DISABLE_PLUGIN_PUT=Off                   \
		-DCOMPIZ_DISABLE_PLUGIN_WALL=Off                  \
		-DCOMPIZ_DISABLE_PLUGIN_IMGJPEG=Off               \
		-DCOMPIZ_DISABLE_PLUGIN_STATICSWITCHER=Off        \
		-DCOMPIZ_DISABLE_PLUGIN_VPSWITCH=Off              \
		-DCOMPIZ_DISABLE_PLUGIN_RESIZEINFO=Off            \
		-DCOMPIZ_DISABLE_PLUGIN_WINRULES=Off              \
		-DCOMPIZ_DISABLE_PLUGIN_OPACIFY=Off               \
		-DCOMPIZ_DISABLE_PLUGIN_KDECOMPAT=Off             \
		-DCOMPIZ_DISABLE_PLUGIN_NEG=Off                   \
		-DCOMPIZ_DISABLE_PLUGIN_THUMBNAIL=Off             \
		-DCOMPIZ_DISABLE_PLUGIN_EZOOM=Off                 \
		-DCOMPIZ_DISABLE_PLUGIN_GRID=Off
	make
}

package() {
  cd "compiz-plugins-main-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # Merge the gconf schema files
  if [ -d "${pkgdir}/usr/share/gconf/schemas" ]; then    
    gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-main.schemas.in" "{$pkgdir}"/usr/share/gconf/schemas/*.schemas
    sed -i '/<schemalist\/>/d' "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-main.schemas.in"
    rm -f "${pkgdir}"/usr/share/gconf/schemas/*.schemas
    mv "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-main.schemas.in" "${pkgdir}/usr/share/gconf/schemas/compiz-plugins-main.schemas"
  fi

  # Add the pesky gsettings schema files manually
  ls generated | grep -qm1 .gschema.xml
  if [ $? -eq 0 ]; then
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/" 
    install -m644 generated/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/" 
  fi
}
