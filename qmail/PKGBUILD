# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=qmail
pkgver=1.03
pkgrel=2
pkgdesc="The second most popular MTA in the internet"
url="http://www.qmail.org"
license=(public-domain)
depends=('glibc' 'ipsvd' 'runit' 'checkpassword-pam' 'ucspi-ipc')
arch=('i686')
provides=('qmail')
install=qmail.install
source=(http://cr.yp.to/software/$pkgname-$pkgver.tar.gz 	\
      syncdir.c							\
      qmail-1.03-errno.patch					\
      qmail-1.03-msglog.patch					\
      qmtpd-badmailfrom-1.1.patch 				\
      qmail-1.03-showctl.patch					\
      qmail-1.03-bind-interface.patch				\
      big-todo.patch						\
      qmail-1.03-install-path-big-todo.patch			\
      qmail-1.03-autouidgid.patch				\
      qmail-1.03-syncdir.patch					\
      qmail-1.03-pop3d-stat.patch				\
      qmail-1.03-queuevar.patch					\
      big-concurrency.patch					\
      qmail-1.03-qmtpc-mailroutes-1.5.patch 			\
      qmail-0.0.0.0.patch					\
      ext_todo-20030105.patch					\
      ext_todo-20020524-add-big-todo.patch 			\
      netqmail-1.05-ucspitls-0.3.patch				\
      qmail-1.03-quotas-1.1.patch				\
      qmail-maildir++-universal.patch				\
      qmail-queue-custom-error.patch				\
      qmail-authentication-064.patch				\
      qmail-remote-auth.patch					\
      qmail-1.03-bigdns.patch					\
      qmail-1.03-rfc2821.patch					\
      qmail-1.03-doublebounce-trim.patch			\
      qmail-1.03-spp.patch 					\
      http://qmail.jms1.net/patches/qmail-date-localtime.patch	\
      http://www.netmeridian.com/e-huss/queue-fix.tar.gz	\
      http://www.qmail.org/queue-fix-todo.patch 		\
      queue-fix-errno.patch					\
      qmail-rhconfig						\
      datemail							\
      mailq							\
      run-functions						\
      makerules							\
      services.tar.gz
      )

md5sums=('622f65f982e380dbe86e6574f3abcb7c'
         'f9e69afdf7fe0bc8547c865919b01bb3'
         '1806b4cc25597e106a9e8e27ac62a03c'
         '76f2ed581176aa906b507435cc416cf8'
         '34d59d4e93897790055d562788623b21'
         '904ec650848677bcbfe6ad1d0f55c5a4'
         '8bb5e1a76d346a7062e3f57b10df5f85'
         'ce3d1fadcf441c434479d91455b60adf'
         '5268d64e0de60eb1bc06abfb0399db78'
         'f8d8a58273c557960317e30652ad43df'
         '2e39d7a056cf33e7467029c50d985954'
         'c3d8d7dc9db4588f8573e07dd59382e8'
         '2c4ef26ddc2b3614c2972765365883ae'
         '66fdd0cf5e49f87b5134d076946d0cf3'
         '821dff356c9dbca644ba3956e86acdcf'
         '8edda59102180973dd1bb546da7de160'
         '9ff2f52db53242da0a196bc4fedbae62'
         'bd8d874604e39d7994408be5b5049bbb'
         '9543ab0ac2ece0540a822b43edeeec16'
         '8ef1833aa2b063470099c0c309a529df'
         'fa77cf624461f30e37c1adc20a7ab651'
         '88c05425b8c20d748ab85739d8ffeb28'
         '88333425eb93f87c2567e666cde46d78'
         'acdb8621767165598baaf7b69136e0e2'
         'e1d696cd2762b525c6f7ba1d302b97c5'
         'a554edeafd43df65f2ce868e73b28d38'
         '9f726c6e7f846424c233fed0587ab530'
         '38890e2abc26d2fa0a2c8180b5089d69'
         'd566e8bd99b33efee0194e855b8d6995'
         '43f915c104024e6f33a5b3ff52dfb75b'
         'cbebb217b1b3b32f20995f2c869f6121'
         'cb4fef6f8d2003661632a8395f8430f3'
         '8252e1212c97aab8da6640992ff92661'
         'fb9e338b59358ab85fe9691588c83ab4'
         '306b60c140a8a8104b397d31fa5e455f'
         '254ae5d0d8fe333bb76be470e9b9acd3'
         'fa20700c5b781f874bfa18afc4bbcc64'
         '84e67354be30817933976df76a7e66ff')

build() {
  
install -d $startdir/pkg/usr/bin $startdir/pkg/usr/sbin
  
###############################################
## Build queue-fix
###############################################

  cd $startdir/src/queue-fix-1.4
  patch -p1 < ../queue-fix-todo.patch  || return 1
  patch -p1 -R < ../queue-fix-errno.patch  || return 1
  make || return 1
  install -m 0755 queue-fix $startdir/pkg/usr/bin

###############################################
## Build qmail
###############################################

  cd $startdir/src/$pkgname-$pkgver
  
  # Patch to fix compilation on modern Linux
  patch -p1 < ../qmail-1.03-errno.patch || return 1
  # If you enable this one, a copy of every mail will  be 
  # sent to the msglog account 
  #patch -p1 < ../qmail-1.03-msglog.patch || return 1 
  patch -p1 < ../qmtpd-badmailfrom-1.1.patch || return 1
  patch -p1 < ../qmail-1.03-showctl.patch  || return 1
  patch -p1 < ../qmail-1.03-bind-interface.patch || return 1
  patch -p1 < ../big-todo.patch || return 1
  patch -p1 < ../qmail-1.03-install-path-big-todo.patch || return 1 
  patch -p1 < ../qmail-1.03-autouidgid.patch || return 1
  patch -p1 < ../qmail-1.03-syncdir.patch || return 1
  patch -p1 < ../qmail-1.03-pop3d-stat.patch || return 1
  patch -p1 < ../qmail-1.03-queuevar.patch || return 1 
  patch -p1 < ../big-concurrency.patch || return 1
  patch -p1 < ../qmail-1.03-qmtpc-mailroutes-1.5.patch || return 1
  patch -p1 < ../qmail-0.0.0.0.patch || return 1
  patch -p1 < ../ext_todo-20030105.patch || return 1
  patch -p1 < ../ext_todo-20020524-add-big-todo.patch || return 1
  patch -p1 < ../netqmail-1.05-ucspitls-0.3.patch || return 1
  patch -p1 < ../qmail-1.03-quotas-1.1.patch || return 1
  patch -p1 < ../qmail-maildir++-universal.patch || return 1
  patch -p1 < ../qmail-queue-custom-error.patch || return 1
  patch -p1 < ../qmail-authentication-064.patch || return 1 
  patch -p1 < ../qmail-remote-auth.patch || return 1 
  patch -p1 < ../qmail-1.03-bigdns.patch || return 1 
  patch -p1 < ../qmail-1.03-rfc2821.patch || return 1 
  patch -p1 < ../qmail-1.03-doublebounce-trim.patch || return 1 
  patch -p1 < ../qmail-1.03-spp.patch || return 1
  # Changes dates in headers to localtime 
  patch -p1 < ../qmail-date-localtime.patch || return 1

  fds=`ulimit -n`
  let spawnlimit='(fds-6)/2'
  echo $spawnlimit >conf-spawn

  cp ../syncdir.c .
  
  make compile makelib
  ./compile syncdir.c
  ./makelib libsyncdir.a syncdir.o
  make it man


for BIN in 	bouncesaying	\
		condredirect	\
		../datemail	\
		elq		\
		except		\
		forward		\
		ipmeprint	\
		maildir2mbox	\
		maildirmake	\
		maildirwatch	\
		mailsubj	\
		make-owners	\
		pinq		\
		predate		\
		preline		\
		qail		\
		qbiff		\
		qmail-inject	\
		qmail-pop3d	\
		qmail-qmqpc	\
		qmail-qmqpd	\
		qmail-qmtpd	\
		qmail-qread	\
		qmail-qstat	\
		qmail-showctl	\
		qmail-smtpd	\
		qmail-tcpok	\
		qmail-tcpto	\
		qreceipt	\
		qsmhook		\
		../qmail-rhconfig	\
		tcp-env		\
		../mailq	\
		../makerules

do
	install -m 0755 $BIN $startdir/pkg/usr/bin 
done

for BIN in	qmail-clean	\
		qmail-getpw	\
		qmail-local	\
		qmail-pw2u	\
		qmail-remote	\
		qmail-rspawn	\
		qmail-send	\
		qmail-todo	\
		splogger	
do
	install -m 0711 $BIN $startdir/pkg/usr/bin 
done

for BIN in	qmail-lspawn	\
		qmail-newmrh	\
		qmail-newu	\
		qmail-popup	\
		qmail-start	
do
	install -m 0700 $BIN $startdir/pkg/usr/bin 
done

install -m 4711 qmail-queue $startdir/pkg/usr/bin

install -m 0755 sendmail $startdir/pkg/usr/sbin

install -d $startdir/pkg/etc/qmail/{alias,control,users,owners,plugins}
install -d $startdir/pkg/var/qmail/

# Set up all the symlinks so regular qmail users find their stuff
ln -s /etc/qmail/{alias,control,users,owners,plugins} $startdir/pkg/var/qmail/ 
ln -s /usr/bin $startdir/pkg/var/qmail/bin
ln -s /usr/man $startdir/pkg/var/qmail/man
 
rm error.3
for N in 0 1 3 5 7 8 9
do
	install -d $startdir/pkg/usr/man/man$N
	install -m 0644 *.$N $startdir/pkg/usr/man/man$N
done

# Shell script helper

install -d $startdir/pkg/usr/share/qmail
install -m 644 ../run-functions $startdir/pkg/usr/share/qmail 

# smtpplugins file
touch $startdir/pkg/etc/qmail/control/smtpplugins

# runit services

  install -d $startdir/pkg/etc/sv
  cd $startdir/src/services
  cp -Rv * $startdir/pkg/etc/sv
}
