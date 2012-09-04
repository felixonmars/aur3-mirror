pkgname=openerp61_ru-client-bzr
pkgver=2087
pkgrel=1
pkgdesc="OpenERP GTK client"
url=http://openerp.com/
arch=(i686 x86_64)
license=(GPLv3)
depends=('glade'
	'python2-dateutil'
	'gts'
	'graphviz'
	'python2'
	'python2-distribute'
	'python2-pyparsing'
	'python-egenix-mx-base'
	'python2-lxml'
	'python2-matplotlib'
	'python2-pytz'
	'pyxml'
	'hippo-canvas'
	'pydot')
conflicts=('openerp-client' 'python2-openerp-client')
provides=('openerp-client')
source=("https://github.com/downloads/v-k/vak_files/Lin-6.1.tar.bz2"
	openerp-client.desktop)
install=openerp-client.install

_bzrtrunk="lp:openobject-client/6.1"
_bzrmod="openobject-client"

build()
{
  #Branch or merge project to baraar
  cd $srcdir

  if [[ -d "$srcdir/$_bzrmod/.bzr" ]]; then
    (cd "$_bzrmod" && bzr pull $_bzrtrunk)
  else
    bzr branch $_bzrtrunk $_bzrmod
  fi

  #Copy all code to build catalog
  if [[ -d "$srcdir/build" ]]; then
    (rm -rf "$srcdir/build" && mkdir "$srcdir/build")
  else
    mkdir "$srcdir/build"
  fi
  cp -r $srcdir/$_bzrmod/* "$srcdir/build"

  #Alternative russification
  chmod -R 755 $srcdir/Lin-6.1
  cd $srcdir/Lin-6.1
  chmod 644 `find | grep ru.po`
  chmod 644 `find | grep openerp-client.mo`
  cp -rf $srcdir/Lin-6.1/Client/po/* "$srcdir/build/bin/po"
  cp -rf $srcdir/Lin-6.1/Client/share/* "$srcdir/build/bin/share"

  #Start building
  cd "${srcdir}/build"
  python2 setup.py install --root="${pkgdir}"
  mkdir ${pkgdir}/usr/share/applications -p
  install -Dm 644 ${srcdir}/openerp-client.desktop ${pkgdir}/usr/share/applications/openerp-client.desktop
}
md5sums=('803a1e7357142f9b2ffc2e6d16963871'
         '40e42be1e85eabdaca6e2d471f7e5c54')
