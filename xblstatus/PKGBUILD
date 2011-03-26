# Contributor: Kessia Pinheiro <kessiapinheiro at gmail.com>
pkgname=xblstatus
pkgver=0.4.1
pkgrel=1
pkgdesc="allows you to view your Xbox Live friends list"
arch=(i686)
url="http://www.hollec.com/projects/xblstatus"
license=('MIT')
depends=('python-clientform' 'pygtk' 'python-notify' 'dbus-python' 'beautiful-soup' 'gnome-python')
source=("http://launchpad.net/xblstatus/0.4/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
        'xblstatus.patch')
md5sums=('af9196b3c88960de7aae3dff19bc902f'
         '06cdc1fa89f88ab29f01b58b8677dfaf')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
#    patch -Np0 -i ${srcdir}/xblstatus.patch || return 1

 	install -d ${pkgdir}/usr/{bin,share/{${pkgname},licenses/${pkgname}}} || return 1

 	cp -R ui/ ${pkgdir}/usr/share/${pkgname}/ || return 1
    install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
 	install -D -m0644 {*.py,README} ${pkgdir}/usr/share/${pkgname}/ || return 1
	install -D -m0755 xblstatus.py ${pkgdir}/usr/share/${pkgname}/ || return 1
 	ln -s ../../usr/share/${pkgname}/${pkgname}.py ${pkgdir}/usr/bin/${pkgname} || return 1
}

