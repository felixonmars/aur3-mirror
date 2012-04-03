# Contributer: fnord0 <fnord0 AT riseup DOT net>

pkgname=peach
_pkgname=Peach
pkgver=2.3.8
pkgrel=4
pkgdesc="A cross-platform fuzzing framework written in Python"
arch=('i686' 'x86_64')
url="http://peachfuzzer.com/"
license=('MIT')
depends=('pyrex' 'gtk2' 'unzip' 'tar' 'twisted' 'python2-pyasn1' 'wxpython' 'zope-interface')
provides=('python-cdeepcopy' 'python-cpeach' 'peach-pypcap' 'python-pydbgeng' 'python-vdebug' 'python-4suite-xml' 'python-multiprocessing' 'python-psutil' 'python-pyvmware')
conflicts=('4suite' 'python-multiprocessing')
optdepends=('pygtk: VDB gui support'
	    'pango: VDB gui support')
source=("http://downloads.sourceforge.net/project/peachfuzz/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-src.zip"
	"https://launchpadlibrarian.net/24301374/python2.6.patch.txt")
options=(!emptydirs !strip)
md5sums=('aaaccbddc6553b23056e61aa44464e6e'
	 'f4cfec5f5f9f58c3d18f0e7f337353ed')
sha1sums=('c1cc4b885b340baff96a55ae104e45f5c3b44188'
	  'cc84a76bd16683fa29e1c96c1931bc6534c7b644')

build() {

                install -d ${pkgdir}/usr/bin || return 1
                install -d ${pkgdir}/usr/share/${pkgname} || return 1
                install -d ${pkgdir}/usr/share/${pkgname}/docs || return 1
                install -d ${pkgdir}/usr/share/${pkgname}/samples || return 1
                install -d ${pkgdir}/usr/share/${pkgname}/test || return 1
                install -d ${pkgdir}/usr/share/${pkgname}/tools || return 1
                install -d ${pkgdir}/usr/share/${pkgname}/Peach || return 1
                install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
																
		# python-cdeepcopy install
		msg "Building and installing python-cdeepcopy ..."
 		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/cDeepCopy
		python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1

		# python-cpeach install
		msg "Building and installing python-cpeach ..."
 		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/cPeach
		python2 setup.py config || return 1
		python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1

		# peach-pypcap install
		msg "Patching peach-pypcap ..."
 		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/peach-pypcap
		#sed -i 's|pyrexc|pyrexc2.5|' Makefile
		sed -i '/print/d' setup.py
		sed -i '/#include <pcap.h>/ i\#define HAVE_PCAP_FILE' pcap_ex.c
		sed -i '/	conf = self._pcap_config([ self.with_pcap ])/        conf = self._pcap_config([ self.with_pcap ])/' setup.py
		msg "Building and installing a modified version of the pypcap library to support saving captures as pcap files..."
		python2 setup.py config || return 1
		python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
		# peach-pycap post install
		install -d ${pkgdir}/usr/share/peach-pypcap || return 1
               	install -d ${pkgdir}/usr/share/peach-pypcap/doc || return 1
		install -d ${pkgdir}/usr/share/licenses/peach-pypcap || return 1
		install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/peach-pypcap/LICENSE || 1
		## TODO
		##install -D -m755 testsniff.py ${pkgdir}/usr/share/peach-pypcap/testsniff.py || return 1
		##ln -sf /usr/share/peach-pypcap/testsniff.py ${pkgdir}/usr/bin/testsniff.py || return 1
		for pcapdoc in CHANGES README README-Peach.txt; do
  	              install -Dm644 ${pcapdoc} ${pkgdir}/usr/share/peach-pypcap/doc/${pcapdoc} || return 1
                done

		# python-pydbgeng install
		msg "Building and installing python-pydbgeng ..."
 		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src
		unzip PyDbgEng-0.14.zip || return 1
		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/PyDbgEng-0.14
		python2 setup.py config || return 1
		python2 setup.py build || return 1
		python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
		# python-pydbgeng post install
                install -d ${pkgdir}/usr/share/pydbgeng || return 1
                install -d ${pkgdir}/usr/share/pydbgeng/doc || return 1
                install -d ${pkgdir}/usr/share/pydbgeng/Examples || return 1
		install -d ${pkgdir}/usr/share/licenses/pydbgeng || return 1
		install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/pydbgeng/LICENSE.txt || return 1
                for dbgdoc in CHANGELOG.txt README.txt; do
			install -Dm644 ${dbgdoc} ${pkgdir}/usr/share/pydbgeng/doc/${dbgdoc} || return 1
	        done
		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/PyDbgEng-0.14/Examples
                for dbgex in *; do
                        install -Dm644 ${dbgex} ${pkgdir}/usr/share/pydbgeng/Examples/${dbgex} || return 1
                done

                # 4suite-xml install
		msg "Patching 4Suite-XML to work with Python 2.7.x ..."
		# bug details @ https://bugs.launchpad.net/ubuntu/jaunty/+source/python-4suite/+bug/338079
                cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/4Suite-XML-1.0.2
		patch -p1 < ${srcdir}/python2.6.patch.txt || return 1
		msg "Building and installing 4Suite-XML, be aware this may take a while ..."
                python2 setup.py config || return 1
                python2 setup.py build || return 1
                install -d ${pkgdir}/usr/share/4suite-xml || return 1
                install -d ${pkgdir}/usr/share/4suite-xml/docs || return 1
                install -d ${pkgdir}/usr/share/4suite-xml/locale || return 1
                install -d ${pkgdir}/usr/share/4suite-xml/etc || return 1
                sed -i "s|/local/|/|" config.cache || return 1
                sed -i "s|/usr/local/doc/|/usr/share/4suite-xml/docs/|" config.cache || return 1
                sed -i "s|\$name|4share-xml|" config.cache || return 1
                sed -i "s|/usr/share/locale|/usr/share/4share-xml/locale|" config.cache || return 1
                sed -i "s|/usr/etc/4share-xml|/usr/share/4share-xml/etc|" config.cache || return 1
                python2 setup.py install --root=${pkgdir}/ --optimize=1 --with-docs || return 1
                # 4suite-xml post install
                install -d ${pkgdir}/usr/share/licenses/4suite-xml || return 1
                install -D -m644 COPYRIGHT ${pkgdir}/usr/share/licenses/4suite-xml || return 1
                cp -pR README docs test ${pkgdir}/usr/share/4suite-xml/ || return 1

		# python-vdebug install
		msg "Building and installing python-vdebug ..."
 		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src
		unzip vdebug-022710.zip	|| return 1
		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/vdebug-022710
		python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
		# vdebug post install
		####install -d ${pkgdir}/usr/share/vdebug || return 1
		####install -D -m644 README ${pkgdir}/usr/share/vdebug/README || return 1

		# python-psutil install
		msg "Building and installing python-psutil ..."
		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src
		tar xzf psutil-0.2.0.tar.gz || return 1
		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/psutil-0.2.0
		python2 setup.py config || return 1
		python2 setup.py build || return 1
		python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1

		# python-pyvmware install
		msg "Building and installing python-pyvmware ..."
		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src
		unzip -d pyvmware pyvmware-0.1-src.zip || return 1
		cd ${srcdir}/${_pkgname}-${pkgver}-src/dependencies/src/pyvmware
		python2 setup.py config || return 1
		python2 setup.py build || return 1
		python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1

		# peach install
		msg "Building and installing peach ..."
		cd ${srcdir}/${_pkgname}-${pkgver}-src
                for pfuzzcp in defaults.xml peach.py peach.xsd peachvalidator.pyw repro.xml template.xml docs samples test tools Peach; do
			cp -pR ${pfuzzcp} ${pkgdir}/usr/share/${pkgname}/ || return 1
                done
                for pfuzzdocscp in changelist.txt readme.html; do
			cp -pR ${pfuzzdocscp} ${pkgdir}/usr/share/${pkgname}/docs/ || return 1
                done
		# fix an error with 

  #create startup app
  msg "Creating a startup app => /usr/bin/peach"
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "cd /usr/share/peach" >> ${pkgdir}/usr/bin/${pkgname}
  echo "python2 peach.py \"\$@\"" >> ${pkgdir}/usr/bin/${pkgname}
  echo "cd -" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}

  #notify user
  echo ""
  echo "[+] run '/usr/bin/peach' to call the peach fuzzer" 
  echo "[+] run 'peach samples/HelloWorld.xml' to verify your peach installation."
  echo ""
}
