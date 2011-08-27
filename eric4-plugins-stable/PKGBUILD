# Contributor: Thorsten Weimann <thorsten.weimann (at) gmx (dot) net>

pkgname=eric4-plugins-stable
pkgver=4.4.4

_src_url='http://downloads.sourceforge.net/eric-ide'
_p1name='Plugin_Assistant_Eric'
_p1ver=1.2.2
_p2name='Plugin_Checker_PyLint'
_p2ver=4.2.0
_p3name='Plugin_Packager_CxFreeze'
_p3ver=4.3.0
_p4name='Plugin_Project_Django'
_p4ver=2.1.0
_p5name='Plugin_Project_Pylons'
_p5ver=1.0.0
_p6name='Plugin_Project_TurboGears'
_p6ver=1.0.5
_p7name='Plugin_Project_wxPython'
_p7ver=1.0.3
_p8name='Plugin_Refactoring_Rope'
_p8ver=1.1.5
_p9name='Plugin_Tools_CharTables'
_p9ver=4.1.4
_p10name='Plugin_Vcs_CVS'
_p10ver=4.1.12

pkgrel=1
pkgdesc="Plugins for the eric Python IDE version 4.x (currently 10 plugins)."
arch=('any')
url="http://eric-ide.python-projects.org/index.html"
license=('GPL')
depends=('eric')
makedepends=('unzip')
optdepends=('cx_freeze: Support for freezing Python apps'
            'cvs: Support for CVS version control system'
            'pylint: Python code coverage')
conflicts=('eric-plugins')
provides=('eric-plugins')
source=(${_src_url}/${_p1name}-${_p1ver}.tar.gz
        ${_src_url}/${_p2name}-${_p2ver}.tar.gz
        ${_src_url}/${_p3name}-${_p3ver}.tar.gz
        ${_src_url}/${_p4name}-${_p4ver}.tar.gz
        ${_src_url}/${_p5name}-${_p5ver}.tar.gz
        ${_src_url}/${_p6name}-${_p6ver}.tar.gz
        ${_src_url}/${_p7name}-${_p7ver}.tar.gz
        ${_src_url}/${_p8name}-${_p8ver}.tar.gz
        ${_src_url}/${_p9name}-${_p9ver}.tar.gz
        ${_src_url}/${_p10name}-${_p10ver}.tar.gz)

md5sums=('f29a78260885c540704854c5196860a3'
         '78e6b1241ace7387224016dafb985607'
         'f1404f63f300f72352545c99d95d0b06'
         '59d4e479d35c3a86867d1747ae023f8c'
         '6301dec0fd21d14b3d885f699a41db3b'
         'cd2a61fe2231c14955151764f7744561'
         'ed877f46064076a3e7319483e31ddf5a'
         '8c7bab8b84713c9a5cc20a43991554c3'
         'ee120a9950e86bb9e225a2d6d65a355f'
         '119cfb72a58c48272410cb20436e0e71')

build() {
  cd ${srcdir}
  _inst_dir='/usr/lib/python2.6/site-packages/eric4plugins'
  install -d  ${pkgdir}${_inst_dir}
  unzip -o ${_p1name}-${_p1ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p2name}-${_p2ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p3name}-${_p3ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p4name}-${_p4ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p5name}-${_p5ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p6name}-${_p6ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p7name}-${_p7ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p8name}-${_p8ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p9name}-${_p9ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  unzip -o ${_p10name}-${_p10ver}/*.zip -d ${pkgdir}${_inst_dir} || return 1
  rm -r ${pkgdir}${_inst_dir}/{VERSION,*/Documentation}
  find ${pkgdir} -type d -exec chmod 755 {} \;
}

